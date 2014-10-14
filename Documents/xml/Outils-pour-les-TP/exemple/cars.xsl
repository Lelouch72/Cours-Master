<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:user="http://www.univ-lemans.fr/functions"
    extension-element-prefixes="user">

	<xsl:import href="user.xsl"/>
	
	<xsl:output
		method="html"
		encoding="utf-8"
		indent="yes"
		omit-xml-declaration="yes"/>
	
	<xsl:template match="/">
		<HTML>
			<HEAD>
				<META http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<LINK rel="StyleSheet" href="cars.css" type="text/css" media="screen"/>
			</HEAD>
			<BODY>
				<xsl:apply-templates select="cars/car">
					<xsl:sort select="price" data-type="number" order="ascending"/>
				</xsl:apply-templates>
			</BODY>
		</HTML>
	</xsl:template>
	
	<xsl:template match="car">
		<xsl:element name="DIV">
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="@make='BMW'">rouge</xsl:when>
					<xsl:when test="@make='Peugeot'">bleu</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="user:concat(@make, model)"/>
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>

