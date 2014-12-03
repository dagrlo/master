<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Tue Nov 25 19:10:19 CET 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>
	
	
	
<xsl:template match="/">
		
		<xsl:apply-templates/>
</xsl:template>
	
<xsl:template match="ciclo">
	  <xsl:variable name="ID" select="@id"/>
    <xsl:element name="{$ID}">
	     <nombre><xsl:value-of select="nombre"/></nombre>
	     <grado><xsl:value-of select="grado"/></grado>
  	     <xsl:element name="decretoTitulo">
	      	<xsl:attribute name="año">
	     		<xsl:value-of select="decretoTitulo/@año"/>
	     	</xsl:attribute>
	     </xsl:element>
	     <xsl:element name="impartido">	    
	       <xsl:apply-templates select="/ies/modulos/modulo[@id=$ID]"/>
	    	 <xsl:attribute name="num">
	    	  <xsl:variable name="total" select="count(/ies/modulos/modulo[ciclo=$ID])"/>
	    	  <xsl:value-of select="$total"/>
	    	 </xsl:attribute>
			  <xsl:for-each select="/ies/modulos/modulo[ciclo=$ID]">
			   	<xsl:element name="cod">
            <xsl:value-of select="@id"/>
			    </xsl:element>
			  </xsl:for-each>
	     </xsl:element>	    
	   </xsl:element>
	   
	    
</xsl:template>
	<xsl:template match="/ies/nombre">
	     <nombre>
	     <xsl:value-of select="."/>
	     </nombre>
	</xsl:template>
	
	<xsl:template match="/ies/web">
	      <web>
	        <xsl:value-of select="."/>
	      </web>
	</xsl:template>
	
				
<xsl:template match="/ies">
	 <ies>
	   <xsl:apply-templates/>
	 </ies>		
</xsl:template>
	
<xsl:template match="/ies/modulos">
	<modulos>
  	<xsl:apply-templates select="/ies/modulos/modulo"/>
	</modulos>
</xsl:template>
	
<xsl:template match="/ies/modulos/modulo">
		<xsl:element name="modulo">
		  <xsl:attribute name="id">
		      <xsl:value-of select="@id"/>
		  </xsl:attribute>
		  <nombre><xsl:value-of select="nombre"/>  </nombre>
		  <curso><xsl:value-of select="curso"/> </curso>
		  <horasSemanales><xsl:value-of select="horasSemanales"/>  </horasSemanales>
		</xsl:element>	    
	</xsl:template>
</xsl:stylesheet>


