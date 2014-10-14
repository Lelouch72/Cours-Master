#!/bin/bash
# Installation des scripts XML pour TextWrangler
# Jérôme Lehuen 16/09/2013

cd "`dirname "$0"`"
CURRENT_DIR=$(pwd)
DEST="Library/Application Support/TextWrangler"
cd
cd "$DEST"
cp "$CURRENT_DIR/xpathtester.xsl" .
cp "$CURRENT_DIR/XML Reformater.sh" ./Text\ Filters
cp "$CURRENT_DIR/XML Validation DTD-XSD.sh" ./Scripts
cp "$CURRENT_DIR/XML Transformation XSLT.sh" ./Scripts
cp "$CURRENT_DIR/XML Verification Xpath.sh" ./Scripts
