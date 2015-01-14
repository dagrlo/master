<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <h1>modulos de primero</h1><br/>
        <ol>
          <xsl:apply-templates select="ies/modulos"/>
        </ol>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="modulos">
    
    <xsl:apply-templates select="modulo"/>
  </xsl:template>
  
  <xsl:template match="modulo">
    <xsl:choose>
      <xsl:when test="curso=1">
        <li><xsl:value-of select="nombre"/></li>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
