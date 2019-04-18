
#usage: ensepro_main.py [-h] [-frase FRASE] [-arquivo-frases ARQUIVO_FRASES]
#                       [-save-json] [-save-txt] [-tr] [-sin] [-cn] [-lv]
#                       [-arvore] [-tags] [-resposta] [-verbose] [-quiet]
#                       [-original] [-final] [--sem-resposta]

shopt -s expand_aliases
alias ensepro='python3.6 /root/github/ensepro-core/main/ensepro_main.py'

frases=`python3 extractQaldQuestions.py $*`
IFS=$'\n'
set j=0
for frase in $frases
do
	>&2 echo Frase $((++j)): $frase
	[ $j -le 82 ] && continue
	echo "-> Frase $j: $frase"
	# JSON
	#ensepro -save-json  -resposta -frase "$frase"
	#mv resultados.json resultados-`printf '%.3d' $j`-$frase.json
	# TXT
	ensepro -save-txt  -resposta -frase "$frase"
	mv resultados.txt `printf '%.3d' $j`-$frase.txt
	#break
done
