<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
         <xsl:apply-templates select="//alumnos/alumno"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="alumno">
    <b>Sexo: </b><xsl:value-of select="sexo"/>
    <xsl:apply-templates select="estudios/carrera"/>
  </xsl:template>
  
  <xsl:template match="estudios/carrera">
    __<b>Carrera:</b> <xsl:value-of select="@codigo"/><br/>
  </xsl:template>
</xsl:stylesheet>
