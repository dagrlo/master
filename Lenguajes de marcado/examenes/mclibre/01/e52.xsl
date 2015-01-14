<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <h1>PAlabras</h1>
        <xsl:apply-templates select="diccionarios/diccionario"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="diccionario">
    <xsl:value-of select="nombre"/>
    <table border="1">
      <xsl:apply-templates select="definicion"/>
    </table>
  </xsl:template>
  
  <xsl:template match="definicion">
    <tr>
      <td><xsl:value-of select="palabra"/></td>
      <xsl:apply-templates select="def"/>
    </tr>
  </xsl:template>
  
  <xsl:template match="def">
    <td><xsl:value-of select="."/></td>
  </xsl:template>
</xsl:stylesheet>
