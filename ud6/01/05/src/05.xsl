<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 6 de mayo de 2024, 11:38
    Author     : beatriz
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/root">
        <root>
            <xsl:apply-templates select="row"/>
        </root>
    </xsl:template>
    
    <xsl:template match="row">
        <row>
            <xsl:apply-templates select="@*"/>
        </row>
    </xsl:template>

    <xsl:template match="@*">
        <xsl:element name="{name()}">
            <xsl:value-of  select="current()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>
