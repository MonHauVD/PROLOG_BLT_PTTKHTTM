% BTL gamma
include "BTL_git/DB_prep.PRO"
domains
    i = integer
    r = real
	sb = symbol
	ar = r*
	as = sb*
/* Have included from file DB_prep.PRO
database
	is_prepared(integer)
	ten_nguoi_dung(symbol)
	nam_hoc_nguoi_dung(integer)
	hoc_ki_nguoi_dung(integer)
	diem_mon_hoc(symbol, real)
	ten_ko_hop_le(symbol)
	% mon_hoc(Nam_hoc, Hoc_ki, Ten_mon, Cac loi khuyen Gioi, Kha, TB, Yeu, Kem)
	mon_hoc(integer, integer, string, string, string, string, string, string)
*/
predicates
	checking_prepare
	member(r, ar)
	is_empty_ls(ar)
	is_empty_ls2(ar, i)
	is_not_empty_ls(ar)
	is_empty_ls_symbol(as, i)
	
	len_list(ar, r)
	sum_list(ar, r)
	averager(ar, r)
	nhap_mang(ar, r)
	in_mang(ar)
	in_mang2(ar)
	
	cmp_str(sb, as, i)
	cmp_str1(sb, as, i, i)
	nhap_ten_nguoi_dung
	ktraten(sb, i)
	nhap_nam_va_ki
	kiem_tra_nhap_ten
	kiem_tra_nam_va_ki(i, i)
	
	lay_ds_mon(i, i, as)
	nhap_diem(as)
	nhap_diem_lai(as)
	ktra_diem_nhap(r, as)
	
	lay_ds_diem(ar)
	nhap_diem_mon_hoc
	tinh_tb(r)
	
	dua_ra_loi_khuyen_tung_mon
	dua_ra_loi_khuyen_tong_quat(r)
	
	loi_khuyen(as, ar)
	loi_khuyen1(sb, r)
	loi_cam_on
	
	clear_db
	clear_db2
	s
	
	
