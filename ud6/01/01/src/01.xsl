<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 09 de abril de 2024, 9:08
    Author     : beatruiz
    Description:
        Transformacion de 01.xml en un archivo con la lista de nombres y apellidos
		Usando una sola plantilla (xsl:template)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>  
    
    <xsl:template match="/edificio">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'01 XSLT Beatriz Camarzana Nistal'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <main>
                    <xsl:apply-templates select="vivienda"/>    <!--esto es relativo al contexto-->
                    <div>
                        <p>Número de viviendas:<xsl:value-of select="count(//vivienda)"/></p>
                        <p>Número total de vecinos:<xsl:value-of select="count(//nombre)"/></p>
                    </div>
                </main>
                <footer>
                    <p>&#169;Copyright Beatriz Camarzana Nistal</p>
                    <p>Página actualizada 03 de mayo de 2024</p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="vivienda">
        <p>Piso: <xsl:value-of select="piso"/>   Puerta: <xsl:value-of select="puerta"/>   </p>
        <!--lista enumerada-->
        <ul>
            <xsl:apply-templates select="vecinos/nombre">
                <xsl:sort/>
            </xsl:apply-templates>
        </ul>
    </xsl:template>
    
    <xsl:template match="vecinos/nombre">
        <li><xsl:value-of select="text()"/></li>
    </xsl:template>
    
</xsl:stylesheet>