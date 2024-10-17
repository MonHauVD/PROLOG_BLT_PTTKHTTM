% BTL gamma
domains
    i = integer
    r = real
	sb = symbol
	ar = r*
	as = sb*
database
	is_prepared(integer)
	ten_nguoi_dung(symbol)
	nam_hoc_nguoi_dung(integer)
	hoc_ki_nguoi_dung(integer)
	ten_ko_hop_le(symbol)
	diem_mon_hoc(symbol, real)
	% mon_hoc(Nam_hoc, Hoc_ki, Ten_mon, Cac loi khuyen Gioi, Kha, TB, Yeu, Kem)
	mon_hoc(integer, integer, string, string, string, string, string, string)
predicates
	prepare
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
	prepare :-
		
		assert(is_prepared(1)),
		
		assert(ten_ko_hop_le("cho")),
		assert(ten_ko_hop_le("ngu")),
		assert(ten_ko_hop_le("lon")),
		assert(ten_ko_hop_le("bo")),
		assert(ten_ko_hop_le("ham")),
		assert(ten_ko_hop_le("dien")),
		assert(ten_ko_hop_le("xau")),
		assert(ten_ko_hop_le("may")),
		assert(ten_ko_hop_le("tao")),
		assert(ten_ko_hop_le("khung")),
		assert(ten_ko_hop_le("map")),
		assert(ten_ko_hop_le("lun")),
		assert(ten_ko_hop_le("cai")),
		assert(ten_ko_hop_le("di")),
		assert(ten_ko_hop_le("xam")),
		assert(ten_ko_hop_le("ga")),
		assert(ten_ko_hop_le("con")),
		
		X = "Gioi Ban da nam chac kien thuc. Hay doc Tu ban cua Karl Marx de hieu sau hon ve kinh te hoc chinh tri. Ban da nam chac kien thuc. Hay doc Tu ban cua Karl Marx de hieu sau hon ve kinh te hoc chinh tri.",
		Y = "Ban can on lai cac khai niem co ban. Tap trung hoc theo chu de va lam bai tap thuong xuyen de cai thien ket qua. Ban nen danh thoi gian cho kien thuc nen voi Nhap mon Triet hoc Mac-Lenin ket hop voi hoc nhom de dat hieu qua tot.",
		concat(X, Y, R),
		X2 = "Kha Ban da nam chac kien thuc. Hay doc Tu ban cua Karl Marx de hieu sau hon ve kinh te hoc chinh tri. Ban da nam chac kien thuc. Hay doc Tu ban cua Karl Marx de hieu sau hon ve kinh te hoc chinh tri.",
		Y2 = "Ban can on lai cac khai niem co ban. Tap trung hoc theo chu de va lam bai tap thuong xuyen de cai thien ket qua. Ban nen danh thoi gian cho kien thuc nen voi Nhap mon Triet hoc Mac-Lenin ket hop voi hoc nhom de dat hieu qua tot.",
		concat(X, Y, R2),
		assert(mon_hoc(6, 1, "A61", R, R2, "TBA12", "YeuA12", "KemA12")),
	
		assert(mon_hoc(1, 1, "Triet hoc Mac-Lenin", "Ban da nam chac kien thuc. Hay doc Tu ban cua Karl Marx de hieu sau hon ve kinh te hoc chinh tri.", "Ban co nen tang tot, co gang lien he kien thuc voi thuc tien nhieu hon de hoc tot mon nay hon nhe.", "Ban can on lai cac khai niem co ban. Tap trung hoc theo chu de va lam bai tap thuong xuyen de cai thien ket qua.", "Ban nen danh thoi gian cho kien thuc nen voi Nhap mon Triet hoc Mac-Lenin ket hop voi hoc nhom de dat hieu qua tot.", "Ban nen nho giang vien ho tro, ket hop doc Giao trinh Triet hoc dai cuong va len ke hoach hoc hang ngay voi So tay Triet hoc cho nguoi moi de tranh don kien thuc.")),
		assert(mon_hoc(1, 1, "Tin hoc co so 1", "Ban da hoc rat tot! Hay doc Computer Science: An Overview cua J. Glenn Brookshear de mo rong kien thuc.", "Ban co nen tang tot, nen kham pha them cac ung dung thuc te qua Tin hoc dai cuong cua Tran Dinh Que de nang cao trinh do.", "Ban can on tap lai cac khai niem co ban. Doc Introduction to Computer Science cua Goel de cu cung va thu lap so do tu duy de he thong hoa cac khai niem da hoc.", "Ban gap kho khan voi kien thuc nen. Bat dau voi Computer Basics for Beginners va nen nho ban be hoac giang vien giai thich lai cac phan chua hieu.", "Hay tap trung vao nhung khai niem co ban nhat. Doc Giao trinh Tin hoc co so. Len ke hoach hoc hang ngay va thuc hanh thuong xuyen de theo kip tien do.")),
		assert(mon_hoc(1, 1, "Giai tich 1", "Ban da hoc rat tot! Hay thu thach ban than voi cac bai tap nang cao tu Giai tich 1 cua Nguyen Dinh Tri va tim hieu sau ve ung dung giai tich trong cac nganh khoa hoc va ky thuat.", "Ban co nen tang tot. Hay doc Introduction to Calculus and Analysis cua Richard Courant de nam chac phuong phap giai tich va tang cuong lam bai tap.", "Ban can tap trung hon vao cac khai niem dao ham va tich phan co ban. Su dung Calculus Made Easy cua Silvanus Thompson de hieu de hon cac cong thuc. Dong thoi on lai ly thuyet va lam bai tap tu Giao trinh Giai tich 1 cua Le Van Tien de cai thien.", "Ban gap kho khan voi kien thuc nen. Bat dau voi cac dang bai don gian nhat ve dao ham. Hoc tung buoc qua Basic Calculus cua Deborah Hughes-Hallett de khong bi ngop.", "Ban nen su dung Giai tich co ban cho nguoi moi bat dau de cuong co nen tang. Len ke hoach hoc tap hang ngay, chia nho cac phan ly thuyet va thuc hanh tung ngay.")),
		assert(mon_hoc(1, 1, "Dai so", "Ban hoc rat tot! Doc them Linear Algebra and Its Applications cua David Lay de nang cao kien thuc va ren tu duy toan hoc voi Giao trinh Dai so cua Nguyen Tien Dung. Sau do, hay thu ap dung dai so vao do thi va hinh hoc de mo rong hieu biet.", "Ban co nen tang vung. Thuc hanh them voi Introduction to Linear Algebra cua Gilbert Strang va tang cuong giai bai tap qua Bai tap Dai so tuyen tinh cua Le Van Thang. Hay co gang nam vung khong gian vector va ma tran de chuan bi cho mon hoc tiep theo.", "Ban nen on lai cac phep bien doi ma tran va he phuong trinh tuyen tinh co ban. Hoc qua vi du trong Algebra for Beginners cua Israel Gelfand va lam them cac bai tap tu Giao trinh Dai so co ban cua Nguyen Dinh Tri.", "Ban gap kho khan voi cac khai niem nen tang. Hay on tap voi Basic Linear Algebra. Tap trung vao cac bai tap don gian nhat de khong bi ngop de cai thien mon hoc.", "Ban nen bat dau voi Dai so co ban cho nguoi moi hoc de nam vung kien thuc nen. Chia nho thoi gian hoc de on tap tung chu de mot cach deu dan va len ke hoach hoc hang ngay de theo kip tien do mon hoc.")),
		
		Z62Gioi_0 = "loi khuyen Gioi dfasgsdgsdfsedfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksd",
		Y62Gioi_1 = "hjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdf",
		concat(Z62Gioi_0, Y62Gioi_1, Z62Gioi_1),
		Y62Gioi_2 = "lkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddf",
		concat(Z62Gioi_1, Y62Gioi_2, Z62Gioi_2),
		Y62Gioi_3 = "asgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;and",
		concat(Z62Gioi_2, Y62Gioi_3, Z62Gioi_3),
		Z62Kha_1 = "loi khuyen Kha dfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;and",
		Z62Tb_1 = "loi khuyen trung binh",
		Z62Yeu_1 = "loi khuyen Yeu",
		Z62Kem_1 = "loi khuyen Kem",
		assert(mon_hoc(6, 2, "Mon hoc 62", Z62Gioi_3, Z62Kha_1, Z62Tb_1, Z62Yeu_1, Z62Kem_1)),


		
		assert(mon_hoc(1, 2, "A12", "GioiA12", "KhaA12", "TBA12", "YeuA12", "KemA12")),
		assert(mon_hoc(1, 2, "B12", "GioiB12", "KhaB12", "TBB12", "YeuB12", "KemB12")),
		assert(mon_hoc(1, 2, "C12", "GioiC12", "KhaC12", "TBC12", "YeuC12", "KemC12")),
		assert(mon_hoc(1, 2, "D12", "GioiD12", "KhaD12", "TBD12", "YeuD12", "KemD12")),
		assert(mon_hoc(1, 2, "E12", "GioiE12", "KhaE12", "TBE12", "YeuE12", "KemE12")),
		
		assert(mon_hoc(2, 1, "A21", "GioiA21", "KhaA21", "TBA21", "YeuA21", "KemA21")),
		assert(mon_hoc(2, 1, "B21", "GioiB21", "KhaB21", "TBB21", "YeuB21", "KemB21")),
		assert(mon_hoc(2, 1, "C21", "GioiC21", "KhaC21", "TBC21", "YeuC21", "KemC21")),
		assert(mon_hoc(2, 1, "D21", "GioiD21", "KhaD21", "TBD21", "YeuD21", "KemD21")),
		assert(mon_hoc(2, 1, "E21", "GioiE21", "KhaE21", "TBE21", "YeuE21", "KemE21")),
		
		assert(mon_hoc(2, 2, "A22", "GioiA22", "KhaA22", "TBA22", "YeuA22", "KemA22")),
		assert(mon_hoc(2, 2, "B22", "GioiB22", "KhaB22", "TBB22", "YeuB22", "KemB22")),
		assert(mon_hoc(2, 2, "C22", "GioiC22", "KhaC22", "TBC22", "YeuC22", "KemC22")),
		assert(mon_hoc(2, 2, "D22", "GioiD22", "KhaD22", "TBD22", "YeuD22", "KemD22")),
		assert(mon_hoc(2, 2, "E22", "GioiE22", "KhaE22", "TBE22", "YeuE22", "KemE22")),
		
		assert(mon_hoc(3, 1, "A31", "GioiA31", "KhaA31", "TBA31", "YeuA31", "KemA31")),
		assert(mon_hoc(3, 1, "B31", "GioiB31", "KhaB31", "TBB31", "YeuB31", "KemB31")),
		assert(mon_hoc(3, 1, "C31", "GioiC31", "KhaC31", "TBC31", "YeuC31", "KemC31")),
		assert(mon_hoc(3, 1, "D31", "GioiD31", "KhaD31", "TBD31", "YeuD31", "KemD31")),
		assert(mon_hoc(3, 1, "E31", "GioiE31", "KhaE31", "TBE31", "YeuE31", "KemE31")),
		
		assert(mon_hoc(3, 2, "A32", "GioiA32", "KhaA32", "TBA32", "YeuA32", "KemA32")),
		assert(mon_hoc(3, 2, "B32", "GioiB32", "KhaB32", "TBB32", "YeuB32", "KemB32")),
		assert(mon_hoc(3, 2, "C32", "GioiC32", "KhaC32", "TBC32", "YeuC32", "KemC32")),
		assert(mon_hoc(3, 2, "D32", "GioiD32", "KhaD32", "TBD32", "YeuD32", "KemD32")),
		assert(mon_hoc(3, 2, "E32", "GioiE32", "KhaE32", "TBE32", "YeuE32", "KemE32")),
		
		assert(mon_hoc(4, 1, "A41", "GioiA41", "KhaA41", "TBA41", "YeuA41", "KemA41")),
		assert(mon_hoc(4, 1, "B41", "GioiB41", "KhaB41", "TBB41", "YeuB41", "KemB41")),
		assert(mon_hoc(4, 1, "C41", "GioiC41", "KhaC41", "TBC41", "YeuC41", "KemC41")),
		assert(mon_hoc(4, 1, "D41", "GioiD41", "KhaD41", "TBD41", "YeuD41", "KemD41")),
		assert(mon_hoc(4, 1, "E41", "GioiE41", "KhaE41", "TBE41", "YeuE41", "KemE41")),
		
		assert(mon_hoc(4, 2, "A42", "GioiA42", "KhaA42", "TBA42", "YeuA42", "KemA42")),
		assert(mon_hoc(4, 2, "B42", "GioiB42", "KhaB42", "TBB42", "YeuB42", "KemB42")),
		assert(mon_hoc(4, 2, "C42", "GioiC42", "KhaC42", "T2,", "YeuC42", "KemC42")),
		assert(mon_hoc(4, 2, "D42", "GioiD42", "KhaD42", "TBD42", "YeuD42", "KemD42")),
		assert(mon_hoc(4, 2, "E42", "GioiE42", "KhaE42", "TBE42", "YeuE42", "KemE42")),
		
		assert(mon_hoc(5, 1, "A51", "GioiA51", "KhaA51", "TBA51", "YeuA51", "KemA51")),
		assert(mon_hoc(5, 1, "B51", "GioiB51", "KhaB51", "TBB51", "YeuB51", "KemB51")),
		assert(mon_hoc(5, 1, "C51", "GioiC51", "KhaC51", "TBC51", "YeuC51", "KemC51")),
		assert(mon_hoc(5, 1, "D51", "GioiD51", "KhaD51", "TBD51", "YeuD51", "KemD51")),
		assert(mon_hoc(5, 1, "E51", "GioiE51", "KhaE51", "TBE51", "YeuE51", "KemE51"))
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
 