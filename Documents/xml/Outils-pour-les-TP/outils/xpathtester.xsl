<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">xxx</xsl:template>

<xsl:template match="*">
<xsl:text>&#10;Element: </xsl:text>
<xsl:copy-of select="."/>
<xsl:text></xsl:text>
</xsl:template>

<xsl:template match="@*">
<xsl:text>&#10;Attribut: </xsl:text>
<xsl:value-of select="local-name()"/>
<xsl:text>="</xsl:text>
<xsl:value-of select="."/>
<xsl:text>"</xsl:text>
</xsl:template>

<xsl:template match="text()">
<xsl:text>&#10;Text: "</xsl:text>
<xsl:value-of select="."/>
<xsl:text>"</xsl:text>
</xsl:template>

</xsl:stylesheet>
