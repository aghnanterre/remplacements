#!/bin/sh


#remplacement (){
#sed -i -e "s/$2/$3/g" $1
#}

# La fonction capitalisation() prend pour argument une string, et met en majuscule sont premier caractère 
capitalisation () {
	CI=`echo ${1:0:1}  |tr -s a-z A-Z` # lettre initiale capitalisée
	echo "$CI""${1:1}" # "mot" (ligne) capitalisé-e à retourner 
}

# La fonction comptage() renvoie le nombre d'occurrences du deuxième argument dans le fichier qu'est le premier argument
# $3 : le mot que concerne la variante qu'est $1
# $4 date de l'exécution
comptage(){
	i=0
#	cat "$1" 
	for mot in $(cat $1);
		do 
		if [ "$mot" = "$2" ]; then
			i=$(($i+1))
		fi
		done
	echo "\t\t$i" occurrence\(s\) de "$2"
	echo "$1"\;"$2" \;$i\;$4>> logRemplacements.csv
		}



effectif(){
# $1 : fichier dans lequel les remplacements sont faits
# $2 mot remplacé
# $3 mot de remplacement
# $4 numéro de l'étape
# $5 date
# $6 mot remplacé sous ses différentes formes (dont $2 est une))

echo etape n° $4
#echo  remplacer::$2::par::$3:: dans le fichier $1
comptage $tx $2 $5 $6
}

remplacement(){	#$1 est le nom du fichier, $2 est le mot à remplacer $3 est la date de l'execution


cp=`capitalisation $2`

echo
cat $1

# 1 "Xxx@s ">"Xxx " puis "Xxx ">"Xxx@s"

effectif $1 `capitalisation $2`@s\  `capitalisation $2`\   $2 $3 1.1	# enlever tous les @s  # etape n°1.1
effectif $1 `capitalisation $2`\  `capitalisation $2`@s\  1.2	# enlever tous les @s  # etape n°1.2


# 2 "xxx@s ">"xxx " puis "xxx ">"xxx@s "

effectif $1 $2@s\  $2\  2.1	# enlever tous les @s  # etape n°2.1
effectif $1 $2\  $2@s\  2.2	# ajouter tous les @s	# etape n°2.2


# 3  "xxx." > "xxx@s."
effectif $1 $2@s. $2. 3.1	# enlever tous les @s  # etape n°3.1
effectif $1 $2. $2@s. 3.2 	# ajouter tous les @s	# etape n°3.2

#0.4 "Xxx." > "Xxx@s"
 effectif $1 `capitalisation $2`@s. `capitalisation $2`. 4.1	# enlever tous les @s  # etape n°4.1
effectif $1 `capitalisation $2`. `capitalisation $2`@s. 4.2	# enlever tous les @s  # etape n°4.2
}

# initialiser le fichier  $logMod  
 

processusArepeter(){ 
# fonction qui reçoit en argument ($1)) la ligne (càd le mot) pour laquelle un processus est fait
#argument $2 est le fichier dans lequel les remplacements sont faits.
# $3 est la date de l'exécution qui a lancé la fonction

fichAR=$3
mot=$2
#echo mot à traiter : "\t"\'$mot\' 
#motCapitalise=`capitalisation $mot`
#echo mot capitalisé : "\t"\'$motCapitalise\'

echo voici fichierLieu où est le texte à compléter par des @s : $1
echo voici le fichier qui donne la liste des mots concernés : $fichAR

remplacement $1  $mot $3
echo 
}

executionPourToutesLesLignes(){ # prend comme argument s: 
# $1 le fichier texte dans lequel on remplace des choses
# $2 le nom du fichier sur toutes le lignes duquel on exécute processusArepeter()
	while read mot # Le fichier contient un mot par ligne
	do
	processusArepeter $1 $mot $2 date
	done < "$2"		
	processusArepeter $1 $mot $2 date
}

########################
##  
##  PROGRAMME PRINCIPAL
##
########################

#####################################################################
## PARAMETRES

# texte dans lequel les modifs son faites
# On recopie d'abord l'original
cp original/texteARemplacer_Original.txt corpus/texteARemplacer.txt
txt=corpus/texteARemplacer.txt
echo txt=$txt

# liste des "mots" à modifier
# on remplacera par la liste de mots issue du travail de Sarah et validée par Françoise
lm=listeMots.csv
echo lm=$lm

# texte dans lequel on remplace
tx=corpus/texteARemplacer.txt
echo texte : $tx

# Log des mots modifiés par le programme
logmod=resultats/modifs.csv

# fin PARAMETRES
#####################################################################




#Ici on lance l'execution pour toutes les lignes du fichier mis en paramètre
executionPourToutesLesLignes $tx $lm

#comptage $tx "Zaama"


