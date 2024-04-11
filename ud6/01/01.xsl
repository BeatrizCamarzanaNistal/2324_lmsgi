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
    <!--<xsl:output method="html" indent="yes"/>-->
<xsl:output method="html"/>  
    
    <xsl:template match="/edificio">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT Beatriz Camarzana</title>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <main>
                <xsl:apply-templates select="vivienda"/>
                </main>
                <footer>
                    <p>Número de viviendas:<xsl:value-of select="count(//vivienda)"/></p>
                    <p>Número total de vecinos:<xsl:value-of select="count(//nombre"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="vivienda">
        <p>Piso:<xsl:value-of select="piso"/>   Puerta:<xsl:value-of select="puerta"/>   </p>
        <!--lista enumerada-->
        <ol>
            <xsl:apply-templates select="vecinos/nombre"/>
        </ol>
    </xsl:template>
    
    <xsl:template match="vecinos/nombre">
        <li><xsl:value-of select="text()"/></li>
    </xsl:template>
    
</xsl:stylesheet>