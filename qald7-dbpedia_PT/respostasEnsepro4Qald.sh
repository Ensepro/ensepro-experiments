
#usage: ensepro_main.py [-h] [-frase FRASE] [-arquivo-frases ARQUIVO_FRASES]
#                       [-save-json] [-save-txt] [-tr] [-sin] [-cn] [-lv]
#                       [-arvore] [-tags] [-resposta] [-verbose] [-quiet]
#                       [-original] [-final] [--sem-resposta]

shopt -s expand_aliases
alias ensepro='python3.6 /root/github/ensepro-core/main/ensepro_main.py'

frases=`python3 extractQaldQuestions.py $*`
IFS=$'\n'
rm -f respostasEnsepro4Qald.txt
set j=0
for frase in $frases
do
	>&2 echo Frase $((++j)): $frase
	echo -n Frase $j: $frase >> respostasEnsepro4Qald.txt
	if [ $j -eq 83 ] && [ $j -eq 193 ]
	then
		echo " Skipping..." >> respostasEnsepro4Qald.txt
		continue
	fi
	# JSON
	#ensepro -save-json  -resposta -frase "$frase"
	#mv resultados.json resultados-`printf '%.3d' $j`-$frase.json
	# TXT
	ensepro -resposta -somente-resposta -frase "$frase">> respostasEnsepro4Qald.txt
	#mv resultados.txt `printf '%.3d' $j`-$frase.res
	#break
done
