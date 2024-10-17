def split_250(str0, Hoc_loai, Nam, Ki):
    cnt = 0
    Z = "Z" + str(Nam) + str(Ki) + str(Hoc_loai) + "_" + str(cnt)
    Res = Z + ' = "' + str0[:250] + '",\n'
    it = 250
    Y = ""
    while (len(str0) - it > 0):
        cnt += 1
        last = min(it + 250, len(str0))
        Y = "Y" + str(Nam) + str(Ki) + str(Hoc_loai) + "_" + str(cnt)
        Res = Res + Y + ' = "' + str0[it:last] + '",\n'
        Znew = "Z" + str(Nam) + str(Ki) + str(Hoc_loai) + "_" + str(cnt)
        Res = Res + "concat(" + Z + ", " + Y + ", " + Znew +"),\n"
        Z = Znew
        it += 250
    return Z, Res



Nam = 6
Ki = 2
Mon_hoc = "Mon hoc 62"
Gioi = "loi khuyen Gioi dfasgsdgsdfsedfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;and"
Kha = "loi khuyen Kha dfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;anddfasgsdgsdfsedfhsjghwrjkgfhskdhgsfjksdhjksdflkdnjk;sdnfdl;and"
Tb = "loi khuyen trung binh"
Yeu = "loi khuyen Yeu"
Kem = "loi khuyen Kem"
Ans = ""

Z_Gioi = ""
Z_Kha = ""
Z_Tb = ""
Z_Yeu = ""
Z_Kem = ""
Res_Gioi = ""
Res_Kha = ""
Res_Tb = ""
Res_Yeu = ""
Res_Kem = ""
if(len(Gioi) > 250):
    Z_Gioi, Res_Gioi = split_250(Gioi, "Gioi", Nam, Ki)
else:
    Z_Gioi = "Z" + str(Nam) + str(Ki) + "Gioi" + "_1" 
    Res_Gioi = Z_Gioi + ' = "' + Gioi + '",\n'

if(len(Kha) > 250):
    Z_Kha, Res_Kha = split_250(Kha, "Kha", Nam, Ki)
else:
    Z_Kha = "Z" + str(Nam) + str(Ki) + "Kha" + "_1" 
    Res_Kha = Z_Kha + ' = "' + Kha + '",\n'

if(len(Tb) > 250):
    Z_Tb, Res_Tb = split_250(Tb, "Tb", Nam, Ki)
else:
    Z_Tb = "Z" + str(Nam) + str(Ki) + "Tb" + "_1" 
    Res_Tb = Z_Tb + ' = "' + Tb + '",\n'

if(len(Yeu) > 250):
    Z_Yeu, Res_Yeu = split_250(Yeu, "Yeu", Nam, Ki)
else:
    Z_Yeu = "Z" + str(Nam) + str(Ki) + "Yeu" + "_1" 
    Res_Yeu = Z_Yeu + ' = "' + Yeu + '",\n'

if(len(Kem) > 250):
    Z_Kem, Res_Kem = split_250(Kem, "Kem", Nam, Ki)
else:
    Z_Kem = "Z" + str(Nam) + str(Ki) + "Kem" + "_1" 
    Res_Kem = Z_Kem + ' = "' + Kem + '",\n'

Ans = Res_Gioi + Res_Kha + Res_Tb + Res_Yeu + Res_Kem + "assert(mon_hoc(" + str(Nam) + ", " + str(Ki) + ', "' + Mon_hoc + '", ' + Z_Gioi + ', ' + Z_Kha + ', ' + Z_Tb + ", " + Z_Yeu + ", " + Z_Kem + ")),\n"
print(Ans)

