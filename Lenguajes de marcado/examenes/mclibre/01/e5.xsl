<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <ul>
          <xsl:apply-templates select="diccionarios/diccionario"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="diccionario">
    <xsl:apply-templates select="nombre"/>
  </xsl:template>
  
  <xsl:template match="nombre">
    <li><xsl:value-of select="../siglas"/> - <xsl:value-of select="."/></li>
  </xsl:template>
</xsl:stylesheet>
