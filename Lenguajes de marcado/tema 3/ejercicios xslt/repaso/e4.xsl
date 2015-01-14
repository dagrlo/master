<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <h1>Modulos</h1>

        <ol>
          <xsl:apply-templates select="ies/modulos"/>
        </ol>
        <h1>Ciclos</h1>
        <ol>
          <xsl:apply-templates select="ies/ciclos"/>
        </ol>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="modulos">
    <xsl:apply-templates select="modulo"/>
  </xsl:template>
  
  <xsl:template match="modulo">
    <li><xsl:value-of select="nombre"/></li>
  </xsl:template>
  
   <xsl:template match="ciclos">
    <xsl:apply-templates select="ciclo"/>
  </xsl:template>
  
  <xsl:template match="ciclo">
    <li><xsl:value-of select="nombre"/></li>
  </xsl:template>
</xsl:stylesheet>
