%% @author tukna
%% @doc @todo Add description to chat_server.


-module(chat_server).
-behaviour(gen_server).

-export([start/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

start() ->
    Return = gen_server:start_link({local, chat_server}, chat_server, [], []),
    io:format("start_server: ~p~n", [Return]),
    Return.

init([]) ->
    State = [],
    Return = {ok, State},
    io:format("init: ~p~n", [State]),
    Return.
	
handle_call(get_status, _From, State) ->
    Reply = get_status_ok,
    {reply, Reply, State};
	
handle_call({send,Mess}, From, State) ->
    io:format("Message from ~p ~n",[From]),
	io:format("~p ~n",[Mess]),
    {reply, ok, State};

handle_call(Request, From, State) ->
    io:format("handle_call ex ~p ~n",[Request]),
    Reply = ok,
    Return = {reply, Reply, State},
    io:format("handle_call: ~p~n", [Return]),
    Return.

handle_cast({send,Mess}, State) ->
    io:format("Receive msg from handle_cast: ~p~n", [Mess]),
    {noreply, State};

handle_cast(Msg, State) ->
    Return = {noreply, State},
    io:format("handle_cast: ~p~n", [Return]),
    Return.
	

handle_info(_Info, State) ->
    Return = {noreply, State},
    io:format("handle_info: ~p~n", [Return]),
    Return.

terminate(_Reason, _State) ->
    Return = ok,
    io:format("terminate: ~p~n", [Return]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    Return = {ok, State},
    io:format("code_change: ~p~n", [Return]),
    Return.
