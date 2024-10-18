import re
f = open("C:/PROLOG/BTL_git/Luat_Prolog_Loclam.txt", "r")
inputString = f.read()
strs = re.findall(r'"([^"]*)"', inputString)
str_len_over_250 = []
for s in strs:
    if len(s) > 250:
        str_len_over_250.append(s)
print(str_len_over_250)