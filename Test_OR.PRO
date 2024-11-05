domains
    str = string.

predicates
    check_input.
    process_input(str).

clauses
    check_input :-
        write("Please enter (y/Y for OK, n/N for NO): "),
        readln(Input),
        process_input(Input).

    process_input("y") :-
        write("OK"), nl.
    process_input("Y") :-
        write("OK"), nl.
    process_input("n") :-
        write("NO"), nl.
    process_input("N") :-
        write("NO"), nl.
    process_input(_) :-
        write("Invalid input, please try again"), nl,
        check_input.

goal
    check_input.
