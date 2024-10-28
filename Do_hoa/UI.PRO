DOMAINS
    name = string
    names = name*
    score = real
    scores = score*

PREDICATES
    get_user_name(name)
    main
    check_name(name) % Predicate to check if the name is valid
    string_length(string, integer)  % Helper predicate to get the length of the string
    nhap_ky_hoc(integer)
    nhap_nam_hoc(integer)
    check_below(integer, integer)
    get_year_term(integer, integer)
    string_list(names)
    advice(names)
    show_advice(names)
    display_table(names, integer, integer)
    length_of_list(names, integer)
    read_n_scores(integer, scores, integer)
    read_valid_score(score, integer)
    check_score(score, integer)

% makewindow(
    	%	id_,
    	%	background_textColor,	borderColor,
    	%	title,
    	%	row,	col,
    	%	width,	height)	// max = 25 x 80
CLAUSES
    string_list(["Vat ly ung dung", "Phan tich thiet ke", "He thong thong minh", "Lap trinh web", "Lich su dang", "The chat", "Lap trinh web"]).
    advice(["Vat ly ung dung", "Phan tich thiet ke", "He thong thong minh", "Lap trinh web", "Lich su dang", "The chat", "Lap trinh web"]).
	
	main :-
        % can shifwindow(id) de write() vao cua so do.
        % shiftwindow co the lam cac cua so lon hon hien len tren -> che mat cac window nho hon o ben duoi
		makewindow(1, 113, 113,"BTL",0,0,25,80),                % window nay la background
		get_user_name(Username)                                 % Username -> ten nguoi dung
        ,get_year_term(Year, Term)                              % Year, Term -> nam hoc, ky hoc
        ,makewindow(10, 113, 113, "Advice", 5, 40, 20, 40)      % id = 10 -> cua so advice
        % ,makewindow(11, 113, 113, "", 5, 0, 20, 40)             % nothing :v
        ,string_list(Ls)                                        % Ls -> Danh sach mon hoc (demo)
        % Title row
        ,makewindow(12, 113, 113, "", 5, 0, 3, 30), write("Subject")
        ,makewindow(13, 113, 113, "", 5, 30, 3, 10), write("Score")
        % Rows
        ,display_table(Ls, 1, 7)
        ,length_of_list(Ls, Length)
        ,read_n_scores(Length, Scores, Length)                  % Score -> danh sach diem read duoc
        ,shiftwindow(10)

        % for debug only
        ,write(Scores)
        ,readchar(_)
        % 

        % 
        ,advice(Advice)                                         %Advice -> danh sach loi khuyen (Demo)
        ,show_advice(Advice)                                    %
        . 
    

    get_user_name(Username):-
        makewindow(2, 49, 49, "Type Your Name", 1,5, 3, 25),
        readln(Username),
        check_name(Username),  % Check if the name is valid
        !,  % Cut if the name is valid to stop further checks
        shiftwindow(1),
    	clearwindow,
        makewindow(2, 49, 49, "Name", 1, 5, 3, 25),  write(Username).
    
    get_user_name(Username):-
        shiftwindow(1), cursor(4, 5), write("Invalid Name. Try again!"),
        get_user_name(Username).

    % ham check ten valid. (Demo)
    % Replace this
    check_name(Name) :-
        string_length(Name, Length),
        Length >= 3.  % Check if the length of the name is at least 3 characters

    % Helper predicate to calculate the length of the string
    string_length(S, L) :-
        str_len(S, L).  % Built-in Turbo Prolog function to get string length
    
    get_year_term(Year, Term) :-
        makewindow(3, 49, 49, "Type year", 1, 35, 4, 12),
        makewindow(4, 49, 49, "Type term", 1, 50, 4, 12),
        nhap_nam_hoc(Year),
        nhap_ky_hoc(Term).

    nhap_nam_hoc(Year):-
        shiftwindow(3),
        readint(Year),
        check_below(Year, 4),!,     % thay doi ham check nam hoc o dayyy
        removewindow(3,1), makewindow(3, 49, 49, "Year", 1, 35, 3, 10), write(Year).

    nhap_nam_hoc(Year):-
        clearwindow
        ,write("Try again! ")
        ,nhap_nam_hoc(Year).

    % Ham check nam hoc
    % Replace this
    check_below(Year, Below):-
        Year >= 1,
        Year <= Below.

    nhap_ky_hoc(Term):-
        shiftwindow(4),
        readint(Term),
        check_below(Term, 2), !,      % thay doi ham check nam hoc o dayyy
        removewindow(4,1), makewindow(4, 49, 49, "Term", 1, 50, 3, 10), write(Term).

    nhap_ky_hoc(Term):-
        clearwindow
        ,write("Try again! ")
        ,nhap_ky_hoc(Term).

    display_table([Head|Tail], Id, Row) :-
        Id2 = Id + 1,
        Row2 = Row + 2,
        makewindow(Id2, 113, 113, "", Row, 0, 3, 30),
        cursor(0,3), write(Head),
        makewindow(Id, 113, 113, "", Row, 30, 3, 10),
        display_table(Tail, Id2, Row2).

    display_table([], Id, Row):-
        shiftwindow(10).

    length_of_list([], 0).  % Base case: the length of an empty list is 0
    length_of_list([_ | Tail], Length) :-  % Recursive case
        length_of_list(Tail, TailLength),  % Get length of the tail
        Length = TailLength + 1.           % Add 1 for the head


    read_n_scores(0, [], _).  % Base case: if N is 0, return an empty list
    read_n_scores(N, [Float | Floats], Length) :-  
        N > 0,  % Ensure N is greater than 0
        Window = Length - N +1,
        shiftwindow(Window),
        % write("Enter float "), write(N), write(": "), flush_output(current_output),  % Prompt the user
        read_valid_score(Float, Window),  % Read a float from input
        N1 = N - 1,  % Decrement N
        cursor(0,2), write(Float),
        read_n_scores(N1, Floats, Length).  % Recursive call to read the next float

    % read_real_score(Float):-



    read_valid_score(Score, Window) :-
        readreal(Score),
        shiftwindow(10), clearwindow, shiftwindow(Window),
        check_score(Score,  Window),
        !,
        cursor(0,2), write(Score)
        .
    read_valid_score(Score, Window) :-
        shiftwindow(10),clearwindow, write("Invalide scores!"),
        shiftwindow(Window),
        read_valid_score(Score, Window).

    % Predicate to check if the score is valid
    % Can replace this
    check_score(Input, _) :-      % Check if the input is a number
        Input >= 0,            % Check if input is greater than or equal to 0
        Input <= 10.        % If valid, assign input to Score

    show_advice([Head|Tail]):-
        clearwindow,
        write(Head), nl,nl,
        write("Press any key to continue..."), nl,
        readchar(_),
        show_advice(Tail).
        
GOAL
    main.  % Start the countdown from 5