# File: mix.exs
# This file was generated from rebar.config
# Using rebar3_elixir (https://github.com/G-Corp/rebar3_elixir)
# MODIFY IT AT YOUR OWN RISK AND ONLY IF YOU KNOW WHAT YOU ARE DOING!
defmodule Poolgirl.Mixfile do
  use Mix.Project

  def project do
    [
      app: :poolgirl,
      version: "1.3.0",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
       applications: [],
       env: [],
       mod: {:poolgirl_app, []}
    ]
  end

  defp deps do
    [
      {:doteki, git: "git://github.com/G-Corp/doteki.git", tag: "1.1.0"}
    ]
  end

  defp aliases do
    [compile: &compile_with_hooks/1]
  end

  defp compile_with_hooks(args) do
    pre_compile_hooks()
    result = Mix.Task.run("compile", args)
    post_compile_hooks()
    result
  end

  defp pre_compile_hooks() do
    run_hook_cmd [
    ]
  end

  defp post_compile_hooks() do
    run_hook_cmd [
    ]
  end

  defp run_hook_cmd(commands) do
    {_, os} = :os.type
    for command <- commands, do: (fn
      ({regex, cmd}) ->
         if Regex.match?(Regex.compile!(regex), Atom.to_string(os)) do
           Mix.Shell.cmd cmd, [], fn(x) -> Mix.Shell.IO.info(trim(x)) end
         end
      (cmd) ->
        Mix.Shell.cmd cmd, [], fn(x) -> Mix.Shell.IO.info(trim(x)) end
      end).(command)
  end

  defp trim(x) do
    if Version.compare(System.version, "1.5.0") == :lt do
      Kernel.apply(String, :strip, [x])
    else
      Kernel.apply(String, :trim, [x])
    end
  end
end
