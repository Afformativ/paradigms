div([], [], [], []).
div([X], [X], [], []).
div([X,Y], [X], [Y], []).
div([X,Y,Z|End], [X|XEnd], [Y|YEnd], [Z|ZEnd]):-
  div(End, XEnd, YEnd, ZEnd).
