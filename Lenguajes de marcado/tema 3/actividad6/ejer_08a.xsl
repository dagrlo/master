<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Thu Nov 27 18:51:36 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<body>
		
		<xsl:apply-templates select="/horario/dia"/>
		</body>
	</html>
	</xsl:template>

	<xsl:template match="dia">
	      <xsl:variable name="numero" select="numdia"/>
	      <b> <xsl:value-of select="document('literales.xml')/literales/*[number($numero)]/text()"/></b> <br/><br/>
	      <ul><li>
          <b><xsl:value-of select="tarea/nombre"/>-</b>Prioridad: <xsl:value-of select="tarea/@prioridad"/><br/>
					   De <xsl:value-of select="tarea/hora-ini"/> a <xsl:value-of select="tarea/hora-fin"/><br/>
	      </li></ul>
	</xsl:template>



	<xsl:template match="nombre">
	    <xsl:value-of select="."/>
	</xsl:template>
  
</xsl:stylesheet>


