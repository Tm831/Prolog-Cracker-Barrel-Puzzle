%% Thomas Miller
%% CSCE 4430
%% Assignment 6, Cracker Barrel puzzle

%allows for the use of maplist
:- use_module(library(lambda)).

go :-
	go(Moves).
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute solution
%
go(Moves) :-
%Creates first board starting as position 0
	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves), 
	writeln('===== 0 ====='),
	display(Moves, [1]),
%Creates second board starting as position 1
	play([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves2),
	writeln('===== 1 ====='),
	display(Moves2, [2]),
%Creates third board starting as position 2
	play([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves3),
	writeln('===== 2 ====='),
	display(Moves3, [3]),
%Creates fourth board starting as position 3
	play([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], Moves4),
	writeln('===== 3 ====='),
	display(Moves4, [4]),
%Creates fifth board starting as position 4
	play([5], [1,2,3,4,6,7,8,9,10,11,12,13,14,15], [], Moves5),
	writeln('===== 4 ====='),
	display(Moves5, [5]).
 
play(_, [_], Lst, Moves) :-
	reverse(Lst, Moves).
 
play(Free, Occupied, Lst, Moves) :-
	select(S, Occupied, Oc1),
	select(O, Oc1, Oc2),
	select(E, Free, F1),
	move(S, O, E),
	play([S, O | F1], [E | Oc2], [move(S,O,E) | Lst], Moves).
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% allowed moves
%move(S,num,E), this flips the piece from S to E and removes num(makes .)
move(S,2,E) :-
	member([S,E], [[1,4], [4,1]]).
move(S,3,E) :-
	member([S,E], [[1,6], [6,1]]).
move(S,4,E):-
	member([S,E], [[2,7], [7,2]]).
move(S,5,E):-
	member([S,E], [[2,9], [9,2]]).
move(S,5,E):-
	member([S,E], [[3,8], [8,3]]).
move(S,6,E):-
	member([S,E], [[3,10], [10,3]]).
move(S,7,E):-
	member([S,E], [[4,11], [11,4]]).
move(S,8,E):-
	member([S,E], [[4,13], [13,4]]).
move(S,8,E):-
	member([S,E], [[5,12], [12,5]]).
move(S,9,E):-
	member([S,E], [[5,14], [14,5]]).
move(S,9,E):-
	member([S,E], [[6,13], [13,6]]).
move(S,10,E):-
	member([S,E], [[6,15], [15,6]]).
move(S,5,E):-
	member([S,E], [[4,6], [6,4]]).
move(S,8,E):-
	member([S,E], [[9,7], [7,9]]).
move(S,9,E):-
	member([S,E], [[10,8], [8,10]]).
move(S,12,E):-
	member([S,E], [[11,13], [13,11]]).
move(S,13,E):-
	member([S,E], [[12,14], [14,12]]).
move(S,14,E):-
	member([S,E], [[15,13], [13,15]]).
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% display soluce
%
display(Sol) :-
	display(Sol, [1]).

%Creates board with starting piece at x
display([], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = '.'; I = 'x'),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	writeln(' '). 
 
%does the moves(S, num, E), prints updated pieces of game
display([move(Start, Middle, End) | Tail], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = '.'; I = 'x'),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('    ~w        ~n', [I1]),
	format('   ~w ~w      ~n', [I2,I3]),
	format('  ~w ~w ~w    ~n', [I4,I5,I6]),
	format(' ~w ~w ~w ~w  ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	writeln(' '),
	select(End, Free, F1),
	display(Tail,  [Start, Middle | F1]).



