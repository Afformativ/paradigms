states([q0, q1, q2]).
symbols([a, b]).
transition(q0, a, q1).
transition(q0, b, q2).
transition(q1, a, q3).
transition(q1, b, q1).
transition(q2, a, q2).
transition(q2, b, q3).
transition(q3, a, q1).
transition(q3, b, q3).
startState(q0).
finalStates([q3]).

search(0, S, []) :-
    finalStates(FinalStates),
    member(S, FinalStates).
search(N, S1, [Head|Tail]) :-
    N > 0,
    transition(S1, Head, S2),
    M is N - 1,
    search(M, S2, Tail).

test(N, Transitions) :-
    startState(S),
    search(N, S, Transitions).
