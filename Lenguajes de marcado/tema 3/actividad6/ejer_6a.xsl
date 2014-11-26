<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Nov 20 19:24:16 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<body>
		
   			<xsl:apply-templates select="ies/modulos"/>
		</body>
	</html>
	</xsl:template>
	
	
<xsl:template match="modulos">
	
		<h1><u>Informacion de los modulos:	</u></h1>
	
		<br/>
	
		<xsl:apply-templates select="modulo">
			<xsl:sort select="nombre" order="ascending"/>
		</xsl:apply-templates>
	
</xsl:template>
	

<xsl:template match="modulo">
	
		
		<u><b>Nombre: </b><xsl:value-of select="nombre"/></u><br/>
			<b>Curso: </b><xsl:value-of select="curso"/><br/>
			<b>Horas: </b><xsl:value-of select="horasSemanales"/><br/>
			<xsl:apply-templates select="ciclo"/>
			<br/>
	
</xsl:template>

<xsl:template match="ciclo">
   <xsl:variable name="id_ciclo" select="."/>
  
   <b>Ciclo: </b><xsl:value-of select="/ies/ciclos/ciclo[@id=$id_ciclo]/nombre"/><br/>
</xsl:template>

</xsl:stylesheet>


