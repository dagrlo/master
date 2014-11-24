<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Nov 20 18:33:10 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="estilo.css"/>
		</head>
		<body>
	
		<h1><u>Estos son los ciclos que hay:</u></h1>
		<br/>
		<br/>		
		
			<span class="lista">
			<xsl:apply-templates select="ies/ciclos"/>
			</span>
		
		</body>
	</html>
	</xsl:template>
	
	
	<xsl:template match="ciclos">
		
		
		
		<xsl:apply-templates select="ciclo"/>			
		
	</xsl:template>
	
	<xsl:template match="ciclo">
		<xsl:value-of select="nombre"/>
		
	</xsl:template>

</xsl:stylesheet>


