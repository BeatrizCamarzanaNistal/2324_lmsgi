<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 15 de abril de 2024, 17:51
    Author     : Beatriz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/listatickets">
        <xsl:call-template name="escribirDoctype"/>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                    <xsl:call-template name="escribirMeta"/>
                    <xsl:call-template name="escribirTitulo">
                        <xsl:with-param name="titulo" select="'02 XSLT Beatriz Camarzana'"/>
                    </xsl:call-template>
                </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                </header>
                <main>
                    <h2>Listado de tickets</h2>
                    <xsl:apply-templates select="ticket">
                        <xsl:sort select="numero" data-type="number"/>
                    </xsl:apply-templates>
                </main>
                <footer>
                    <p>NUMERO DE TICKETS: <xsl:value-of select="count(ticket)"/> </p>
                    <p>TOTAL DE TICKETS: <xsl:value-of select="sum(ticket/total)"/> </p>
                </footer>
            </body>
        </html>
    </xsl:template>
        <!--es un bucle, va recorriendo uno a uno el puntero, para los comentarios-->
        <xsl:template match="comment()">
            <xsl:comment>
                <xsl:value-of select="current()"/>
            </xsl:comment>
        </xsl:template>
        <!--mostrar informacion de cada ticket-->
        <xsl:template match="ticket">
            <article>
                <h3>Tickets: <xsl:value-of select="numero"/></h3>
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Producto</th>
                            <th></th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="producto"/>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th>Total</th>
                            <th></th>
                            <th>
                                <xsl:value-of select="total"/>
                            </th>
                            
                        </tr>
                    </tfoot>
                    <caption>
                        <xsl:value-of select="concat('Fecha del ticket: ',fecha)"/>
                    </caption>
                </table>
            </article> 
        </xsl:template>
            <xsl:template match="producto">
                <tr>
                    <td>
                        <xsl:value-of select="nombre/text()"/>
                    </td>
                    <td></td>
                    <td>
                        <xsl:value-of select="precio/text()"/>
                    </td>
                    <td></td>
                </tr>
            </xsl:template> 
    
</xsl:stylesheet>
