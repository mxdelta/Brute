#!/bin/bash
if [ -z "$1" ]
then
    echo "Usage: script.sh file_whith_name.txt file_output.txt" >&2
    exit 1
fi
iteration=0
firstletters_rus="a б в г д е ж з и к л м н о п р с т у ф х ц ч ш щ э ю я "
secondletters_rus="a б в г д е ж з и к л м н о п р с т у ф х ц ч ш щ э ю я "

firstletters_dot_rus=".a .б .в .г .д .е .ж .з .и .к .л .м .н .о .п .р .с .т .у .ф .х .ц .ч .ш .щ .э .ю .я "
firstletters_dot_rus=".a .б .в .г .д .е .ж .з .и .к .л .м .н .о .п .р .с .т .у .ф .х .ц .ч .ш .щ .э .ю .я "


cat $1 > $2

while IFS= read -r line; do
	for fletter in $firstletters_rus; do
	  	for sletter in $secondletters_rus;do	  
	  		iteration=$((iteration+1))
	  		echo "$line""$fletter""$sletter" >> $2
	    		echo "Parsing string: $line""$fletter""$sletter"" Iteration: $iteration" 
	    		
	    		 	
	    	done
	done
done < "$1"
