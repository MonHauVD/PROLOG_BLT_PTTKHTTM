domains
	namelist = name*
	name = symbol
predicates
	member(name,namelist).
	s1
	s2
	run
	
	start
	run0(integer)
	do_sums
	set_up_windows
	clear_windows

clauses
	member(Name,[Name|_]).
	member(Name,[_|Tail]) if member(Name,Tail).

	s1 :- 
		member(susan,[ian,susan,john]),
		write("1");
		write("2").
	s2 :-
		X = sqrt(4),
		write("Hi", X).
%-----------------Go run de bat dau		
	run :-
		makewindow(1,20,7,"A blue window" ,2,5,10,50),
		write("The characters are red" ),
		makewindow(2,184,7,"A light cyan window" ,14,55,10,20),
		write("Thiswindow is light cyan and the "),
		write("Letters are black and blink. " ),
		write("Please type an integer to exit."),nl,
		readint(_),
		removewindow,
		readint(_),
		removewindow,
		readint(_),
		write(" Notice where the integer appears").
%--------------------------------------- go start de bat dau	
		
	start :-
		set_up_windows,do_sums.
	set_up_windows :-
		makewindow(1,7,7,"",0,0,25,80),
		makewindow(1,7,7,"Left operand" ,2,5,5,25),
		makewindow(2,7,7,"",2,35,5,10),
		nl,write(" PLUS " ),
		makewindow(2,7,7,"Right operand " ,2,50,5,25),
		makewindow(3,7,7,"Gives " , 10,30,5,25),
		makewindow(4,7,7,"",20,30,5,35).
	do_sums :-
		run0(_),clear_windows,do_sums.
	run0(Z) :-
		shiftwindow(1),
		cursor(2,1),readint(X),
		shiftwindow(2),
		cursor(2,10),readint(Y),
		shiftwindow(3),Z=X+Y,cursor(2,10),write(Z),
		shiftwindow(4),
		write(" Please press the space bar"),
		readchar(_).
	clear_windows :-
		shiftwindow(1),clearwindow,
		shiftwindow(2),clearwindow,
		shiftwindow(3),clearwindow,
		shiftwindow(4),clearwindow.

	