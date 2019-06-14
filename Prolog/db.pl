loves(romeo,juliet).

loves(juliet,romeo) :- loves(romeo,juliet).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :-
	happy(albert).

dances(alice) :-
	happy(alice),
	with_albert(alice).

does_alice_dance :- dances(alice),
	write('Ahen Alice is happy and with Albert she dances.').

swims(bill) :-
	happy(bill).

swims(bill) :-
	near_water(bill).

%===========
% Variables.
%===========
male(albert).
male(bob).
male(bill).
male(carl).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_grandchild :-
	parent(albert, X),
	parent(X, Y),
	write('Alberts grandchild is: '),
	write(Y), nl.

get_parent :-
	parent(X, carl),
	parent(X, charlie),
	format('~w ~s parent ~n', [X, "is the "]).

brother(bob, bill).

% Check if Carl has an uncle.
% parent(X, carl), brother(X, Y).

%=============================
% Axioms and derived facts.
%=============================
grandparent(X, Y) :-
	parent(X, Z),
	parent(Z, Y).

blushes(X) :- human(X).
human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo,X) :- stabs(X, mercutio, sword).

%=============================
% Replacement of 'if' statements
%=============================

what_grade(5) :- 
	write('Go to kindergarden.').

what_grade(6) :- 
	write('Go to 1st Grade.').

what_grade(Other) :- 
	Grade is Other - 5,
	format('Go to Grade ~w', [Grade]).


%=============================
% Structure
%=============================
% functor(?Term, ?Name, ?Arity)

% has(albert, olive).  -- This is unclear: who has who?

owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

% customer(sally, _, Bal).  %anonymous variable (e don't care about it)

get_cust_bal(FName, LName) :-
	customer(FName, LName, Bal),
	write(FName), tab(1), % this is 1 space
	format('~w owes us $~2f ~n', [LName, Bal]).

vertical(line(point(X,Y), point(X, Y2))).
horizontal(line(point(X,Y), point(X2, Y))).

% | ?- vertical(line(point(5,10), X)).

% X = point(5,_)


%=============================
% Trace
%=============================
warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X):-
	warm_blooded(X),
	produce_milk(X),
	have_hair(X).

%=============================
% Recursion
%=============================

related(X, Y) :-
	parent(X, Y).

related(X, Y) :-
	parent(X, Z),
	related(Z, Y).

double_digit(X, Y) :-
	Y is X*2.

is_even(X) :-
	% // is integer divigin (disregards decimals)
	Y is X//2, X =:= 2 * Y.

