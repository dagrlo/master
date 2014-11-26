<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Nov 20 18:33:10 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<body>
	
			<xsl:apply-templates select="ies/ciclos"/>
		</body>
	</html>
	</xsl:template>
	
	
	<xsl:template match="ciclos">
		<h1><u>Estos son los ciclos que hay:</u></h1>
		<br/>
		<br/>		
		<xsl:apply-templates select="ciclo"/>			
	</xsl:template>
	
	<xsl:template match="ciclo">
		* <xsl:value-of select="nombre"/>
		<br/>
	</xsl:template>

</xsl:stylesheet>


