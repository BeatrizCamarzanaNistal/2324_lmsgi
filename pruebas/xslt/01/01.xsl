<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 14 de abril de 2020, 9:08
    Author     : amor
    Description:
        Transformacion de 01.xml en un archivo con la lista de nombres y apellidos
		Usando una sola plantilla (xsl:template)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
<xsl:output method="html"/>  
    
    <!-- copio del 02.xsl -->
    <xsl:template match="/alumnos">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01-2 XSLT - Informacion de alumnos </title>
            </head>
            <body>
                <xsl:apply-templates select="alumno"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="alumno">
      <p> <xsl:value-of select="concat(nombre,' ', apellido)"/></p>
    </xsl:template>

</xsl:stylesheet>