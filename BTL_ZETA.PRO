% BTL zeta
code = 3000
include "BTL_git/DB_prep2.PRO"
include "BTL_git/TuVanSau.PRO"
/* Have included from file BTL_git/TuVanSau.PRO
domains
    i = integer
    r = real
	sb = symbol
	ar = r*
	as = sb*
*/
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
	len_list_str(as, i)
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
	nhap_nam_hoc
	nhap_ki_hoc
	kiem_tra_nam_hoc
	kiem_tra_ki_hoc
	kiem_tra_nhap_ten
	kiem_tra_nam_va_ki(i, i)
	
	lay_ds_mon(i, i, as)
	nhap_diem(sb, r, i)
	nhap_n_diem(as, i, i)
	ktra_diem_nhap(r)
	display_table(as, integer, integer)
	
	lay_ds_diem(ar)
	prepare_window_for_advice
	nhap_diem_mon_hoc
	tinh_tb(r)
	
	dua_ra_loi_khuyen_tung_mon
	dua_ra_loi_khuyen_tong_quat(r)
	
	loi_khuyen(as, ar)
	loi_khuyen1(sb, r)
	luu_loi_khuyen(string, string) %luu_loi_khuyen(ten_mon, loi_khuyen)
	
	tu_van_chuyen_sau
	tu_van_chuyen_sau_1
	kiem_tra_ki_hoc_dac_biet %nam 4 ki 2
	tao_lay_ds_mon_tu_van
	tao_lay_ds_mon_tu_van_1(as, ar)
	remove_table_window(i, i)
	prepare_table_for_picking_subject(as, i, i)
	chon_n_mon_tu_van(as, i, i)
	chon_mon_tu_van(sb, i, i)
	ktra_luu_mon_tu_van(sb, i)
	ktra_danh_dau(i)
	lay_ds_mon_tu_van(as)
	
	
	loi_cam_on
	
	clear_db
	clear_db2
	
	cls %clear scren
	s
	
	
