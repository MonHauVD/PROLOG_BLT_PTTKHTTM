% Xu ly cay dieu kien tu van chuyen sau
/*
HUONG DAN CACH DUNG FILE NAY
1. De test cho rieng phan tu van sau CHI CAN CHAY MINH FILE NAY
2. Go s2 de bat dau.

Note:
 - Mac dinh de kiem tra tat ca cac mon thuoc nam 4 ki 2
 - Neu muon chi test 1 mon, lua chon mon tuong ung bang cach sua ham 	test_tu_van_sau :
	Dong nay:	nhap_du_lieu_de_test0(Ds_mon_tu_van_da_chon),
	sua so 0 thanh so tuong ung voi mon can kiem tra.
	0 = Tat ca 6 mon
	1 = "The chat"
	2 = "Ki nang thuyet trinh"
	3 = "Tu tuong Ho Chi Minh"
	4 = "Lap trinh huong doi tuong"
	5 = "Lap trinh Web"
	6 = "IoT va Ung dung"
*/

domains
    i = integer
    r = real
	sb = symbol
	ar = r*
	as = sb*
predicates
	tu_van_cho_tung_mon(as)
	% kiem_tra_trong_khoang_tu_1_den_max
	ktra_nhap_hoi_dap(i, i) %(gia_tri_nhap, max)
	the_chat_1
	re_nhanh_the_chat_2(i)
	the_chat_21
	the_chat_22
	the_chat_23
	re_nhanh_the_chat_21_3(i)
	the_chat_21_31
	the_chat_21_32
	re_nhanh_the_chat_22_3(i)
	the_chat_22_31
	the_chat_22_32
	re_nhanh_the_chat_23_3(i)
	the_chat_23_31
	the_chat_23_32
	
	ki_nang_thuyet_trinh_1
	re_nhanh_ki_nang_thuyet_trinh_2(i)
	ki_nang_thuyet_trinh_21
	ki_nang_thuyet_trinh_22
	ki_nang_thuyet_trinh_23
	re_nhanh_ki_nang_thuyet_trinh_21_3(i)
	ki_nang_thuyet_trinh_21_31
	ki_nang_thuyet_trinh_21_32
	re_nhanh_ki_nang_thuyet_trinh_22_3(i)
	ki_nang_thuyet_trinh_22_31
	ki_nang_thuyet_trinh_22_32
	re_nhanh_ki_nang_thuyet_trinh_23_3(i)
	ki_nang_thuyet_trinh_23_31
	ki_nang_thuyet_trinh_23_32
	
	tu_tuong_HCM_1
	re_nhanh_tu_tuong_HCM_2(i)
	tu_tuong_HCM_21
	tu_tuong_HCM_22
	tu_tuong_HCM_23
	re_nhanh_tu_tuong_HCM_21_3(i)
	tu_tuong_HCM_21_31
	tu_tuong_HCM_21_32
	re_nhanh_tu_tuong_HCM_22_3(i)
	tu_tuong_HCM_22_31
	tu_tuong_HCM_22_32
	tu_tuong_HCM_22_33
	re_nhanh_tu_tuong_HCM_23_3(i)
	tu_tuong_HCM_23_31
	tu_tuong_HCM_23_32
	
	
	oop_1
	re_nhanh_oop_2(i)
	oop_21
	oop_22
	re_nhanh_oop_21_3(i)
	oop_21_31
	oop_21_32
	re_nhanh_oop_21_32_4(i)
	oop_21_32_41
	oop_21_32_42
	
	lap_trinh_web_1
	re_nhanh_lap_trinh_web_2(i)
	lap_trinh_web_21
	lap_trinh_web_22
	re_nhanh_lap_trinh_web_21_3(i)
	lap_trinh_web_21_31
	lap_trinh_web_21_32
	re_nhanh_lap_trinh_web_22_3(i)
	lap_trinh_web_22_31
	lap_trinh_web_22_32
	re_nhanh_lap_trinh_web_22_31_4(i)
	lap_trinh_web_22_31_41
	lap_trinh_web_22_31_42
	re_nhanh_lap_trinh_web_22_32_4(i)
	lap_trinh_web_22_32_41
	lap_trinh_web_22_32_42
	
	
	iot_1
	re_nhanh_iot_2(i)
	iot_21
	iot_22
	iot_23
	re_nhanh_iot_21_3(i)
	iot_21_31
	iot_21_32
	re_nhanh_iot_22_3(i)
	iot_22_31
	iot_22_32
	re_nhanh_iot_23_3(i)
	iot_23_31
	iot_23_32
	
	test_tu_van_sau
	nhap_du_lieu_de_test0(as)
	nhap_du_lieu_de_test1(as)
	nhap_du_lieu_de_test2(as)
	nhap_du_lieu_de_test3(as)
	nhap_du_lieu_de_test4(as)
	nhap_du_lieu_de_test5(as)
	nhap_du_lieu_de_test6(as)
	s2
