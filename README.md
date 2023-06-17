hashcat --force --hwmon-temp-abort=100 -m 1000 -D 1,2 -a 3 -i --increment-min 5 --increment-max 12 -1 ?l?u?d FB6CEDE76A37702EAD2615DC27B626EF ?1?1?1?1?1?1?1?1?1?1?1?1?1


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
