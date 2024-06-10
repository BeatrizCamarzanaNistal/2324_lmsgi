<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 9 de mayo de 2024, 11:32
    Author     : beatriz
    Description:
        transformar a .yaml
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="text" omit-xml-declaration="yes"/>
        <xsl:variable name="newline" select="'&#10;'"/>
        <xsl:variable name="tab" select="'   '"/>
    <xsl:template match="/network">
        <xsl:value-of select="concat(name(),':',$newline)"/>
        <xsl:apply-templates select="ethernets"/>
    </xsl:template>
    <xsl:template match="ethernets">
        <xsl:value-of select="concat($tab,name(),':',$newline)"/>
        <xsl:value-of select="concat($tab,$tab,name,':',$newline)"/>
        <xsl:apply-templates select="addresses"/>
        <xsl:if test="gateway4">
            <xsl:apply-templates select="gateway4"/>
        </xsl:if>
        <xsl:if test="nameservers">
            <xsl:apply-templates select="nameservers"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ethernets/addresses">
        <xsl:value-of select="concat($tab,$tab,$tab,name(),':',$newline)"/>
        <xsl:value-of select="concat($tab,$tab,$tab,$tab,text(),$newline)"/>
    </xsl:template>
    <xsl:template match="gateway4">
        <xsl:value-of select="concat($tab,$tab,$tab,'routes:',$newline)"/>
        <xsl:value-of select="concat($tab,$tab,$tab,$tab,'to: default',$newline)"/>
        <xsl:value-of select="concat($tab,$tab,$tab,$tab,'via: ',text(),$newline)"/>
    </xsl:template>
    <xsl:template match="nameservers">
        <xsl:value-of select="concat($tab,$tab,$tab,name(),':',$newline)"/>
        <xsl:value-of select="concat($tab,$tab,$tab,$tab,'addresses:',$newline)"/>
        <xsl:if test="addresses">
            <xsl:apply-templates select="addresses"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="addresses">
        <xsl:value-of select="concat($tab,$tab,$tab,$tab,$tab,text(),$newline)"/>
    </xsl:template>
</xsl:stylesheet>
