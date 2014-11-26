<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Tue Nov 25 18:33:36 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<body>
		
	<ol>
		
		<xsl:apply-templates select="ies/modulos"/>
		
	</ol>
			
		</body>
	</html>
	</xsl:template>
	
	<xsl:template match="modulos">
		<b><u>Nombre de modulos:</u></b>
		<xsl:apply-templates select="modulo"/>
	</xsl:template>
	
<xsl:template match="modulo">
	
	<li>-<xsl:value-of select="nombre"/></li>
	
</xsl:template>

</xsl:stylesheet>


