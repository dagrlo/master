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
       
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="modulos">
    <xsl:apply-templates select="modulo"/>
  </xsl:template>
  
  <xsl:template match="modulo">
    <li>
      Nombre:      <xsl:value-of select="nombre"/><br/>
      Ciclo:  <xsl:apply-templates select="ciclo"/>
    </li>
  </xsl:template>
  
  <xsl:template match="ciclo">
      <xsl:variable name="cId" select="."/>
      <xsl:value-of select="/ies/ciclos/ciclo[@id=$cId]/nombre"/>
  </xsl:template>
  

  
</xsl:stylesheet>