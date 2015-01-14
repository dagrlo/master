<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="//lenguaje"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="lenguaje">
    <xsl:value-of select="nombre"/><br/>
  </xsl:template>
</xsl:stylesheet>