% Su dung cua so 12 de hoi dap voi nguoi dung	
clauses
	s2 :- 
		test_tu_van_sau.
		
	test_tu_van_sau :-
		makewindow(11, 49, 49, "Mon tu van", 5, 0, 3, 80),
		makewindow(12, 113, 113, "Tu van", 8, 0, 16, 80),
		nhap_du_lieu_de_test0(Ds_mon_tu_van_da_chon),
		tu_van_cho_tung_mon(Ds_mon_tu_van_da_chon).
		
	nhap_du_lieu_de_test0(["The chat", "Ki nang thuyet trinh", "Tu tuong Ho Chi Minh", "Lap trinh huong doi tuong", "Lap trinh Web", "IoT va Ung dung"]).
	
	nhap_du_lieu_de_test1(["The chat"]).
	nhap_du_lieu_de_test2(["Ki nang thuyet trinh"]).
	nhap_du_lieu_de_test3(["Tu tuong Ho Chi Minh"]).
	nhap_du_lieu_de_test4(["Lap trinh huong doi tuong"]).
	nhap_du_lieu_de_test5(["Lap trinh Web"]).
	nhap_du_lieu_de_test6(["IoT va Ung dung"]).
	
	tu_van_cho_tung_mon([]).
	tu_van_cho_tung_mon([H|T]) :-
		H = "The chat",
		the_chat_1,
		tu_van_cho_tung_mon(T);
		H = "Ki nang thuyet trinh",
		ki_nang_thuyet_trinh_1,
		tu_van_cho_tung_mon(T);
		H = "Tu tuong Ho Chi Minh",
		tu_tuong_HCM_1,
		tu_van_cho_tung_mon(T);
		H = "Lap trinh huong doi tuong",
		oop_1,
		tu_van_cho_tung_mon(T);
		H = "Lap trinh Web",
		lap_trinh_web_1,
		tu_van_cho_tung_mon(T);
		H = "IoT va Ung dung",
		iot_1,
		tu_van_cho_tung_mon(T).
		
	ktra_nhap_hoi_dap(Gtri_nhap, Max) :-
		Gtri_nhap >= 1,
		Gtri_nhap <= Max.
		
	the_chat_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t\t    The chat"),
		shiftwindow(12),
		clearwindow,
		write("Ban cam thay dau la li do khien ban kem mon the chat?\n\n"),
		write("Nhap 1: Thieu ky nang\n"),
		write("Nhap 2: The luc yeu\n"),
		write("Nhap 3: Thieu thoi gian luyen tap\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 3),
		re_nhanh_the_chat_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		the_chat_1.
		
	re_nhanh_the_chat_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		the_chat_21;
		Gtri_nhap = 2,
		the_chat_22;
		Gtri_nhap = 3,
		the_chat_23.
	
	the_chat_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban co muon tham gia cau lac bo khong?\n\n"),
		write("Nhap 1: Co\n"),
		write("Nhap 2: Khong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_the_chat_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		the_chat_21.
	
	re_nhanh_the_chat_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		the_chat_21_31;
		Gtri_nhap = 2,
		the_chat_21_32.
	
	the_chat_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Danh sach cac CLB\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	the_chat_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y tim ban tap luyen chung\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).	
		
	the_chat_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Ban muon tu van chuyen sau ve dieu gi?\n\n"),
		write("Nhap 1: Che do tap luyen\n"),
		write("Nhap 2: Che do an uong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_the_chat_22_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		the_chat_22.
	
	re_nhanh_the_chat_22_3(Gtri_nhap) :- %cap 2 nhanh 2 re den cap 3
		Gtri_nhap = 1,
		the_chat_22_31;
		Gtri_nhap = 2,
		the_chat_22_32.
	
	the_chat_22_31 :- % nhanh 1 cap 3 thuoc nhanh 2 cap 2
		shiftwindow(12),
		clearwindow,
		write("Dua ra cac che do tap luyen\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	the_chat_22_32 :-
		shiftwindow(12),
		clearwindow,
		write("Dua ra loi khuyen ve dinh duong\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	the_chat_23 :- %21: cap 2 nhanh 3
		shiftwindow(12),
		clearwindow,
		write("Ban muon tap cac bai tap nhu the nao?\n\n"),
		write("Nhap 1: Tap cac bai tap ngan\n"),
		write("Nhap 2: Tap cac bai tap khong can dung cu tai nha\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_the_chat_23_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		the_chat_23.
	
	re_nhanh_the_chat_23_3(Gtri_nhap) :- %cap 2 nhanh 3 re den cap 3
		Gtri_nhap = 1,
		the_chat_23_31;
		Gtri_nhap = 2,
		the_chat_23_32.
	
	the_chat_23_31 :- % nhanh 1 cap 3 thuoc nhanh 3 cap 2
		shiftwindow(12),
		clearwindow,
		write("Dua ra cac bai tap ngan\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	the_chat_23_32 :-
		shiftwindow(12),
		clearwindow,
		write("Dua ra cac bai tap khong can dung cu tai nha\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	ki_nang_thuyet_trinh_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t     Ki nang thuyet trinh"),
		shiftwindow(12),
		clearwindow,
		write("Ban cam thay dau la li do khien ban kem mon ki nang thuyet trinh?\n\n"),
		write("Nhap 1: Thieu ky nang ky nang thuyet trinh\n"),
		write("Nhap 2: Thiue su tu tin\n"),
		write("Nhap 3: Thieu thoi gian luyen tap\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 3),
		re_nhanh_ki_nang_thuyet_trinh_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		ki_nang_thuyet_trinh_1.
		
	re_nhanh_ki_nang_thuyet_trinh_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		ki_nang_thuyet_trinh_21;
		Gtri_nhap = 2,
		ki_nang_thuyet_trinh_22;
		Gtri_nhap = 3,
		ki_nang_thuyet_trinh_23.
	
	ki_nang_thuyet_trinh_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban co muon tham gia cau lac bo ki nang mem khong?\n\n"),
		write("Nhap 1: Co\n"),
		write("Nhap 2: Khong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_ki_nang_thuyet_trinh_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		ki_nang_thuyet_trinh_21.
	
	re_nhanh_ki_nang_thuyet_trinh_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		ki_nang_thuyet_trinh_21_31;
		Gtri_nhap = 2,
		ki_nang_thuyet_trinh_21_32.
	
	ki_nang_thuyet_trinh_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Danh sach cac CLB lien quan\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	ki_nang_thuyet_trinh_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y tim ban tap luyen chung\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).	
		
	ki_nang_thuyet_trinh_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Ban muon tu van chuyen sau ve dieu gi?\n\n"),
		write("Nhap 1: Cac luyen tap\n"),
		write("Nhap 2: Phuong phap cai thien tam ly\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_ki_nang_thuyet_trinh_22_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		ki_nang_thuyet_trinh_22.
	
	re_nhanh_ki_nang_thuyet_trinh_22_3(Gtri_nhap) :- %cap 2 nhanh 2 re den cap 3
		Gtri_nhap = 1,
		ki_nang_thuyet_trinh_22_31;
		Gtri_nhap = 2,
		ki_nang_thuyet_trinh_22_32.
	
	ki_nang_thuyet_trinh_22_31 :- % nhanh 1 cap 3 thuoc nhanh 2 cap 2
		shiftwindow(12),
		clearwindow,
		write("- Thuc hanh voi ban be hoac gia dinh\n"),
		write("- Ghi am va nghe lai de tu cai thien\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	ki_nang_thuyet_trinh_22_32 :-
		shiftwindow(12),
		clearwindow,
		write("- Huong dan ky thuat thu gian\n"),
		write("- Goi y cac tap luyen voi guong hoac quay video\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	ki_nang_thuyet_trinh_23 :- %21: cap 2 nhanh 3
		shiftwindow(12),
		clearwindow,
		write("Ban muon tap cac bai tap nhu the nao?\n\n"),
		write("Nhap 1: Tap cac bai tap nhanh\n"),
		write("Nhap 2: Tap thuyet trinh tai nha\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_ki_nang_thuyet_trinh_23_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		ki_nang_thuyet_trinh_23.
	
	re_nhanh_ki_nang_thuyet_trinh_23_3(Gtri_nhap) :- %cap 2 nhanh 3 re den cap 3
		Gtri_nhap = 1,
		ki_nang_thuyet_trinh_23_31;
		Gtri_nhap = 2,
		ki_nang_thuyet_trinh_23_32.
	
	ki_nang_thuyet_trinh_23_31 :- % nhanh 1 cap 3 thuoc nhanh 3 cap 2
		shiftwindow(12),
		clearwindow,
		write("Xem cac bai thuyet trinh mau\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	ki_nang_thuyet_trinh_23_32 :-
		shiftwindow(12),
		clearwindow,
		write("Bat chuoc phong cach trinh bay cua nguoi noi tieng\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	tu_tuong_HCM_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t    Tu tuong Ho Chi Minh"),
		shiftwindow(12),
		clearwindow,
		write("Ban cam thay dau la li do khien ban kem mon Tu tuong Ho Chi Minh?\n\n"),
		write("Nhap 1: Do kho khan trong viec hieu noi dung ly thuyet\n"),
		write("Nhap 2: Kho khan trong viec lien he thuc tien\n"),
		write("Nhap 3: Thieu dong luc hoc mon\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 3),
		re_nhanh_tu_tuong_HCM_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		tu_tuong_HCM_1.
		
	re_nhanh_tu_tuong_HCM_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		tu_tuong_HCM_21;
		Gtri_nhap = 2,
		tu_tuong_HCM_22;
		Gtri_nhap = 3,
		tu_tuong_HCM_23.
	
	tu_tuong_HCM_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban co muon hoc theo huong nao?\n\n"),
		write("Nhap 1: Hoc theo so do tu duy\n"),
		write("Nhap 2: Chia nho noi dung\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_tu_tuong_HCM_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		tu_tuong_HCM_21.
	
	re_nhanh_tu_tuong_HCM_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		tu_tuong_HCM_21_31;
		Gtri_nhap = 2,
		tu_tuong_HCM_21_32.
	
	tu_tuong_HCM_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Huong dan sinh vien ve so do tu duy de tom tat tu tuong Ho Chi Minh thanh cac phan nho hon nhu dao duc, chinh tri, van hoa, giao duc.\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	tu_tuong_HCM_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich moi ngay hoc mot chu de nho de giam tai kien thuc\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).	
		
	tu_tuong_HCM_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Ban muon lua chon hoat dong nao?\n\n"),
		write("Nhap 1: Thuc hanh qua hoat dong xa hoi\n"),
		write("Nhap 2: Thao luan nhom\n"),
		write("Nhap 3: Tom tat bai hoc thuc tien thu duoc\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 3),
		re_nhanh_tu_tuong_HCM_22_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		tu_tuong_HCM_22.
	
	re_nhanh_tu_tuong_HCM_22_3(Gtri_nhap) :- %cap 2 nhanh 2 re den cap 3
		Gtri_nhap = 1,
		tu_tuong_HCM_22_31;
		Gtri_nhap = 2,
		tu_tuong_HCM_22_32;
		Gtri_nhap = 3,
		tu_tuong_HCM_22_33.
	
	tu_tuong_HCM_22_31 :- % nhanh 1 cap 3 thuoc nhanh 2 cap 2
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich sinh vien tham gia cac phong trao thanh nien hoac hoat dong tu thien de truc tiep ap dung cac gia tri trong tu tuong Ho Chi Minh\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	tu_tuong_HCM_22_32 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y sinh vien cung cac ban be to chuc buoi trao doi ve cach ap dung cac nguyen tac vao cong viec hoac cuopc song hang ngay.\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	tu_tuong_HCM_22_33 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y cac tom tat bai hoc....\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	tu_tuong_HCM_23 :- %21: cap 2 nhanh 3
		shiftwindow(12),
		clearwindow,
		write("Ban muon chon cach hoc nao?\n\n"),
		write("Nhap 1: Phuong phap hoc qua video\n"),
		write("Nhap 2: Lam du an nho nhu viet bai luan\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_tu_tuong_HCM_23_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		tu_tuong_HCM_23.
	
	re_nhanh_tu_tuong_HCM_23_3(Gtri_nhap) :- %cap 2 nhanh 3 re den cap 3
		Gtri_nhap = 1,
		tu_tuong_HCM_23_31;
		Gtri_nhap = 2,
		tu_tuong_HCM_23_32.
	
	tu_tuong_HCM_23_31 :- % nhanh 1 cap 3 thuoc nhanh 3 cap 2
		shiftwindow(12),
		clearwindow,
		write("Dua ra phuong phap hoc qua video...\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	tu_tuong_HCM_23_32 :-
		shiftwindow(12),
		clearwindow,
		write("Dua ra phuong phap lam du an nho viet bai luan\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	oop_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t   Lap trinh huong doi tuong"),
		shiftwindow(12),
		clearwindow,
		write("Ban co hieu khai niem co ban ve oop khong?\n\n"),
		write("Nhap 1: Co\n"),
		write("Nhap 2: Khong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_oop_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		oop_1.
		
	re_nhanh_oop_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		oop_21;
		Gtri_nhap = 2,
		oop_22.
	
	oop_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban co gap van de ve cu phap, ngon ngu khong?\n\n"),
		write("Nhap 1: Co\n"),
		write("Nhap 2: Khong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_oop_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		oop_21.
	
	re_nhanh_oop_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		oop_21_31;
		Gtri_nhap = 2,
		oop_21_32.
	
	oop_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Luyen tap va thuc hanh nhieu hon\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	oop_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Ban co gap kho khan voi tu duy huong doi tuong khong?\n\n"),
		write("Nhap 1: Co\n"),
		write("Nhap 2: Khong\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_oop_21_32_4(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		oop_21.
	
	re_nhanh_oop_21_32_4(Gtri_nhap) :- 
		Gtri_nhap = 1,
		oop_21_32_41;
		Gtri_nhap = 2,
		oop_21_32_42.
	
	oop_21_32_41 :-
		shiftwindow(12),
		clearwindow,
		write("De xuat cac phuong phap game hoa de tao dong luc...\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	oop_21_32_42 :-
		shiftwindow(12),
		clearwindow,
		write("Hoc nhung du an thuc te hoac cac chu de yeu thich\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	oop_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Loi khuyen ve on oop co ban\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	
	
	lap_trinh_web_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t\tLap trinh Web"),
		shiftwindow(12),
		clearwindow,
		write("Ban gap kho khan ve dieu gi?\n\n"),
		write("Nhap 1: Thieu kien thuc co ban\n"),
		write("Nhap 2: Gap kho khan trong viec xay dung quan ly co so du lieu\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_lap_trinh_web_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		lap_trinh_web_1.
		
	re_nhanh_lap_trinh_web_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		lap_trinh_web_21;
		Gtri_nhap = 2,
		lap_trinh_web_22.
	
	lap_trinh_web_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban thieu kien thuc ve mang nao?\n\n"),
		write("Nhap 1: FE\n"),
		write("Nhap 2: BE\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_lap_trinh_web_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		lap_trinh_web_21.
	
	re_nhanh_lap_trinh_web_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		lap_trinh_web_21_31;
		Gtri_nhap = 2,
		lap_trinh_web_21_32.
	
	lap_trinh_web_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Luyen tap tren free code camp / code pen\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	lap_trinh_web_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Doc tai lieu va luyen tap cac project nho\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).	
		
	lap_trinh_web_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Ban gap kho khan trong phan nao?\n\n"),
		write("Nhap 1: Kho khan trong viec truy van va toi uu\n"),
		write("Nhap 2: Kho khan trong viec xay dung database\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_lap_trinh_web_22_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		lap_trinh_web_22.
	
	re_nhanh_lap_trinh_web_22_3(Gtri_nhap) :- %cap 2 nhanh 2 re den cap 3
		Gtri_nhap = 1,
		lap_trinh_web_22_31;
		Gtri_nhap = 2,
		lap_trinh_web_22_32.
	
	lap_trinh_web_22_31 :- % nhanh 1 cap 3 thuoc nhanh 2 cap 2
		shiftwindow(12),
		clearwindow,
		write("Ban gap kho khan trong phan nao?\n\n"),
		write("Nhap 1: Phan tich va tuy van\n"),
		write("Nhap 2: Chua nam vung cau lenh truy van\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_lap_trinh_web_22_31_4(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		lap_trinh_web_22_31.
		
	re_nhanh_lap_trinh_web_22_31_4(Gtri_nhap) :- 
		Gtri_nhap = 1,
		lap_trinh_web_22_31_41;
		Gtri_nhap = 2,
		lap_trinh_web_22_31_42.	
	
	lap_trinh_web_22_31_41 :-
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich sinh vien su dung EXPLAIN trong SQL de phan tich cach ma co so du lieu thuc hien cac truy van\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	lap_trinh_web_22_31_42 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y tham gia cac trang web thuc hanh SQL nhu SQLZoo, LeetCode\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	lap_trinh_web_22_32 :-
		shiftwindow(12),
		clearwindow,
		write("Ban gap kho khan trong phan nao?\n\n"),
		write("Nhap 1: Chua hieu cac khai niem\n"),
		write("Nhap 2: Chua co ckinh nghiem\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_lap_trinh_web_22_32_4(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		lap_trinh_web_22_32.
		
	re_nhanh_lap_trinh_web_22_32_4(Gtri_nhap) :- 
		Gtri_nhap = 1,
		lap_trinh_web_22_32_41;
		Gtri_nhap = 2,
		lap_trinh_web_22_32_42.	
	
	lap_trinh_web_22_32_41 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y cac khoa hoc\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	lap_trinh_web_22_32_42 :-
		shiftwindow(12),
		clearwindow,
		write("De xuat cac bai thuc hanh\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		

	
	iot_1 :-
		shiftwindow(11),
		clearwindow,
		write("\t\t\t\tIoT va Ung dung"),
		shiftwindow(12),
		clearwindow,
		write("Ban cam thay dau la li do khien ban kem mon the chat?\n\n"),
		write("Nhap 1: Thieu kien thuc nen tang ve IoT\n"),
		write("Nhap 2: Kho khan trong viec ket noi cac thiet bi va he thong IoT\n"),
		write("Nhap 3: Thieu dong luc hoac gap kho khan voi du an thuc te\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 3),
		re_nhanh_iot_2(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		iot_1.
		
	re_nhanh_iot_2(Gtri_nhap) :-
		Gtri_nhap = 1,
		iot_21;
		Gtri_nhap = 2,
		iot_22;
		Gtri_nhap = 3,
		iot_23.
	
	iot_21 :- %21: cap 2 nhanh 1
		shiftwindow(12),
		clearwindow,
		write("Ban muon hoc theo qua phuong phap nao?\n\n"),
		write("Nhap 1: Hoc qua video va tai lieu tom tat\n"),
		write("Nhap 2: Thuc hanh qua vi du nho\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_iot_21_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		iot_21.
	
	re_nhanh_iot_21_3(Gtri_nhap) :- %cap 2 nhanh 1 re den cap 3
		Gtri_nhap = 1,
		iot_21_31;
		Gtri_nhap = 2,
		iot_21_32.
	
	iot_21_31 :- % nhanh 1 cap 3 thuoc nhanh 1 cap 2
		shiftwindow(12),
		clearwindow,
		write("Goi y sinh vien tham khao cac khoa hoc ngan tren Youtube, Coursera hoac Udemy ve IoT co ban.\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	iot_21_32 :-
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich bat dau voi mot bai tap don gian, nhu dieu khien den giao thong\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).	
		
	iot_22 :- %21: cap 2 nhanh 2
		shiftwindow(12),
		clearwindow,
		write("Ban muon duoc huong dan theo phuong phap nao?\n\n"),
		write("Nhap 1: Thuc hanh tren nen tang IoT ao\n"),
		write("Nhap 2: Huong dan tung buocg\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_iot_22_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		iot_22.
	
	re_nhanh_iot_22_3(Gtri_nhap) :- %cap 2 nhanh 2 re den cap 3
		Gtri_nhap = 1,
		iot_22_31;
		Gtri_nhap = 2,
		iot_22_32.
	
	iot_22_31 :- % nhanh 1 cap 3 thuoc nhanh 2 cap 2
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich sinh vien su dung cac nen tang nhu Tinkercad hoac Blynk de thuc hanh ket noi thiet bi\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	iot_22_32 :-
		shiftwindow(12),
		clearwindow,
		write("Goi y chia nho van de, vi du: kiem tra tung cam bien truoc khi ket noi toan bo he thong\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
		
	iot_23 :- %21: cap 2 nhanh 3
		shiftwindow(12),
		clearwindow,
		write("Ban muon lua chon phuong phap nao?\n\n"),
		write("Nhap 1: Hoc qua du an lien quan den so thich ca nhan\n"),
		write("Nhap 2: Lam viec theo nhom\n"),
		write("\nHay nhap so tuong ung: "),
		readint(Gtri_nhap),
		ktra_nhap_hoi_dap(Gtri_nhap, 2),
		re_nhanh_iot_23_3(Gtri_nhap);
		write("\n\n Gia tri nhap sai, vui long nhap lai"),
		readchar(_),
		iot_23.
	
	re_nhanh_iot_23_3(Gtri_nhap) :- %cap 2 nhanh 3 re den cap 3
		Gtri_nhap = 1,
		iot_23_31;
		Gtri_nhap = 2,
		iot_23_32.
	
	iot_23_31 :- % nhanh 1 cap 3 thuoc nhanh 3 cap 2
		shiftwindow(12),
		clearwindow,
		write("Goi y sinh vien chon chu đe du an thu vi (vi du: nha thong minh, thiet bi cham soc cay tu dong). \n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
	iot_23_32 :-
		shiftwindow(12),
		clearwindow,
		write("Khuyen khich sinh vien tim ban cung lop de chia nho cong viec va lam du an nhom.\n\n"),
		write("Nhan phim bat ki de tiep tuc...\n"),
		readchar(_).
	
		