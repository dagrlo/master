<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>  
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="//asignaturas/asignatura"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="//asignaturas/asignatura">
    <xsl:value-of select="nombre"/><br/>
    <xsl:variable name="cAsign" select="@id"/>
    <xsl:apply-templates select="//alumnos/alumno/estudios/asignaturas/asignatura[@codigo=""a01""]../../../nombre"/>
    
  </xsl:template>

  <xsl:template match="nombre">
    <xsl:value-of select="."/><br/>
  </xsl:template>
</xsl:stylesheet>
