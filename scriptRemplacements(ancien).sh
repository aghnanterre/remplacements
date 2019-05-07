#!/bin/sh



ajouter() {
echo "$1">>$2
}



# initialiser le fichier textModifie.csv
#echo "mot;mot modifié">textModifie.csv

##la boucle ci-dessous lit le fichier texteEssai.csv, le transforme en ligne de tableau csv, et lfait un fichier csv (textModifie.csv) avec.
#while read line; 


 # " si il n'y a pas de cap, alors on ajoute un espace avant et un après"

# si il y a une cap dans $lline, alors on ajoute pas d'espace devant


##MARCHE
#echo "TcTcTc" | tr [:upper:] [:lower:]  # affiche tctctc


enMinuscules=`echo "TcTcTc" | tr [:upper:] [:lower:] ` # grâce aux quotes acent grave, met le résultat de l'execution dans la variable
echo "$enMinuscules"


# MARCHE
varBol=false
#the_world_is_flat=false
#
#if $varBol ; then
#  echo 'varBol est vraie'
#else
# echo 'varBol est false !'
#fi

##MARCHE
#a="toto"
#b="toto"
#if [ $a != $b ]
#then
#   echo "$a != $b : a is not equal to b"
#else
#   echo "$a != $b: a is equal to b"
#fi


 
 