clauses
	checking_prepare :-
		makewindow(1, 113, 113,"BTL",0,0,25,80),
		findall(Is_prepared, is_prepared(Is_prepared), Ds_prepare),
		is_empty_ls2(Ds_prepare, Res_empty_ls),
		%write("is Database prepared: ", Res_empty_ls), nl,
		Res_empty_ls = 0,
		prepare
		;!.
	
	cls :-
	write("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
	write(" ").
	
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
		
	len_list_str([], 0) :- !.
	len_list_str([_|T], Len) :-
		len_list_str(T, Len1),
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
		makewindow(2, 49, 49, "Nhap ten ban", 1, 5, 3, 25),
		%write("Hay nhap ten cua ban: "),
		readln(Name),
		assert(ten_nguoi_dung(Name)),
		kiem_tra_nhap_ten, !,
		shiftwindow(1),
    	clearwindow,
        makewindow(2, 49, 49, "Ten", 1, 5, 3, 25),  
		write(Name).
		
	nhap_ten_nguoi_dung :-
		retract(ten_nguoi_dung(_)),
		shiftwindow(1), 
		cursor(4, 5), 
		write("Ten khong hop le!. Vui long nghiem tuc!"),
		nhap_ten_nguoi_dung.
		
	kiem_tra_nhap_ten :-
		ten_nguoi_dung(Name),
		ktraten(Name, IsValidName),
		%write("IsValidName = ", IsValidName), nl,
		IsValidName = -1.
	
	ktraten(S0, Res) :-
		findall(Ten, ten_ko_hop_le(Ten), Ten_ko_Hop_le),
		cmp_str(S0, Ten_ko_Hop_le, Res).
		
	nhap_nam_va_ki :-
		makewindow(3, 49, 49, "Nhap nam", 1, 35, 4, 12),
		makewindow(4, 49, 49, "Nhap ki", 1, 50, 4, 12),
		nhap_nam_hoc,
		nhap_ki_hoc.
	
	nhap_nam_hoc :-
		shiftwindow(3),
		readint(Nam),
		assert(nam_hoc_nguoi_dung(Nam)),
		kiem_tra_nam_hoc, !,
		removewindow(3,1), 
		makewindow(3, 49, 49, "Nam", 1, 35, 3, 10), write(Nam).
	
	nhap_nam_hoc :-
		retract(nam_hoc_nguoi_dung(_)),
		clearwindow, %clear window 3
		write("Nhap lai! "),
		nhap_nam_hoc.
	
	kiem_tra_nam_hoc :-
		nam_hoc_nguoi_dung(Nam),
		lay_ds_mon(Nam, _, Ds_mon),
		is_empty_ls_symbol(Ds_mon, Res),
        Res <> 1.
	
	nhap_ki_hoc :-
		shiftwindow(4),
		readint(Ki),
		assert(hoc_ki_nguoi_dung(Ki)),
		kiem_tra_ki_hoc, !,
		removewindow(4,1), 
		makewindow(4, 49, 49, "Hoc ki", 1, 50, 3, 10), 
		write(Ki).
	
	nhap_ki_hoc :-
		retract(hoc_ki_nguoi_dung(_)),
		clearwindow, %clear window 4
		write("Nhap lai! "),
		nhap_ki_hoc.
		
	kiem_tra_ki_hoc :-
		nam_hoc_nguoi_dung(Nam),
		hoc_ki_nguoi_dung(Ki),
		lay_ds_mon(Nam, Ki, Ds_mon),
		is_empty_ls_symbol(Ds_mon, Res),
        Res <> 1.
	
	kiem_tra_nam_va_ki(Nam, Ki) :-
		lay_ds_mon(Nam, Ki, Ds_mon),
		is_empty_ls_symbol(Ds_mon, Res),
		Res = 1,
		%retract(nam_hoc_nguoi_dung(Nam)),
		%retract(hoc_ki_nguoi_dung(Ki)),
		write("Nam va ki hoc khong co!\nXin vui long nhap lai"), nl,
		clear_db2,
		nhap_nam_va_ki; !.
	
	prepare_window_for_advice :-
		makewindow(6, 113, 113, "Loi khuyen", 5, 40, 20, 40),
		makewindow(7, 113, 113, "", 5, 0, 3, 30), 
		write("Mon hoc"),
		makewindow(8, 113, 113, "", 5, 30, 3, 10), 
		write("Diem so"),
		nam_hoc_nguoi_dung(Nam),
		hoc_ki_nguoi_dung(Ki),
		lay_ds_mon(Nam, Ki, Ds_mon),
		display_table(Ds_mon, 15, 7). % (list, id_window, row)
	
	display_table([Head|Tail], Id, Row) :-
		str_len(Head, Len),
		So_dong = (Len div 24) + 3,
        Id2 = Id + 1,
        Row2 = Row + So_dong - 1,
        makewindow(Id2, 113, 113, "", Row, 0, So_dong, 30),
        cursor(0,3), write(Head),
        makewindow(Id, 113, 113, "", Row, 30, So_dong, 10),
		Id3 = Id2 + 1,
        display_table(Tail, Id3, Row2).
		
		
	display_table([], _, _):-
        shiftwindow(6).
		
	lay_ds_mon(Nam, Ki, Ds_mon) :-
		findall(Ten_mon, mon_hoc(Nam, Ki, Ten_mon, _, _, _, _, _), Ds_mon).
	
	nhap_n_diem([], 0, _).
	nhap_n_diem([H|T], N, Len_ds_mon) :-
		N > 0,
		Cur_window = (Len_ds_mon - N)*2 + 15,
		shiftwindow(Cur_window),
		%write("Nhap diem mon: ", H), nl,
		nhap_diem(H, Diem, Cur_window),
		N1 = N - 1,
		cursor(0,2), write(Diem),
		nhap_n_diem(T, N1, Len_ds_mon).
		
	nhap_diem(Mon, Diem, Cur_window) :-
		readreal(Diem),
		shiftwindow(6), 
		clearwindow, 
		shiftwindow(Cur_window),
		ktra_diem_nhap(Diem), !,
		assert(diem_mon_hoc(Mon, Diem)),
		shiftwindow(Cur_window), 
		clearwindow, 
		cursor(0,2), write(Diem).
	
	nhap_diem(Mon, Diem, Cur_window) :-
		shiftwindow(6), clearwindow, 
		write("Diem nhap khong hop le!\nDieu kien 0 <= diem <= 10\n"),
        shiftwindow(Cur_window),
		clearwindow,
		nhap_diem(Mon, Diem, Cur_window).
		
	ktra_diem_nhap(Diem) :-
		Diem >= 0.0, 
		Diem <= 10.0.
	
	
	lay_ds_diem(Ds_diem) :-
		findall(Diem, diem_mon_hoc(_, Diem), Ds_diem).
	
	nhap_diem_mon_hoc :-
		nam_hoc_nguoi_dung(Nam),
		hoc_ki_nguoi_dung(Ki),
		%write("Nam: ", Nam, "; Ki: ", Ki), nl,
		lay_ds_mon(Nam, Ki, Ds_mon),
		len_list_str(Ds_mon, Len_ds_mon),
		nhap_n_diem(Ds_mon, Len_ds_mon, Len_ds_mon).
		
	tinh_tb(Diem_tb) :-
		lay_ds_diem(Ds_diem),
		%write("Ds diem: ", Ds_diem), nl,
		averager(Ds_diem ,Diem_tb),		
		makewindow(5, 49, 49, "Diem TB", 1, 65, 3, 10),
		writef("%2.2f", Diem_tb).
	
	dua_ra_loi_khuyen_tung_mon :-
		shiftwindow(6),
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
		concat("Loi khuyen cho mon ", H_mon, H_mon_2),
		%luu_loi_khuyen(H_mon_2, X),
		%write("Loi khuyen cho mon ", H_mon, ":\n", X), nl, nl;
		clearwindow, write(H_mon_2, ": "), nl, nl, write(X), nl, nl,
		write("Bam phim bat ky de tiep tuc..."), nl,
		readchar(_), !;
		H_diem >= 7.0,
		mon_hoc(_, _, H_mon, _, X, _, _, _),
		concat("Loi khuyen cho mon ", H_mon, H_mon_2),
		%luu_loi_khuyen(H_mon_2, X),
		%write("Loi khuyen cho mon ", H_mon, ":\n", X), nl, nl;
		clearwindow, write(H_mon_2, ": "), nl, nl, write(X), nl, nl,
		write("Bam phim bat ky de tiep tuc..."), nl,
		readchar(_), !;
		H_diem >= 5.5,
		mon_hoc(_, _, H_mon, _, _, X, _, _),
		concat("Loi khuyen cho mon ", H_mon, H_mon_2),
		%luu_loi_khuyen(H_mon_2, X),
		%write("Loi khuyen cho mon ", H_mon, ":\n", X), nl, nl;
		clearwindow, write(H_mon_2, ": "), nl, nl, write(X), nl, nl,
		write("Bam phim bat ky de tiep tuc..."), nl,
		readchar(_), !;
		H_diem >= 4.0,
		mon_hoc(_, _, H_mon, _, _, _, X, _),
		concat("Loi khuyen cho mon ", H_mon, H_mon_2),
		%luu_loi_khuyen(H_mon_2, X),
		%write("Loi khuyen cho mon ", H_mon, ":\n", X), nl, nl;
		clearwindow, write(H_mon_2, ": "), nl, nl, write(X), nl, nl,
		write("Bam phim bat ky de tiep tuc..."), nl,
		readchar(_), !;
		H_diem < 4.0,
		mon_hoc(_, _, H_mon, _, _, _, _, X),
		concat("Loi khuyen cho mon ", H_mon, H_mon_2),
		%luu_loi_khuyen(H_mon_2, X),
		%write("Loi khuyen cho mon ", H_mon, ":\n", X), nl, nl.
		clearwindow, write(H_mon_2, ": "), nl, nl, write(X), nl, nl,
		write("Bam phim bat ky de tiep tuc..."), nl,
		readchar(_), !.
	
	loi_khuyen1(_, _) :- !.
	
	dua_ra_loi_khuyen_tong_quat(Diem_tb):-
		shiftwindow(6),
		clearwindow,
		Diem_tb >= 8.5,
		loi_khuyen_tong_quat("Gioi", ZGioi),
		%luu_loi_khuyen("Loi khuyen tong quat:\n", ZGioi),
		write("Loi khuyen tong quat:\n", ZGioi), nl, nl,
		write("Nhan phim bat ki de tiep tuc..."),
		readchar(_);
		Diem_tb >= 7.0,
		loi_khuyen_tong_quat("Kha", ZKha),
		%luu_loi_khuyen("Loi khuyen tong quat:\n", ZKha),
		write("Loi khuyen tong quat:\n", ZKha), nl, nl,
		write("Nhan phim bat ki de tiep tuc..."),
		readchar(_);
		Diem_tb >= 5.5,
		loi_khuyen_tong_quat("TB", ZTB),
		%luu_loi_khuyen("Loi khuyen tong quat:\n", ZTB),
		write("=> Loi khuyen tong quat:\n", ZTB), nl, nl,
		write("Nhan phim bat ki de tiep tuc..."),
		readchar(_);
		Diem_tb >= 4.0,
		loi_khuyen_tong_quat("Yeu", ZYeu),
		%luu_loi_khuyen("Loi khuyen tong quat:\n", ZYeu),
		write("Loi khuyen tong quat:\n", ZYeu), nl, nl,
		write("Nhan phim bat ki de tiep tuc..."),
		readchar(_);
		Diem_tb < 4.0,
		loi_khuyen_tong_quat("Kem", ZKem),
		%luu_loi_khuyen("Loi khuyen tong quat:\n", ZKem),
		write("Loi khuyen tong quat:\n", ZKem), nl, nl,
		write("Nhan phim bat ki de tiep tuc..."),
		readchar(_).
		
	dua_ra_loi_khuyen_tong_quat(_):-!.	
	
	luu_loi_khuyen(Mon_hoc_luu, Loi_khuyen_luu) :-
		findall(Stt, luu_loi_khuyen_db(Stt, _, _), Ds_loi_khuyen),
		len_list(Ds_loi_khuyen, SttCurr),
		assert(luu_loi_khuyen_db(SttCurr, Mon_hoc_luu, Loi_khuyen_luu)).
	
	tu_van_chuyen_sau :-
		kiem_tra_ki_hoc_dac_biet, 
		% shiftwindow(6),	clearwindow, write("ABCDEFGHI"), readchar(_),
		tu_van_chuyen_sau_1.
		
	tu_van_chuyen_sau :- 
		% shiftwindow(6), clearwindow, write("12345678"), readchar(_),
		!.
	
	tu_van_chuyen_sau_1 :-
		tao_lay_ds_mon_tu_van,
		findall(Mon0, diem_mon_hoc(Mon0, _), Ds_mon),
		len_list_str(Ds_mon, Len0),
		remove_table_window(Len0, Len0),
		%write("remove_table"),
		%readchar(_),
		makewindow(9, 113, 113, "", 5, 0, 3, 30), 
		write("Mon hoc"),
		makewindow(10, 113, 113, "", 5, 30, 3, 10), 
		write("Chon"),
		findall(Mon1, luu_mon_can_tu_van(Mon1), Ds_mon_tu_van1),
		len_list_str(Ds_mon_tu_van1, Len2),
		prepare_table_for_picking_subject(Ds_mon_tu_van1, 15, 7),
		shiftwindow(6),
		clearwindow,
		write("Lua chon mon de nhan tu van sau hon!\nNhap 1 de chon, nhap 0 de bo qua\n"),
		%readchar(_),
		chon_n_mon_tu_van(Ds_mon_tu_van1, Len2, Len2),
		lay_ds_mon_tu_van(Ds_mon_tu_van_da_chon),
		removewindow(6, 1),
		makewindow(11, 49, 49, "Mon tu van", 5, 0, 3, 80),
		makewindow(12, 113, 113, "Tu van", 8, 0, 16, 80),
		shiftwindow(12),
		clearwindow,
		tu_van_cho_tung_mon(Ds_mon_tu_van_da_chon).
	
	
	
	kiem_tra_ki_hoc_dac_biet :-
		nam_hoc_nguoi_dung(Nam),
		hoc_ki_nguoi_dung(Ki),
		Nam = 4,
		Ki = 2.
		
	tao_lay_ds_mon_tu_van :-
		findall(Mon, diem_mon_hoc(Mon, _), Ds_mon),
		findall(Diem, diem_mon_hoc(_, Diem), Ds_diem),
		tao_lay_ds_mon_tu_van_1(Ds_mon, Ds_diem).
	
	tao_lay_ds_mon_tu_van_1([], []).
	tao_lay_ds_mon_tu_van_1([H_mon|T_mon], [H_diem|T_diem]) :-
		H_diem <= 7,
		assert(luu_mon_can_tu_van(H_mon)),
		tao_lay_ds_mon_tu_van_1(T_mon, T_diem);
		tao_lay_ds_mon_tu_van_1(T_mon, T_diem).
	
	remove_table_window(0, _).
	remove_table_window(N, Len) :-
		N > 0,
		Window = (Len - N)*2 + 15,
		%shiftwindow(6), clearwindow,
		%write("N: ", N, "; Len: ", Len, "; removewindow :", Window), nl, readchar(_),
		removewindow(Window, 1),
		Window1 = Window + 1,
		removewindow(Window1, 1),
		N1 = N - 1,
		remove_table_window(N1, Len).
		
		
	prepare_table_for_picking_subject([Head|Tail], Id, Row) :-
		str_len(Head, Len),
		So_dong = (Len div 24) + 3,
        Id2 = Id + 1,
        Row2 = Row + So_dong - 1,
        makewindow(Id2, 113, 113, "", Row, 0, So_dong, 30),
        cursor(0,3), write(Head),
        makewindow(Id, 113, 113, "", Row, 30, So_dong, 10),
		Id3 = Id2 + 1,
        display_table(Tail, Id3, Row2).
	prepare_table_for_picking_subject([], _, _).
	
	
	chon_n_mon_tu_van([], 0, _).
	chon_n_mon_tu_van([H|T], N, Len_ds_mon) :-
		N > 0,
		Cur_window = (Len_ds_mon - N)*2 + 15,
		shiftwindow(Cur_window),
		chon_mon_tu_van(H, Danh_dau, Cur_window),
		N1 = N - 1,
		cursor(0,2), write(Danh_dau),
		chon_n_mon_tu_van(T, N1, Len_ds_mon).
		
	chon_mon_tu_van(Mon, Danh_dau, Cur_window) :-
		shiftwindow(Cur_window),
		readint(Danh_dau),
		shiftwindow(6), 
		clearwindow, 
		write("Lua chon mon de nhan tu van sau hon!\nNhap 1 de chon, nhap 0 de bo qua\n"),
		shiftwindow(Cur_window),
		ktra_danh_dau(Danh_dau),
		ktra_luu_mon_tu_van(Mon, Danh_dau);
		shiftwindow(6), clearwindow, 
		write("Danh dau khong hop le!\nNhap 1 de chon, nhap 0 de bo qua\n"),
        shiftwindow(Cur_window),
		clearwindow,
		chon_mon_tu_van(Mon, Danh_dau, Cur_window).	
		
	ktra_luu_mon_tu_van(Mon, Danh_dau) :-
		Danh_dau = 1,
		assert(luu_mon_tu_van_da_chon(Mon)),
		shiftwindow(Cur_window), 
		clearwindow, 
		cursor(0,2), write(Danh_dau);
		Danh_dau = 0, !.

		
	ktra_danh_dau(Danh_dau) :-
		Danh_dau >= 0, 
		Danh_dau <= 1.
	
	lay_ds_mon_tu_van(Ds_mon_tu_van) :-
		findall(Mon, luu_mon_tu_van_da_chon(Mon), Ds_mon_tu_van).
		
	
	loi_cam_on :-
		ten_nguoi_dung(Name),
		shiftwindow(1),
		clearwindow, nl, nl, nl,
		write("Cam on ", Name, " da su dung chuong trinh cua nhom 2!\n"), nl,
		write("Nhan phim bat ki de ket thuc..."),
		readchar(_).

/* window id:
	1: bg window
	2: ten
	3: nam hoc
	4: ki hoc
	5: diem tb
	6: Cua so loi khuyen -- 10
	7: Mon hoc -- 12
	8: Diem so -- 13
	9: Mon hoc tu van
	10: Chon mon de tu van
	11: Mon dang tu van
	12: Khu vuc hoi dap cho tu van
	
	15 - 30 -...: Cua so ten mon: x, cua so diem, x + 1.
*/
		
s :- checking_prepare,
	nhap_ten_nguoi_dung,
	nhap_nam_va_ki,
	prepare_window_for_advice,
	nhap_diem_mon_hoc,
	tinh_tb(Diem_tb),
	%retract(luu_loi_khuyen_db(_, _, _)),
	dua_ra_loi_khuyen_tung_mon,
	dua_ra_loi_khuyen_tong_quat(Diem_tb),
	tu_van_chuyen_sau,
	loi_cam_on,
	clear_db2.
%goal s
 