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
		
		assert(mon_hoc(3, 1, "Lich su Dang Cong San Viet Nam", 
			"Ban da nam vung kien thuc! Hay doc them cac tai lieu nhu Lich su Dang Cong san Viet Nam (sach do Ban Tuyen giao Trung uong bien soan) va cac tai lieu tham khao ve cac ky Dai hoi Dang de hieu sau hon ve nhung quyet sach va chien luoc quan trong.", 
			"Ban co nen tang tot, hay doc them cac tai lieu ve tung giai doan lich su cu the nhu Cach mang Thang Tam 1945 hay Dai thang mua Xuan 1975 va lien he voi boi canh xa hoi va kinh te thoi do de cai thien diem so.", 
			"Ban can on tap lai cac giai doan lich su quan trong nhu qua trinh thanh lap Dang, thoi ky khang chien chong Phap va My, va cong cuoc doi moi. Hay hoc theo chu de tung giai doan va su dung so do tu duy de ghi nho cac su kien va nhan vat chinh.", 
			"Kien thuc cua ban dang bi hong. Hay doc sach Lich su Dang Cong san Viet Nam - Nhung chang duong lich su de cung co kien thuc nen. Bat dau tu nhung su kien quan trong nhat, hoc theo trinh tu thoi gian va nho ban be, thay co giai thich.", 
			"Ban nen bat dau tu cac tai lieu co ban nhu Giao trinh Lich su Dang Cong san Viet Nam. Hay len ke hoach hoc hang ngay, hoc tung giai doan va su dung cac tai lieu bo tro nhu So tay Lich su Dang de giup ban ghi nho va cung co kien thuc nen tang."
		)),
		assert(mon_hoc(3, 1, "He dieu hanh", 
			"Ban da nam vung kien thuc! Hay doc them Operating System Concepts cua Silberschatz de hieu sau ve quan ly tai nguyen va he thong. Thu xay dung cac mo phong nho de thuc hanh cac khai niem nhu lap lich CPU, quan ly bo nho, va dong bo hoa tien trinh.", 
			"Ban co nen tang tot. Doc them Modern Operating Systems cua Andrew Tanenbaum de cung co kien thuc va tim hieu cac he dieu hanh hien dai. Hay lam cac bai tap thuc hanh nhu cai dat va cau hinh he dieu hanh de tang ky nang thuc tien.", 
			"Ban hay on tap cac khai niem co ban nhu tien trinh, luong, quan ly bo nho va he thong tap tin. Su dung Operating Systems: Internals and Design Principles de hieu ro hon ve cac nguyen ly va thu nghiem tren cac he dieu hanh nhu Linux.", 
			"Kien thuc cua ban con yeu. Hay hoc lai cac khai niem nen tang qua sach Introduction to Operating Systems. Tap trung vao cac chu de co ban nhu tien trinh, luong, quan ly bo nho va he thong tap tin. Thuc hanh voi cac vi du don gian de hieu ro hon.", 
			"Ban hay hoc lai tu dau voi cac tai lieu nhu Operating Systems for Beginners. Hay len ke hoach hoc tung chu de tu tien trinh, bo nho, den quan ly tap tin, ket hop hoc ly thuyet voi thuc hanh cai dat va cau hinh he dieu hanh don gian de hieu co ban."
		)),
		assert(mon_hoc(3, 1, "Lap trinh huong doi tuong", 
			"Ban da nam vung kien thuc OOP! Hay doc them Design Patterns: Elements of Reusable Object-Oriented Software cua GoF de nang cao ky nang thiet ke. Thuc hanh xay dung cac du an lon, ap dung cac nguyen tac SOLID va thiet ke mau de viet ma hieu qua.", 
			"Ban co nen tang tot. Hay doc Object-Oriented Programming in Java cua Rick Halterman de cung co kien thuc va thuc hanh cac nguyen ly OOP nhu ke thua, da hinh, dong goi. Tim hieu cac mau thiet ke va ap dung vao cac bai tap thuc te de phat trien them.", 
			"Ban hay on tap lai cac khai niem nhu lop, doi tuong, ke thua va da hinh. Doc Introduction to Object-Oriented Programming cua Timothy Budd de hieu ro hon cach ap dung cac nguyen tac OOP. Thuc hanh viet ma voi cac du an nho, tu don gian den phuc tap.", 
			"Neu muon cai thien ban hay bat dau tu nhung khai niem co ban nhu lop va doi tuong qua sach Java: An Introduction to Problem Solving and OOP cua Walter Savitch. Thuc hanh qua cac vi du de nam ro cac nguyen tac nhu dong goi, ke thua va da hinh.", 
			"Ban hay doc cuon Starting Out with Java: From Control Structures through Objects cua Tony Gaddis va tap trung vao cac khai niem co ban sau do thuc hanh hang ngay, bat dau cac bai tap tu don gian den phuc tap de xay dung nen tang vung chac."
		)),
		assert(mon_hoc(3, 1, "Co so du lieu", 
			"Ban da nam vung kien thuc ve mon co so du lieu! Hay doc Database System Concepts cua Silberschatz de hieu sau hon ve cac ky thuat nang cao nhu toi uu hoa truy van, lap chi muc, va cac he thong phan tan va thuc hanh xay dung co so du lieu phuc tap.", 
			"Ban co nen tang tot. Hay doc cuon Fundamentals of Database Systems cua Elmasri de cung co ve mo hinh hoa du lieu va cac truy van SQL. Thuc hanh xay dung cac CSDL, tap trung vao thiet ke bang, khoa chinh, khoa ngoai, va cac phep ket noi.", 
			"Ban hay on tap lai cac khai niem ve mo hinh ER, cac loai khoa, va moi quan he giua cac bang. Thuc hanh cac bai tap truy van SQL don gian va tap trung vao cac lenh co ban nhu SELECT, JOIN, GROUP BY.", 
			"Kien thuc nen cua ban con yeu. Hay bat dau tu cac khai niem co ban qua sach Introduction to Databases cua Thomas Connolly. Hoc cach thiet ke bang, khoa chinh va khoa ngoai, dong thoi luyen tap cac truy van co ban de cai thien.", 
			"Ban nen hoc lai tu dau voi Beginning SQL cua Paul Wilton. Tap trung vao cac khai niem ve mo hinh du lieu, thiet ke co so du lieu va cac lenh SQL. Hay bat dau voi cac vi du don gian, hieu tung buoc cach xay dung co so du lieu va truy van du lieu."
		)),
		assert(mon_hoc(3, 1, "Mang may tinh", 
			"Ban da nam vung kien thuc mang may tinh! Hay doc them cuon Computer Networking: A Top-Down Approach cua Kurose va Ross de hieu ro hon ve cac giao thuc nang cao va mo hinh mang hien dai.", 
			"Ban co nen tang tot. Doc them Computer Networks cua Andrew Tanenbaum de cung co kien thuc ve TCP/IP, IP routing va bao mat mang. Thuc hanh cau hinh mang LAN/WAN va cac thiet lap bao mat co ban de nang cao ky nang thuc te.", 
			"Ban hay on tap lai cac khai niem ve mo hinh OSI, TCP/IP, dia chi IP, va cach hoat dong cua cac giao thuc. Ngoai ra ban hay thuc hanh cac bai tap don gian nhu cau hinh mang LAN va tim hieu cach cac thiet bi ket noi voi nhau.", 
			"Kien thuc nen cua ban con yeu. Hay bat dau hoc tu Introduction to Networking de nam vung cac khai niem ve cac tang giao thuc, dia chi IP, subnet mask, va cac thiet bi mang. Thuc hanh thiet lap cac mang nho, lam quen voi cach cac thiet bi giao tiep.", 
			"Ban nen bat dau voi Computer Networking First-Step cua Wendell Odom. Tap trung vao cac khai niem co ban nhat nhu cac loai mang, mo hinh OSI, va cac giao thuc pho bien va thuc hanh cau hinh thiet bi mang don gian."
		)),
		assert(mon_hoc(3, 1, "Lap trinh Python", 
			"Ban da nam vung kien thuc lap trinh Python! Hay doc them cuon Fluent Python cua Luciano Ramalho de nang cao ky nang va hieu sau hon ve cac tinh nang nang cao nhu generators, decorators, va metaclasses.", 
			"Ban co nen tang tot. Ban nen doc them cuon Python Crash Course cua Eric Matthes de cung co kien thuc, dac biet la ve lap trinh huong doi tuong va xu ly du lieu.", 
			"On tap lai cac khai niem co ban nhu vong lap, ham, va danh sach. Hay thu tao cac chuong trinh nho de giai quyet cac van de hang ngay, giup ban nam chac cu phap va tu duy lap trinh.", 
			"Kien thuc nen cua ban con yeu. Ban nen bat dau hoc tu cuon Python Programming for Beginners de nam ro cac khai niem co ban nhu bien, ham, va cau truc dieu khien. Thuc hanh qua cac vi du don gian nhu tinh toan, chuoi va danh sach de hieu ro hon.", 
			"Ban nen hoc lai tu dau voi cuon Learn Python the Hardway cua Zed Shaw. Tap trung vao cac khai niem co ban va thuc hanh viet ma hang ngay. Bat dau tu nhung chuong trinh nho, nhu tro choi doan so, de xay dung nen tang vung chac."
		)),
		assert(mon_hoc(3, 1, "Tieng Anh (Courses 3 Plus)", 
			"Ban da nam vung kien thuc! Hay thuc hanh giao tiep thuong xuyen va viet cac bai luan hoac bai nghien cuu de phat trien toan dien ky nang ngon ngu.", 
			"Ban co nen tang tot. Hay lam cac bai tap doc hieu va nghe phuc tap hon, tham gia vao cac cuoc thao luan bang tieng Anh de tang kha nang giao tiep tu tin. Tap viet cac bai luan ngan de phat trien ky nang viet.", 
			"Ban nen on tap lai cac diem ngu phap co ban nhu thi, cau bi dong, cau dieu kien va tu vung thong dung. Sau do thuc hanh nghe cac doan hoi thoai don gian, xem video tieng Anh co phu de va luyen viet cac doan van ngan.", 
			"Kien thuc nen cua ban con yeu. Hay hoc lai ngu phap va cau truc cau va lam cac bai tap tu vung va ngu phap co ban, nghe cac doan hoi thoai ngan va luyen noi voi ban be hoac giao vien de tang cuong ky nang giao tiep.", 
			"Ban nen tap trung vao viec hoc ngu phap, tu vung co ban va thuc hanh voi cac bai tap don gian. Hoc nghe cac doan hoi thoai ngan voi noi dung co ban, va dan dan nang cao kha nang noi qua viec luyen tap thuong xuyen."
		)),



		assert(mon_hoc(3, 2, "Nhap mon cong nghe phan mem", 
			"Ban da nam vung kien thuc co ban! Ban hay doc them cuon Software Engineering cua Ian Sommerville de hieu sau hon ve quy trinh phat trien phan mem, quan ly du an va cac phuong phap Agile.", 
			"Ban co nen tang tot. Ban nen doc cuon Head First Software Development de cung co kien thuc mo hinh hoa yeu cau, va kiem thu phan mem. Thuc hanh voi cac du an nho, ap dung cac phuong phap Agile hoac Waterfall de hieu ro quy trinh phat trien phan mem.", 
			"Ban nen on tap lai cac khai niem co ban nhu vong doi phat trien phan mem (SDLC), phan tich yeu cau, va thiet ke he thong. Thuc hanh lam viec theo nhom de hieu vai tro cua tung thanh vien trong du an.", 
			"Kien thuc nen cua ban con yeu. Ban hay doc cuon Software Engineering for Beginners de hoc lai cac khai niem co ban sau do thuc hanh qua cac du an de hieu cach cac giai doan phat trien phan mem ket noi voi nhau.", 
			"Ban nen hoc lai theo cuon Fundamentals of Software Engineering. Tap trung vao cac khai niem nhu vong doi phat trien phan mem, tai lieu hoa yeu cau. Thuc hanh qua cac du an de nam ro quy trinh phat trien phan mem tu dau den cuoi."
		)),
		assert(mon_hoc(3, 2, "Nhap mon tri tue nhan tao", 
			"Ban da nam vung kien thuc AI co ban! Hay doc them cuon Artificial Intelligence: A Modern Approach cua Russell va Norvig de hieu sau hon ve cac thuat toan nang cao, hoc may (machine learning), va hoc sau (deep learning).", 
			"Ban co nen tang tot. Hay doc cuon Machine Learning Yearning cua Andrew Ng de cung co kien thuc va hieu quy trinh xay dung mo hinh AI hieu qua. Thuc hanh voi cac du an nhu phan loai du lieu, phan cum, va lam quen voi cac thu vien.", 
			"Ban hay on tap cac khai niem co ban nhu thuat toan tim kiem, hoc co giam sat va khong giam sat. Doc Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow de hieu cac ung dung thuc te va thuc hanh xay dung cac mo hinh.", 
			"Kien thuc nen cua ban con yeu. Ban nen doc cuon Introduction to Artificial Intelligence de hoc lai cac khai niem nhu thuat toan, hoc may co ban, va cac ung dung AI sau do thuc hanh voi cac bai tap don gian de cai thien kien thuc.", 
			"Ban nen bat dau voi cuon AI for Beginners. Tap trung vao cac khai niem co ban nhu thuat toan tim kiem, hoc may don gian, cac ung dung AI va thuc hanh voi cac bai tap nho, lam quen voi cac cong cu AI co ban de xay dung nen tang kien thuc vung chac."
		)),
		assert(mon_hoc(3, 2, "An toan va Bao mat he thong thong tin", 
			"Ban da nam vung kien thuc bao mat he thong! Hay doc cuon The Web Application Hacker's Handbook va Applied Cryptography cua Bruce Schneier de hieu sau hon ve cac ky thuat tan cong, phong thu va ma hoa.", 
			"Ban co nen tang tot. Hay doc them cuon Computer Security: Principles and Practice cua Stallings de cung co kien thuc ve ma hoa, bao mat mang, va kiem soat truy cap va lam quen voi cac cong cu kiem thu bao mat nhu Wireshark, Metasploit.", 
			"De cai thien ban hay on tap cac khai niem co ban nhu ma hoa, xac thuc, bao mat mang, va cac loai tan cong pho bien. Thuc hanh cau hinh cac cong cu bao mat co ban va tim hieu cach phat hien, ngan chan tan cong.", 
			"Kien thuc nen cua ban con yeu. Ban nen doc cuon Network Security Essentials de hoc lai cac khai niem nhu tuong lua, ma hoa, va xac thuc. Thuc hanh thiet lap cac bien phap bao mat don gian nhu tuong lua va kiem tra he thong de hieu ro hon.", 
			"Ban nen tap trung vao cac khai niem co ban ve ma hoa, bao mat mang va bao ve du lieu. Thuc hanh thiet lap bao mat co ban tren may tinh ca nhan, hoc cach phat hien cac lo hong va cach bao ve he thong khoi cac moi de doa."
		)),
		assert(mon_hoc(3, 2, "Lap trinh Web", 
			"Ban da nam vung kien thuc lap trinh web! Hay doc them You Don't Know JS cua Kyle Simpson de hieu sau hon ve JavaScript va cac khia canh nang cao cua lap trinh web. Sau do tu lam cac project fullstack de nang cao trinh do.", 
			"Ban co nen tang tot. Doc them Eloquent JavaScript va Learning PHP, MySQL & JavaScript de cung co kien thuc ve phat trien full-stack. Hay thu xay dung cac ung dung voi Node.js, Express, hoac PHP va MySQL de hieu cach tich hop front-end voi back-end.", 
			"Ban hay on tap lai ve HTML, CSS, JavaScript va lam quen voi cac framework nhu Bootstrap, React, hoac Vue.js. Thuc hanh xay dung cac trang web don gian de nam chac cu phap va bo cuc.", 
			"Kien thuc nen cua ban con yeu. Hay doc cuon Web Design with HTML, CSS, JavaScript and jQuery cua Jon Duckett va sau do thuc hanh xay dung cac trang web tinh don gian va lam quen voi JavaScript de tao cac tinh nang dong.", 
			"Neu ban muon cai thien hay doc cuon Head First HTML and CSS de hieu cau truc trang web co ban. Thuc hanh viet ma hang ngay de lam quen voi cach tao bo cuc va tinh nang co ban cho mot trang web. Tu tu hoc them ve cac khai niem phuc tap hon."
		)),
		assert(mon_hoc(3, 2, "Co so du lieu phan tan", 
			"Ban da nam vung kien thuc co so du lieu phan tan! Hay doc cuon Distributed Systems: Principles and Paradigms cua Tanenbaum va Van Steen de hieu sau hon ve cac thuat toan dong bo, xu ly song song va quan ly phan tan.", 
			"Ban co nen tang tot. Doc them Principles of Distributed Database Systems cua M. Tamer Özsu de cung co kien thuc va thuc hanh xay dung cac he thong su dung NoSQL va co so du lieu nhu Cassandra hoac MongoDB de hieu cach phan phoi du lieu.", 
			"On tap lai cac khai niem ve phan mang (fragmentation), sao luu (replication), va dong bo hoa (synchronization). Thuc hanh voi cac bai tap thiet ke co so du lieu phan tan va lam viec voi cac he quan tri phan tan de hieu ro hon.", 
			"Kien thuc nen cua ban con yeu. Hay bat dau voi Fundamentals of Distributed Databases de hoc lai cac khai niem nhu phan mang, sao luu va tinh nhat quan. Thuc hanh voi cac vi du de hieu cach du lieu duoc phan phoi va quan ly trong moi truong phan tan.", 
			"Ban nen hoc lai cac khai niem co ban ve he thong va co so du lieu phan tan. Tap trung vao viec hieu cac van de nhu tinh nhat quan, tinh san sang, va tinh chiu loi, dong thoi thuc hanh voi cac bai tap nho de xay dung nen tang vung chac."
		)),
		Z32TTCSYeu_0 = "Ban nen tap trung vao viec hoc hoi tu nhung nhiem vu co ban nhat va tim su giup do tu cac dong nghiep hoac huong dan vien. Doc cac tai lieu co ban lien quan den cong viec ban dang lam.",
		Y32TTCSYeu_1 = " Thuc hien tung buoc nho de hoan thanh cong viec va hoc cach lap ke hoach cong viec hang ngay.",
		concat(Z32TTCSYeu_0, Y32TTCSYeu_1, Z32TTCSYeu_1),
		assert(mon_hoc(3, 2, "Thuc tap co so", 
			"Ban da nam vung kien thuc thuc te! Hay tiep tuc phat trien bang cach tham gia vao cac du an thuc te tai cong ty hoac to chuc lien quan den linh vuc cua ban va hay tu tin chu dong trong cac du an ban tham gia.", 
			"Ban co nen tang tot. Hay tiep tuc thuc hanh nhieu hon trong moi truong thuc te va co gang tim hieu sau hon ve quy trinh lam viec cua cong ty hoac to chuc. Thuc hanh cac ky nang nhu viet bao cao, ghi chep tien do cong viec, va quan ly du an nho.", 
			"Ban can tap trung hon vao viec lam quen voi moi truong thuc te. Ban nen doc cuon The Internship Bible de hoc cach quan ly thoi gian, ghi chep va lap ke hoach cong viec hieu qua.", 
			"Ban nen bat dau bang cach hoc tu cac dong nghiep, hoi them ve quy trinh cong viec va lam quen voi cac cong cu co ban trong moi truong thuc tap. Tap trung vao viec hieu ro nhiem vu cua minh va cai thien kha nang lam viec doc lap.", 
			Z32TTCSYeu_1
		)),



		assert(mon_hoc(4, 1, "Quan ly du an phan mem", 
			"Ban da nam vung kien thuc quan ly du an phan mem! Hay doc them Agile Project Management with Scrum cua Ken Schwaber de hieu sau hon ve cac phuong phap Agile va cach quan ly du an hieu qua.", 
			"Ban co nen tang tot. Ban nen doc them Software Project Management cua Bob Hughes de cung co kien thuc ve lap ke hoach du an, quan ly thoi gian va ngan sach. Hay thu tham gia cac du an nhom nho de nang cao ky nang lap ke hoach va dieu phoi nhom.", 
			"De cai thien ban hay on tap cac khai niem co ban nhu vong doi du an (SDLC), lap ke hoach, quan ly rui ro va tai nguyen. Thuc hanh bang cach quan ly cac du an nho de lam quen voi cac cong cu lap ke hoach.", 
			"Kien thuc nen cua ban con yeu. Hay bat dau voi cuon Introduction to Software Project Management de hoc lai cac khai niem va tap trung vao cac phuong phap quan ly co ban va thuc hanh voi cac bai tap mo phong de hieu cach dieu phoi va theo doi tien do.", 
			"Ban nen tap trung vao viec nam ro cac khai niem co ban nhu lap ke hoach, theo doi tien do, va quan ly tai nguyen. Hay bat dau voi cac du an don gian, thuc hanh lap ke hoach va phan cong cong viec de xay dung nen tang vung chac."
		)),
		assert(mon_hoc(4, 1, "Phan tich va thiet ke he thong thong tin", 
			"Ban da nam vung kien thuc phan tich va thiet ke he thong! Hay doc them Systems Analysis and Design cua Kenneth Kendall de hieu sau hon ve cac phuong phap hien dai nhu Agile va DevOps.", 
			"Ban co nen tang tot. Hay doc them Modern Systems Analysis and Design cua Jeffrey Hoffer de cung co kien thuc va thuc hanh voi cac du an thuc te de phat trien ky nang phan tich va lap ke hoach he thong.", 
			"Neu muon cai thien diem so ban nen on tap lai cac khai niem co ban nhu vong doi phat trien he thong (SDLC), phan tich yeu cau va lap mo hinh UML va thuc hanh voi cac bai tap mo phong va thiet ke he thong don gian.", 
			"Kien thuc nen cua ban con yeu. Hay doc cuon Introduction to Systems Analysis and Design de hoc lai cac khai niem nhu thu thap yeu cau, lap mo hinh du lieu... sau do thuc hanh voi cac vi du don gian de hieu ro cach phan tich va xay dung he thong.", 
			"Ban nen tap trung vao cac khai niem co ban nhu lap mo hinh quy trinh, thiet ke he thong va phan tich yeu cau, cai dat, kiem thu, bao tri. Thuc hanh voi cac bai tap nho de lam quen voi cac cong cu phan tich va ky thuat thiet ke."
		)),
		assert(mon_hoc(4, 1, "Xu ly anh", 
			"Ban da nam vung kien thuc xu ly anh! Hay doc Digital Image Processing cua Gonzalez va Woods de hieu sau hon ve cac ky thuat nang cao nhu phan doan, nen anh va nhan dang doi tuong.", 
			"Ban co nen tang tot. Doc them Programming Computer Vision with Python cua Jan Erik Solem de cung co kien thuc ve cac ky thuat xu ly anh co ban va nang cao sau do thuc hanh voi cac bai tap ve loc anh, phat hien canh va bien doi anh.", 
			"De cai thien diem so ban nen on tap lai cac khai niem co ban nhu loc anh, bien doi Fourier, va phat hien bien. Sau do thuc hanh xu ly anh voi cac cong cu co ban trong OpenCV de lam quen voi cac thuat toan.", 
			"Kien thuc nen cua ban con yeu. Hay doc cuon Introduction to Digital Image Processing de hoc lai cac khai niem va thuc hanh voi cac vi du don gian, tap trung vao hieu ro cach tung thuat toan xu ly anh hoat dong.", 
			"Ban nen tap trung vao cac khai niem co ban nhu xu ly anh xam, loc, va chuyen doi hinh anh. Thuc hanh voi cac bai tap nho de hieu ro cach cac thao tac xu ly anh co ban hoat dong va lam quen voi cac cong cu nhu Python va OpenCV."
		)),
		assert(mon_hoc(4, 1, "Phat trien he thong thong minh", 
			"Ban da nam vung kien thuc phat trien he thong thong minh! Hay doc Artificial Intelligence: A Modern Approach cua Russell va Norvig de hieu sau hon ve cac thuat toan hoc sau, hoc tang cuong va xu ly ngon ngu tu nhien.", 
			"Ban co nen tang tot. Doc them Deep Learning cua Ian Goodfellow de cung co kien thuc ve cac mo hinh mang no-ron sau va hoc tang cuong. Thuc hanh phat trien cac du an don gian nhu chatbot de hieu ro cach tich hop cac mo hinh AI vao ung dung thuc te.", 
			"Ban nen on tap lai cac khai niem co ban ve hoc may (machine learning), mang no-ron (neural networks) va cac thuat toan tim kiem. Sau do lam bai tap don gian nhu phan loai du lieu hoac xu ly hinh anh de cai thien diem so.", 
			"Ban nen doc cuon Introduction to Machine Learning with Python de hoc lai cac khai niem nhu hoc co giam sat, khong giam sat va cac mo hinh co ban sau do thuc hanh voi cac vi du don gian de hieu cach cac he thong thong minh hoat dong.", 
			"Ban nen tap trung vao cac khai niem co ban nhu mo hinh hoc may, xu ly du lieu va xay dung cac mo hinh du doan don gian. Thuc hanh voi cac bai tap co ban de lam quen voi cac cong cu nhu Python, scikit-learn va TensorFlow."
		)),
		assert(mon_hoc(4, 1, "Lap trinh mang", 
			"Ban da nam vung kien thuc lap trinh mang! Hay doc Unix Network Programming cua W. Richard Stevens de hieu sau hon ve cac giao thuc mang, lap trinh socket nang cao va xu ly da luong.", 
			"Ban co nen tang tot. Doc them Java Network Programming cua Elliotte Rusty Harold hoac Python Network Programming Cookbook de cung co kien thuc va xay dung cac ung dung mang nhu ", 
			"On tap cac khai niem co ban nhu lap trinh socket, giao thuc TCP/UDP va mo hinh client-server. Doc Foundations of Python Network Programming de hieu ro hon ve cach lap .", 
			"Kien thuc nen con yeu. Hay bat dau voi Beej's Guide to Network Programming de hoc lai cac khai niem co ban nhu socket, dia chi IP va cong. Thuc hanh voi cac vi du don gian ve giao tiep giua client-server de hieu ro cach thiet lap va xu ly ket noi.", 
			"Ban nen tap trung vao cac khai niem co ban nhu socket, giao thuc TCP/UDP, va lap trinh client-server. Thuc hanh bang cach xay dung cac chuong trinh don gian nhu chat app co ban de hieu cach mang may tinh hoat dong va lam quen voi cac giao thuc mang."
		)),
		assert(mon_hoc(4, 1, "IoT va Ung dung", 
			"Ban da nam vung kien thuc IoT! Hay doc Building the Internet of Things cua Maciej Kranz de hieu sau hon ve cac kien truc IoT phuc tap va ung dung thuc te.", 
			"Ban co nen tang tot. Hay doc them cuon Internet of Things: A Hands-On Approach de cung co kien thuc va thuc hanh voi cac du an nhu he thong dieu khien thiet bi tu xa hoac tu dong hoa nha thong minh de hieu ro hon.", 
			"Ban nen on tap cac khai niem co ban nhu cam bien, giao thuc truyen thong (MQTT, HTTP), va cloud computing. Sau do thuc hanh thiet lap cac he thong don gian nhu giam sat moi truong hoac dieu khien thiet bi qua Internet.", 
			"Kien thuc nen cua ban con yeu. Ban nen hoc lai cac khai niem nhu thiet bi ket noi, cam bien va truyen du lieu. Thuc hanh voi cac vi du don gian nhu bat/tat thiet bi tu xa hoac thu thap du lieu tu cam bien qua WiFi.", 
			"Ban nen tap trung vao cac khai niem co ban nhu cam bien, cac giao thuc truyen thong va cach ket noi thiet bi voi Internet. Xay dung cac du an nho nhu he thong do nhiet do hoac dieu khien den tu xa de hieu ro cach he thong IoT hoat dong."
		)),
		assert(mon_hoc(4, 1, "Phuong phap luan nghien cuu khoa hoc", 
			"Ban da nam vung phuong phap nghien cuu khoa hoc! Hay doc them cuon Research Design: Qualitative, Quantitative, and Mixed Methods Approaches cua John Creswell de hieu sau hon ve cac phuong phap phan tich, thiet ke nghien cuu va xu ly du lieu.", 
			"Ban co nen tang tot. Hay doc them cuon The Craft of Research cua Wayne C. Booth de cung co kien thuc, sau do thuc hien cac du an, viet bao cao va ap dung cac phuong phap phan tich du lieu nhu dinh tinh va dinh luong.", 
			"Ban nen on tap lai cac buoc co ban cua quy trinh nghien cuu khoa hoc, tu xac dinh van de den thu thap va phan tich du lieu. Sau do thuc hanh viet cac bao cao ngan va trinh bay ket qua nghien cuu mot cach mach lac.", 
			"Kien thuc nen con yeu. Ban nen hoc lai cac khai niem co ban nhu xac dinh van de nghien cuu, phuong phap thu thap du lieu va cach phan tich. Sau do thuc hanh lap ke hoach cho cac nghien cuu nho de lam quen voi quy trinh.", 
			"Ban nen tap trung vao cac buoc co ban nhu thiet ke nghien cuu, xay dung cau hoi nghien cuu va phan tich du lieu. Thuc hanh bang cach viet cac de cuong nghien cuu don gian va hoc cach trinh bay ket qua."
		)),



		assert(mon_hoc(4, 2, "Phat trien ung dung cho thiet bi di dong", 
			"Ban da nam vung kien thuc phat trien ung dung di dong! Hay doc cuon Android Programming: The Big Nerd Ranch Guide hoac iOS Programming: The Big Nerd Ranch Guide de hieu sau hon ve cac ky thuat nang cao.", 
			"Ban co nen tang tot. Hay doc them cuon Kotlin Programming: The Big Nerd Ranch Guide (Android) hoac Swift Programming (iOS) de cung co kien thuc va xay dung cac ung dung nhu chat app, cac app tich hop dich vu web de nam ro quy trinh phat trien.", 
			"Ban nen on tap cac khai niem co ban nhu giao dien nguoi dung (UI), xu ly su kien, va luu tru du lieu. Sau do tao cac ung dung don gian nhu may tinh hoac trinh phat nhac de lam quen voi cac cong cu va ngon ngu lap trinh.", 
			"Kien thuc nen cua ban con yeu. Hay hoc lai cac khai niem co ban nhu tao UI, quan ly du lieu va xu ly su kien. Sau do xay dung cac app nho nhu ghi chu hoac dong ho bao thuc de hieu cach cac thanh phan ket hop voi nhau.", 
			"Ban nen tap trung vao cac khai niem co ban nhu thiet ke giao dien, quan ly hoat dong, va ket noi du lieu. Sau do xay dung cac ung dung don gian va dan lam quen voi viec xu ly cac tuong tac co ban de xay dung nen tang vung chac."
		)),
		assert(mon_hoc(4, 2, "Dam bao chat luong phan mem", 
			"Ban da nam vung kien thuc dam bao chat luong phan mem! Hay doc Software Quality Assurance: From Theory to Implementation cua Daniel Galin de hieu sau hon ve cac quy trinh kiem thu nang cao, cac tieu chuan quoc te (ISO, CMMI), va quy trinh Agile.", 
			"Ban co nen tang tot. Hay doc them Lessons Learned in Software Testing cua Cem Kaner de cung co kien thuc sau do viet kich ban kiem thu tu dong voi cac cong cu nhu Selenium hoac JUnit, va tham gia cac du an nhom de hieu ro hon ve quy trinh QA.", 
			"Ban nen doc cuon Foundations of Software Testing de hieu ro ve cac loai kiem thu va cach thuc lap ke hoach kiem thu. Sau do viet test case va thuc hien cac bai kiem thu don gian de lam quen voi quy trinh QA.", 
			"Kien thuc nen con yeu. Ban nen hoc lai cac khai niem nhu vong doi kiem thu, cac loai kiem thu va ky thuat viet test case. Sau do lam viec voi cac vi du kiem thu nho de hieu ro hon ve quy trinh kiem thu phan mem.", 
			"Ban nen tap trung vao cac khai niem co ban nhu kiem thu thu cong, tu dong hoa kiem thu, va quy trinh kiem thu phan mem. Thuc hanh viet cac test case don gian va hoc cach su dung cac cong cu kiem thu co ban de xay dung nen tang kien thuc vung chac."
		)),
		assert(mon_hoc(4, 2, "Kien truc va thiet ke phan mem", 
			"Ban da nam vung kien thuc ve kien truc va thiet ke phan mem! Ban nen doc them Design Patterns: Elements of Reusable Object-Oriented Software va Software Architecture in Practice de hieu sau hon ve cac mau thiet ke va phong cach kien truc.", 
			"Ban co nen tang tot. Ban nen doc them Clean Architecture de cung co kien thuc, sau do thiet ke cac he thong vua va nho, ap dung cac mau thiet ke (Design Patterns) nhu MVC, Singleton va Observer de hieu ro cach cac thanh phan phoi hop voi nhau.", 
			"Ban nen on tap lai cac khai niem co ban nhu nguyen tac thiet ke (SOLID), mau thiet ke, va cac loai kien truc phan mem (Layered, Microservices). Sau do doc them cuon Head First Design Patterns de hieu ro hon ve cac mau thiet ke pho bien.", 
			"Kien thuc nen cua ban con yeu. Ban nen hoc lai cac khai niem co ban ve kien truc phan mem, tu mo hinh hoa den thiet ke he thong. Sau do thiet ke cac he thong don gian va hoc cach ap dung cac nguyen tac thiet ke vao thuc te.", 
			"Ban nen doc cuon Introduction to Software Architecture de hieu cac khai niem nhu phan lop, mo hinh MVC, va cac nguyen ly thiet ke co ban. Sau do tao cac du an nho va ap dung cac mau thiet ke don gian de xay dung nen tang kien thuc vung chac."
		)),
		assert(mon_hoc(4, 2, "Chuyen de cong nghe phan mem", 
			"Ban da nam vung kien thuc ve cong nghe phan mem! Hay doc Continuous Delivery cua Jez Humble de tim hieu them ve DevOps va cac phuong phap trien khai phan mem hien dai.", 
			"Ban co nen tang tot. Hay doc them cuon Software Architecture Patterns cua Mark Richards de hieu ro hon ve cac mo hinh kien truc phan mem va hay tham gia vao cac du an nhom de thuc hanh trien khai cac he thong phan mem phuc tap va cai thien ky nang lam viec nhom.", 
			"Ban hay on tap lai cac khai niem co ban ve kien truc phan mem, quan ly vong doi phan mem va kiem thu tu dong sau do thuc hanh voi cac du an nho de hieu ro cach ap dung ly thuyet vao thuc te.", 
			"Ban hay hoc lai cac khai niem co ban nhu quy trinh phat trien phan mem, kiem thu va bao tri phan mem. Thuc hanh bang cach tham gia vao cac du an nho de hieu cach van hanh cong nghe phan mem.", 
			"Ban nen tap trung vao cac buoc phat trien phan mem tu lap ke hoach den kiem thu va bao tri. Thuc hanh voi cac bai tap nho de hieu ro cach phat trien va quan ly du an phan mem."
		)),
		assert(mon_hoc(4, 2, "Xay dung cac he thong nhung", 
			"Ban da nam vung kien thuc ve he thong nhung! Ban nen doc them cuon Embedded Systems Architecture cua Tammy Noergaard de hieu them ve kien truc va toi uu hoa he thong nhung.", 
			"Ban co nen tang tot. Hay doc them Programming Embedded Systems de cung co kien thuc sau do phat trien cac ung dung nhung don gian voi vi dieu khien nhu ESP32 hoac ARM Cortex de hieu ro hon ve giao tiep giua phan cung va phan mem.", 
			"Ban nen tham khao cuon Embedded Systems Design cua Steve Heath de hieu ro hon ve cac ky thuat thiet ke he thong nhung va thuc hanh lap trinh va cau hinh vi dieu khien cho cac bai toan nho nhu dieu khien dong co hoac doc cam bien.", 
			"Kien thuc nen cua ban con yeu. Ban nen hoc lai cac khai niem co ban nhu lap trinh nhung, quan ly bo nho va cac giao thuc truyen thong. Thuc hanh voi cac bai tap co ban nhu dieu khien LED hoac cam bien de lam quen voi lap trinh he thong nhung.", 
			"Ban nen hoc cach lap trinh co ban cho vi dieu khien va lam quen voi cac khai niem co ban nhu xu ly ngat va giao tiep I2C/SPI. Thuc hanh bang cach lap trinh cac du an nho nhu dieu khien thiet bi tu xa de hieu ro cach he thong nhung hoat dong."
		)),
		assert(mon_hoc(4, 2, "Phat trien phan mem huong dich vu", 
			"Ban da nam vung kien thuc ve phat trien phan mem huong dich vu! Ban nen doc them cuon SOA with REST cua Thomas Erl de hieu sau hon ve cac mo hinh kien truc dich vu va ap dung chung vao thuc te.", 
			"Ban co nen tang tot. Doc them Building Microservices de cung co kien thuc va thuc hanh bang cach phat trien cac ung dung dua tren dich vu nho voi Spring Boot, Node.js va ket noi cac dich vu voi nhau thong qua API REST.", 
			"Ban nen on tap cac khai niem co ban ve SOA (Service-Oriented Architecture), RESTful APIs, va giao thuc HTTP. va thuc hanh tao cac API REST don gian va xay dung ung dung nho dua tren dich vu.", 
			"Kien thuc nen cua ban con yeu. Hay bat dau lai voi cuon Service-Oriented Architecture for Dummies de hoc lai cac khai niem nhu thiet ke dich vu va cach ket noi cac dich vu voi nhau.", 
			"Ban nen tap trung vao cac khai niem co ban nhu API, dich vu RESTful va cach to chuc he thong huong dich vu. Thuc hanh phat trien cac du an nho, tap trung vao viec xay dung cac dich vu co ban va tich hop chung vao he thong lon hon."
		)),

		assert(mon_hoc(5, 1, "Thuc tap Tot nghiep", 
			"Ban da nam vung kien thuc va ky nang trong thuc tap! Hay doc cuon The Effective Executive cua Peter Drucker de nang cao ky nang lam viec va quan ly thoi gian. Chuan bi ky luong cho bao cao thuc tap va tu tin thuyet trinh ket qua truoc hoi dong.", 
			"Ban co nen tang tot. Hay tim hieu sau hon ve cac quy trinh tai noi thuc tap va co gang hoan thien du an thuc tap cua minh. Luyen tap viet bao cao thuc tap chi tiet, ro rang va tap trung vao cai thien ky nang trinh bay va phan bien de san sang cho buoi bao ve thuc tap.", 
			"Ban can tap trung hon vao viec thuc hien cac nhiem vu thuc te tai noi thuc tap. Hay chu dong yeu cau gop y tu nguoi huong dan de hoan thien du an va chuan bi bao cao thuc tap can than.", 
			"Kien thuc va ky nang thuc te cua ban con han che. Hay chu trong vao viec hoc hoi them tu nhung nhiem vu thuc te nho va tap trung vao viec hoan thanh tung phan cua bao cao thuc tap mot cach chi tiet, tu tu xay dung ky nang lam viec doc lap.", 
			"Ban can co gang nhieu hon trong viec thuc hien cac nhiem vu thuc tap. Hay tim hieu ky cac yeu cau cua bao cao thuc tap va nho su giup do tu nguoi huong dan. Chia nho cac nhiem vu va lap ke hoach cu the de hoan thanh du an thuc tap dung thoi han."
		))
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
 