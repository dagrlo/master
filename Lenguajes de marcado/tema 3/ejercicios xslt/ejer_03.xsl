<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Nov 20 19:09:04 CET 2014 -->

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
	
	<xsl:template match="
modulos">
			<xsl:apply-templates select="modulo[curso='1']"/>
	</xsl:template>
	
	<xsl:template match="modulo">
			<li>
				<xsl:value-of select="nombre"/>
			</li>
	</xsl:template>

</xsl:stylesheet>


