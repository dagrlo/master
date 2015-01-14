<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="ies/modulos">
          <xsl:sort select="nombre" order="ascending"/>
        </xsl:apply-templates>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="modulos">
    <xsl:apply-templates select="modulo"/>
  </xsl:template>
  
  <xsl:template match="modulo">
    * <xsl:value-of select="nombre"/><br/>
  </xsl:template>
</xsl:stylesheet>
