<?xml version="1.0" encoding="UTF-8"?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <xsl:template match="/">
        <xsl:element name="edificio">
            <xsl:apply-templates select="edificio/vivienda"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="edificio/vivienda">
        <!--
        <xsl:element name="vivienda">
            <xsl:attribute name="piso">
                <xsl:value-of select="piso"/>
            </xsl:attribute>
            <xsl:attribute name="puerta">
                <xsl:value-of select="puerta"/>
            </xsl:attribute>
        </xsl:element>
        -->    
        <!-- es copy-of porque quiero todos los nodos y todo lo que aoparece tal cual -->
        <vivienda vivienda="{piso}" puerta="{puerta}"/>
        <xsl:copy-of select="vecinos"/>
        
    </xsl:template>
</xsl:stylesheet>
