# ScriptLecture

Le script scriptLecture.sh effectue des remplacements dans des TextGrids (traités comme des fichiers texte). Ces remplacements sont à faire dans le but de normaliser les transcriptions d'un corpus. Les normes de transcription du corpus MPF préconisent de marquer tous les mots du 'français non standard' en les duffixant d'un '@s'. Ainsi, tous les 'wesh' sont transcrits 'wesh@s'. Mais le nombre de transcripteurs a eu pour conséquence que certains mots sont parfois dotés d'un '@s', et parfois pas. Ainsi, il y a des 'merde@s' et des 'merde'. Nous avons élaboré une liste de mots "non-ambigus" (c'est-à-dire qui n'ont pas d'acception dans le 'français standard') pour lesquels peut être procédé à l'ajout éventuel de '@s' dans la transcription lorqu'ils ne figuraient pas.

Les remplacements sont effectués "brutalement", dans le contenu des fichiers ; on suppose que les "mots" (chaînes à remplacer) ne figurent que dans les textes transcrits, et pas dans les autres éléments des TextGrid.

Elémets à partir desquels le programme travaille :
  - Les fichiers .TextGrid dans lesquels les mots sont à remplacer (tous les fichiers du dossier corpus/)
  - Le fichier listeMots.csv, qui dresse la liste des mots à uniformément transcrire avec un '@s'

  
# Etat du projet
Pour l'instant (05/2019), dans le script sont écrites des fonctions qui permettent le remplacement l'adjonction éventuelle d'un '@s' dans un fichier texte donné en paramètre ($tx), pour les mots figurant dans le fichier $lm.
Je ne suis pas sûr que la variable $txt serve encore (c'est peut-être le vestige d'un état antérieur du programme)

# Extensions possibles
Le fichier NoteSurLes@s_SarahFlambard040718.doc liste quelques actions qui peuvent être automatisées, en plus des @s à généraliser. Par exemple, des espaces à supprimer.