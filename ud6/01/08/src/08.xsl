<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 08.xsl
    Created on : 3 de junio de 2024, 11:31
    Author     : beatriz
    Description:
        repaso xsl
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>

    <xsl:template match="/prediccion">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'08 Prediccion XSLT Beatriz Camarzana'"/>
                </xsl:call-template>
            </head>
            <body>
                <header>
                    <h1>Predicción por municipios</h1>
                </header>
                <main>
                    <h2>el tiempo. <xsl:value-of select="concat(municipio/nombre,' (',municipio/provincia,')')"/></h2>
                    <table>
                            <thead>
                                <tr>
                                    <th>Día</th>
                                    <th>Prob. precip.</th>
                                    <th>Estado del cielo</th>
                                    <th>Temperatura (ºC)</th>
                                    <th>Viento (km/h)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <xsl:for-each select="dia">
                                        <xsl:variable name="clima" select="estado_cielo"/>
                                        <xsl:variable name="direccion" select="viento/direccion"/>
                                        <tr>
                                            <td>
                                                <xsl:value-of select="substring(@fecha,9,2)"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="concat(prob_precipitacion,'%')"/>
                                            </td>
                                            <td><img src="images/{$clima}.gif"/></td>
                                            <td>
                                                <span class="minimo">
                                                    <xsl:value-of select="temperatura/minima"/>
                                                </span>
                                                /
                                                <span class="maximo">
                                                    <xsl:value-of select="temperatura/maxima"/>
                                                </span>
                                            </td>
                                            <td>
                                                <img src="images/{$direccion}.gif" title="{estado_cielo/@descripcion}"/>
                                                <xsl:value-of select="viento/velocidad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                    
                                </tr>
                            </tbody>
                    </table>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
