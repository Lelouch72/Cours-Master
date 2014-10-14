<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:user="http://www.univ-lemans.fr/functions"
	xmlns:exsl="http://exslt.org/functions"
	extension-element-prefixes="exsl">
	
	<exsl:function name="user:concat">
		<xsl:param name="string1" select="''"/>
		<xsl:param name="string2" select="''"/>
		<exsl:result>
			<xsl:value-of select="concat('Une magnifique ', $string1,' ',$string2)"/>
		</exsl:result>
	</exsl:function>
	
</xsl:stylesheet>
