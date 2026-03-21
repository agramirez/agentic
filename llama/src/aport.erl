-module(aport).
-export([test/0]).
-export([add/2]).
-nifs([add/2]).
-on_load(init/0).

init() ->
    % The NIF library file should be compiled and moved to a 'priv' directory 
    % in your Erlang project's root, e.g., priv/libyour_crate_name.so
    case erlang:load_nif("/workspace/llama/priv/libllama", 0) of
        ok -> ok;
        {error, Reason} -> erlang:nif_error(Reason)
    end.

% The stub implementation
add(_A, _B) ->
    erlang:nif_error(nif_not_loaded).

-define(DEFAULT_TIMEOUT,1000*60). % 1 minute

-doc """
# test
tests the access to a port available executable.
""".
-spec test() -> ok.
test() ->
    Model="/usr/local/share/gguf/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf",
    Prompt="What is your name?",
    OutputFile="response.txt",
    spawn_llama_completion(Model,Prompt,OutputFile,self()),
    receive
        {ok, FileName}  ->
            logger:info("processed question and placed response in: ~p",[FileName]);
        {error, Reason, _FileName} ->
            logger:error("Could not complete because: ~p",[Reason])
    after ?DEFAULT_TIMEOUT ->
        logger:warning("Batch process timed out")
    end,
    ok.


spawn_llama_completion(Model,Prompt,OutputFile,ParentPid) ->
    Args = ["-m", Model,"-p",Prompt
            ,"--temp","0.0","-s","100", "-n","100"
            ,"--offline", "-no-cnv","--simple-io","--log-disable","--log-file","sample.log"],
    PortArgs = [{args, Args}
                , use_stdio
                , exit_status
                , binary
                ,{parallelism, true}
                ],

    Port = open_port({spawn_executable, os:find_executable("llama-completion")}, PortArgs),
    io:format("Opened port ~p~n", [Port]),
    port_loop(Port, OutputFile, ParentPid).

port_loop(Port, OutputFile, ParentPid) ->
    receive
        {Port, {data, _Data}}    ->
            % io:format("ffmpeg data: ~p~n", [Data]),
            port_loop(Port, OutputFile, ParentPid);
        {Port, {exit_status, 0}}    ->
            ParentPid ! {ok, OutputFile};
        {Port, {exit_status, ErrorCode}}    ->
            ParentPid ! {error, ErrorCode, OutputFile};
        {'EXIT', Port, Reason}  ->
            ParentPid ! {error, Reason, OutputFile}
    end.