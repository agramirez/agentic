%%%-------------------------------------------------------------------
%% @doc llama public API
%% @end
%%%-------------------------------------------------------------------

-module(llama_app).
-behaviour(application).

-include_lib("kernel/include/logger.hrl").

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    llama_sup:start_link().

stop(_State) ->
    ok.
