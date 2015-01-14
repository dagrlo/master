<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <body>
        <xsl:apply-templates select="ies/ciclos"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="ciclos">
    <h1><u>Informacion de los ciclos</u></h1><br/>
    <xsl:apply-templates select="ciclo"/>
  </xsl:template>
  
  <xsl:template match="ciclo">
    <b>Nombre:</b> <xsl:value-of select="nombre"/><br/>
    <b>Grado: </b> <xsl:value-of select="grado"/><br/>
    <b>Año: </b> <xsl:value-of select="decretoTitulo/@año"/><br/><hr/><br/>
  </xsl:template>
</xsl:stylesheet>
