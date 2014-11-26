<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Tue Nov 25 19:10:19 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>
	
<xsl:template match="/">
		
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="ciclo">
	   <xsl:element name="{@id}">
	     <nombre><xsl:value-of select="nombre"/></nombre>
	     <grado><xsl:value-of select="grado"/></grado>
	     <xsl:element name="decretoTitulo">
	     	<xsl:attribute name="año">
	     		<xsl:value-of select="decretoTitulo/@año"/>
	     	</xsl:attribute>
	     </xsl:element>
	    <xsl:element name="impartido">
	    	<xsl:attribute name="num">
	    	           <xsl:variable name="total" select="count(ies/modulos/modulo[ciclo='ASIR'])"/>
	    	          <xsl:value-of select="$total"/>
	    		
	    	</xsl:attribute>
	     </xsl:element>
	     <impartido num="kk"/>
	   </xsl:element>
	   
	    
	</xsl:template>
	

</xsl:stylesheet>


