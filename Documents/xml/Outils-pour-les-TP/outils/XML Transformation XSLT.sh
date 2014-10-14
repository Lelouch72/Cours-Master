#!/bin/bash
# Script de transformation XSLT pour TextWrangler
# Jérôme Lehuen 16/09/2013

heure=$(date +%H:%M:%S)

echo "--- $heure --------------------------------------"
echo "Transformation XSLT du document $BB_DOC_NAME..."
echo

XSL=$(grep "xml-stylesheet" $BB_DOC_PATH | sed "s/^.*href=\"\(.*\)\".*$/\1/")
OUT=$(grep "output=" $BB_DOC_PATH | sed "s/^.*output=\"\(.*\)\"--.*$/\1/")
DTD=$(grep "DOCTYPE" $BB_DOC_PATH)
EXT=${BB_DOC_PATH##*.}

if [[ $EXT != 'xml' ]]
then
echo "ERREUR: Format du document source invalide : le document doit être au format xml et non $EXT"
exit
fi

if [[ $XSL = "" ]]
then
echo "ERREUR: Pas de déclaration <?xml-stylesheet> dans votre document source"
exit
fi

if [[ $OUT = "" ]]
then
echo 'ERREUR: Ajoutez un commentaire <!--output="..."--> dans votre document source'
exit
fi

# Validation du document source
xmllint --noout $BB_DOC_PATH
if [ $? -gt 0 ]
then
echo "ERREUR: Votre document source n'est pas valide"
exit
fi

INPUT=$BB_DOC_PATH
FOLDER=${BB_DOC_PATH%$BB_DOC_NAME}
STYLE=${BB_DOC_PATH/$BB_DOC_NAME/$XSL}
OUTPUT=${BB_DOC_PATH/$BB_DOC_NAME/$OUT}

echo "Document source = $INPUT"
echo "Transformation = $STYLE"
echo "Document cible = $OUTPUT"

# Transformation du document source
xsltproc -o $OUTPUT $STYLE $INPUT
if [ $? -eq 0 ]
then
# Ouverture du document cible
open -a /Applications/TextWrangler.app $OUTPUT
if [[ $OUTPUT =~ ^.*html$ ]]
then
# Visualisation du document cible si html
open -a /Applications/Safari.app $OUTPUT
fi
fi
