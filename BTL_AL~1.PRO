% BTL alpha
domains
    i = integer
    r = real
	sb = symbol
	ar = r*
	as = sb*
database
	ten_nguoi_dung(symbol)
	mon_hoc(symbol, real)
predicates
	member(r, ar)
	is_empty_ls(ar)
	is_not_empty_ls(ar)
	
	len_list(ar, r)
	sum_list(ar, r)
	averager(ar, r)
	nhap_mang(ar, r)
	in_mang(ar)
	in_mang2(ar)
	
	cmp_str(sb, as, i)
	cmp_str1(sb, as, i, i)
	ktraten(sb, i)
	
	lay_ds_mon(i, i, as)
	nhap_diem(as)
	nhap_diem_lai(as)
	ktra_diem_nhap(r, as)
	
	lay_ds_diem(ar)
	tinh_tb(r)
	s
	
	
clauses
	member(X, [X | _]).
	member(X, [_ | T]) :-
		member(X, T).
		
	is_empty_ls([]) :- !.
	is_empty_ls([_|_]) :- fail.
	is_not_empty_ls([_|_]).
	
	len_list([], 0) :- !.
	len_list([_|T], Len) :-
		len_list(T, Len1),
		Len = Len1 + 1.
	
		
	sum_list([], 0).
	sum_list([H|T], Sum) :-
		sum_list(T, Rest),
		Sum = H + Rest.
	
	averager(List, Res) :-
		sum_list(List, Sum),
		len_list(List, Len),
		%write("Sum = ", Sum, "; Len = ", Len), nl,
		Len <> 0,
		Res = Sum/Len;
		Res = 0.

	nhap_mang([X|Mang], N) :-
		N > 0,
		write("Nhap phan tu: "),
		readreal(X),
		N2 = N - 1,
		nhap_mang(Mang, N2).
		
	nhap_mang([],N) :- N = 0.

	in_mang(Mang):- write("["),
					in_mang2(Mang).
					
	in_mang2([]).
	
	in_mang2([H|T]) :-
		is_not_empty_ls(T),
		write(H),
		write(", "),
		in_mang2(T);
		write(H),
		write("]").
	
	cmp_str(S0, [S0|_], 0) :- !.	
	cmp_str(_, [], -1) :- !.
	cmp_str(S0, List, Res) :-
		cmp_str1(S0, List, Res, 0).
		
	cmp_str1(_, [], -1, _) :- !.
	
	cmp_str1(S0, [H|T], Res, It):-
		S0 = H,
		Res = It + 0;
		It2 = It + 1,
		cmp_str1(S0, T, Res, It2).
		
	ktraten(S0, Res) :-
		Ten_ko_Hop_le = ["abc", "aaa", "123"],
		cmp_str(S0, Ten_ko_Hop_le, Res).
	
	lay_ds_mon(Nam, Ki, Ds_mon) :-
		Nam = 1, Ki = 1,
			Ds_mon = ["A11", "B11", "C11", "D11", "E11"];
		Nam = 1, Ki = 2,
			Ds_mon = ["A12", "B12", "C12", "D12", "E12"];
		Nam = 2, Ki = 1,
			Ds_mon = ["A21", "B21", "C21", "D21", "E21"];
		Nam = 2, Ki = 2,
			Ds_mon = ["A22", "B22", "C22", "D22", "E22"];
		Nam = 3, Ki = 1,
			Ds_mon = ["A31", "B31", "C31", "D31", "E31"];
		Nam = 3, Ki = 2,
			Ds_mon = ["A32", "B32", "C32", "D32", "E32"];
		Nam = 4, Ki = 1,
			Ds_mon = ["A41", "B41", "C41", "D41", "E41"];
		Nam = 4, Ki = 2,
			Ds_mon = ["A42", "B42", "C42", "D42", "E42"];
		Nam = 5, Ki = 1,
			Ds_mon = ["A51", "B51", "C51", "D51", "E51"];
		Ds_mon = [].
	
	nhap_diem([]).
	nhap_diem([H|T]) :-
		write("Nhap diem mon: ", H), nl,
		readreal(Diem),
		ktra_diem_nhap(Diem, [H|T]).
	ktra_diem_nhap(Diem, [H|T]) :-
		Diem >= 0.0, Diem <= 10.0,
		assert(mon_hoc(H, Diem)),
		nhap_diem(T);
		nhap_diem_lai([H|T]).
	nhap_diem_lai([H|T]) :-
		write("Dieu kien 0 <= diem <= 10\nNhap lai diem mon: ", H), nl,
		readreal(Diem),
		ktra_diem_nhap(Diem, [H|T]).
	
	
	lay_ds_diem(Ds_diem) :-
		findall(Diem, mon_hoc(_, Diem), Ds_diem).

	tinh_tb(Diem_tb) :-
		lay_ds_diem(Ds_diem),
		%write("Ds diem: ", Ds_diem), nl,
		averager(Ds_diem ,Diem_tb).
	


s :- write("Hay nhap ten cua ban: "),
	readln(Name),
	assert(ten_nguoi_dung(Name)),
	ktraten(Name, IsValidName),
	%write("IsValidName = ", IsValidName), nl,
	IsValidName <> -1, % Neu ten khong hop le
		retract(ten_nguoi_dung(Name)),
		write("Ten khong hop le! Ket thuc chuong trinh."), nl		
	;
	write("Nhap nam hoc thu (1, 2, 3, 4, 5): "), nl,
	readint(Nam),
	write("Nhap hoc ki (1, 2): "), nl,
	readint(Ki),
	lay_ds_mon(Nam, Ki, Ds_mon),
	nhap_diem(Ds_mon),
	tinh_tb(Diem_tb),
	write("Diem trung binh: ", Diem_tb), nl,
	ten_nguoi_dung(Name),
	write("Cam on ", Name, " da su dung chuong trinh cua nhom 2!\n").

 