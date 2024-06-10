<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>  
    <xsl:template match="/">   <!--esto es el raiz, lo que tu pongas es de donde partes -->
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT Beatriz Camarzana</title>
               <!--link al css-->
            </head>
            <body>
                <header>
                    <h1>Información de viviendas</h1>
                </header>
                <main>
                    <xsl:for-each select="edificio/vivienda">
                        <!--xsl:sort SIEMPRE va debajo de template o debajo de for-each-->
                        <xsl:sort select="piso" data-type="number"/>
                        <xsl:sort select="puerta"/>
                        <p><xsl:value-of select="concat(' Piso: ',piso,' Puerta: ',puerta)"/></p>
                        <ol>
                            <xsl:for-each select="vecinos/nombre">
                                <li><xsl:value-of select="text()"/></li>
                            </xsl:for-each>
                        </ol>
                    </xsl:for-each>
                </main>
                <footer>
                    <p>Número de viviendas:<xsl:value-of select="count(edificio/vivienda)"/></p>
                    <p>Número total de vecinos:<xsl:value-of select="count(vecinos/nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>