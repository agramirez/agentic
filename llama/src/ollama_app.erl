%%%-------------------------------------------------------------------
%% @doc llama public API
%% @end
%%%-------------------------------------------------------------------

-module(llama_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    llama_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
