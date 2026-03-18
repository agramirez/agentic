llama
=====

An OTP application that serves as a wrapper and gateway for the llama.cpp LLM inference agents.
It provides an Erlang wrapper around the core tools.

Run
---
```
> ./start.sh
```

The start script sets the `config/vm.args` path and starts a rebar3 based shell for the application using 
the settings in `config/sys.config`

Build
-----
```
> rebar3 compile
```