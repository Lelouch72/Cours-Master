#!/bin/bash
# Script de validation XML pour TextWrangler
# Jérôme Lehuen 16/09/2013

heure=$(date +%H:%M:%S)

DTD=$(grep "DOCTYPE" $BB_DOC_PATH | sed "s/^.*\"\(.*\)\".*$/\1/")
XSD=$(grep "SchemaLocation" $BB_DOC_PATH | sed "s/^.*SchemaLocation=\"\(.*\)\".*$/\1/")

if [[ $XSD != "" ]]
then
echo "--- $heure --------------------------------------"
echo "Validation du document $BB_DOC_NAME par $XSD..."
echo
# Validation du document XML avec XSD
SCHEMA=${BB_DOC_PATH/$BB_DOC_NAME/$XSD}
xmllint --noout --schema $SCHEMA $BB_DOC_PATH
if [ $? -gt 0 ]
then
echo "ERREUR: Votre document source n'est pas valide"
exit
else
echo "Votre document est bien formé et valide selon $XSD"
exit
fi
fi

if [[ $DTD != "" ]]
then
echo "--- $heure --------------------------------------"
echo "Validation du document $BB_DOC_NAME par $DTD..."
echo
xmllint --noout --valid $BB_DOC_PATH
if [ $? -gt 0 ]
then
echo "ERREUR: Votre document source n'est pas valide"
exit
else
echo "Votre document est bien formé et valide selon $DTD"
exit
fi
fi

echo "--- $heure --------------------------------------"
echo "Validation du document $BB_DOC_NAME..."
echo
xmllint --noout $BB_DOC_PATH
if [ $? -gt 0 ]
then
echo "ERREUR: Votre document source n'est pas bien formé"
exit
else
echo "Votre document est bien formé"
exit
fi