clauses
	checking_prepare :-
		findall(Is_prepared, is_prepared(Is_prepared), Ds_prepare),
		is_empty_ls2(Ds_prepare, Res_empty_ls),
		%write("is Database prepared: ", Res_empty_ls), nl,
		Res_empty_ls = 0,
		prepare
		;!.
	
	
	clear_db :-
		retract(mon_hoc(_, _, _, _, _, _, _, _)),
		retract(ten_nguoi_dung(_)),
		retract(nam_hoc_nguoi_dung(_)),
		retract(hoc_ki_nguoi_dung(_)),
		retract(ten_ko_hop_le(_)),
		retract(diem_mon_hoc(_, _)),
        fail.
	clear_db.
	
	clear_db2 :-
		retract(ten_nguoi_dung(_)),
		retract(nam_hoc_nguoi_dung(_)),
		retract(hoc_ki_nguoi_dung(_)),
		retract(diem_mon_hoc(_, _)),
        fail.
	clear_db2.
	
	member(X, [X | _]).
	member(X, [_ | T]) :-
		member(X, T).

	is_empty_ls([]) :- !.
	is_empty_ls([_|_]) :- fail.
	is_empty_ls2(Ls, Res) :- 
		is_empty_ls(Ls),
		Res = 0;
		Res = 1.
	is_not_empty_ls([_|_]).
	
	is_empty_ls_symbol([], 1).
	is_empty_ls_symbol([_|_], 0).
	
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
		
	nhap_ten_nguoi_dung :-
		write("Hay nhap ten cua ban: "),
		readln(Name),
		assert(ten_nguoi_dung(Name)),
		kiem_tra_nhap_ten.
	kiem_tra_nhap_ten :-
		ten_nguoi_dung(Name),
		ktraten(Name, IsValidName),
		%write("IsValidName = ", IsValidName), nl,
		IsValidName <> -1, % Neu ten khong hop le
			retract(ten_nguoi_dung(Name)),
			write("Ten khong hop le! Ket thuc chuong trinh."), nl
		;!.
	
	ktraten(S0, Res) :-
		findall(Ten, ten_ko_hop_le(Ten), Ten_ko_Hop_le),
		cmp_str(S0, Ten_ko_Hop_le, Res).
		
	nhap_nam_va_ki :-
		write("Nhap nam hoc thu (1, 2, 3, 4, 5): "), nl,
		readint(Nam),
		assert(nam_hoc_nguoi_dung(Nam)),
		write("Nhap hoc ki (1, 2): "), nl,
		readint(Ki),
		assert(hoc_ki_nguoi_dung(Ki)),
		kiem_tra_nam_va_ki(Nam, Ki).
		
	
	kiem_tra_nam_va_ki(Nam, Ki) :-
		lay_ds_mon(Nam, Ki, Ds_mon),
		is_empty_ls_symbol(Ds_mon, Res),
		Res = 1,
		%retract(nam_hoc_nguoi_dung(Nam)),
		%retract(hoc_ki_nguoi_dung(Ki)),
		write("Nam va ki hoc khong co!\nXin vui long nhap lai"), nl,
		clear_db2,
		nhap_nam_va_ki; !.
	
	lay_ds_mon(Nam, Ki, Ds_mon) :-
		findall(Ten_mon, mon_hoc(Nam, Ki, Ten_mon, _, _, _, _, _), Ds_mon).
	
	nhap_diem([]).
	nhap_diem([H|T]) :-
		write("Nhap diem mon: ", H), nl,
		readreal(Diem),
		ktra_diem_nhap(Diem, [H|T]).
	ktra_diem_nhap(Diem, [H|T]) :-
		Diem >= 0.0, Diem <= 10.0,
		assert(diem_mon_hoc(H, Diem)),
		nhap_diem(T);
		nhap_diem_lai([H|T]).
	nhap_diem_lai([H|T]) :-
		write("Dieu kien 0 <= diem <= 10\nNhap lai diem mon: ", H), nl,
		readreal(Diem),
		ktra_diem_nhap(Diem, [H|T]).
	
	
	lay_ds_diem(Ds_diem) :-
		findall(Diem, diem_mon_hoc(_, Diem), Ds_diem).
	
	nhap_diem_mon_hoc :-
		nam_hoc_nguoi_dung(Nam),
		hoc_ki_nguoi_dung(Ki),
		%write("Nam: ", Nam, "; Ki: ", Ki), nl,
		lay_ds_mon(Nam, Ki, Ds_mon),
		nhap_diem(Ds_mon).
		
	tinh_tb(Diem_tb) :-
		lay_ds_diem(Ds_diem),
		%write("Ds diem: ", Ds_diem), nl,
		averager(Ds_diem ,Diem_tb),		
		write("Diem trung binh: ", Diem_tb), nl.
	
	dua_ra_loi_khuyen_tung_mon :-
		findall(Mon, diem_mon_hoc(Mon, _), Ds_mon),
		findall(Diem, diem_mon_hoc(_, Diem), Ds_diem),
		loi_khuyen(Ds_mon, Ds_diem).
	
	loi_khuyen([],[]) :- !.
	loi_khuyen([H_mon|T_mon], [H_diem|T_diem]) :-
		loi_khuyen1(H_mon, H_diem),
		loi_khuyen(T_mon, T_diem).
		
	loi_khuyen1(H_mon, H_diem) :-
		H_diem >= 8.5,
		mon_hoc(_, _, H_mon, X, _, _, _, _),
		write("Loi khuyen cho mon ", H_mon, ": ", X), nl;
		H_diem >= 7.0,
		mon_hoc(_, _, H_mon, _, X, _, _, _),
		write("Loi khuyen cho mon ", H_mon, ": ", X), nl;
		H_diem >= 5.5,
		mon_hoc(_, _, H_mon, _, _, X, _, _),
		write("Loi khuyen cho mon ", H_mon, ": ", X), nl;
		H_diem >= 4.0,
		mon_hoc(_, _, H_mon, _, _, _, X, _),
		write("Loi khuyen cho mon ", H_mon, ": ", X), nl;
		H_diem < 4.0,
		mon_hoc(_, _, H_mon, _, _, _, _, X),
		write("Loi khuyen cho mon ", H_mon, ": ", X), nl.
	
	dua_ra_loi_khuyen_tong_quat(Diem_tb):-
		Diem_tb >= 8.5,
		write("Dat loai Gioi"), nl;
		Diem_tb >= 7.0,
		write("Dat loai Kha"), nl;
		Diem_tb >= 5.5,
		write("Dat loai TB"), nl;
		Diem_tb >= 4.0,
		write("Dat loai Yeu"), nl;
		Diem_tb < 4.0,
		write("Dat loai Kem"), nl.
	
		
	loi_cam_on :-
		ten_nguoi_dung(Name),
		write("Cam on ", Name, " da su dung chuong trinh cua nhom 2!\n").
		
s :- checking_prepare,
	nhap_ten_nguoi_dung,
	nhap_nam_va_ki,
	nhap_diem_mon_hoc,
	tinh_tb(Diem_tb),
	dua_ra_loi_khuyen_tung_mon,
	dua_ra_loi_khuyen_tong_quat(Diem_tb),
	loi_cam_on,
	clear_db2.
%goal s
 