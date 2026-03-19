-module(poc_SUITE).
-compile([export_all,nowarn_export_all]).
-moduledoc """
# Proof of Concept Common Test Suite

This module contains some proof of concept code that will be used to prove certain 
concepts.
""".

all() ->
    [llama_port_access].

-doc """
# Llama Port

A test to access the llama-cli 
""".
llama_port_access(_Config) ->
    ok.