#!/bin/bash
# Script de vérification Xpath pour TextWrangler
# Jérôme Lehuen 16/09/2013

heure=$(date +%H:%M:%S)

cd
cd Library/Application\ Support/TextWrangler

XPATH=$(grep "xpath=" $BB_DOC_PATH | sed "s/^.*xpath=\(.*\)--.*$/\1/")

if [[ $XPATH = "" ]]
then
echo 'ERREUR: Ajoutez un commentaire <!--xpath="..."--> dans votre document XML'
exit
fi

echo "--- $heure --------------------------------------"
echo "Test de l'expression Xpath $XPATH sur le document $BB_DOC_NAME..."

# Validation du document source
xmllint --noout $BB_DOC_PATH
if [ $? -gt 0 ]
then
echo "ERREUR: Votre document n'est pas valide"
exit
fi

# Insertion de l'expression Xpath dans la transformation XSLT
sed "s,xxx,<xsl:apply-templates select=$XPATH/>," xpathtester.xsl > tmp.xsl

# Application de la transformation xpathtester.xsl modifiée
xsltproc tmp.xsl $BB_DOC_PATH
rm tmp.xsl
