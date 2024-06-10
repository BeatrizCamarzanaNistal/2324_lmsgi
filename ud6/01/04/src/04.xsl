<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 1 de mayo de 2024, 10:50
    Author     : Beatriz
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>
    
    <xsl:template match="/factura">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'04 Factura F55 XSLT Beatriz Camarzana'"/>
                </xsl:call-template>
            </head>
            <body>
                <main>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3" style="color:blue">FACTURA NÚMERO <xsl:value-of select="@n_factura"/></th>
                                <xsl:apply-templates select="datos_emisor"/>
                                <xsl:apply-templates select="datos_receptor"/>
                                <xsl:apply-templates select="datos_factura"/>
                            </tr>
                        </thead>
                    </table>
                </main>
            </body>
        </html>
    </xsl:template>
<!--Escribimos la tabla del datos_emisor-->
    <xsl:template match="datos_emisor">
        <tr>
            <td colspan="3"  style="color:#AA1C47"><span class="negrita">DATOS EMISOR: </span></td>
        </tr>
        <tr>
            <td>
                <span class="negrita">RAZÓN SOCIAL: </span><xsl:value-of select="nombre"/>
            </td>
            <td colspan="2">
                <span class="negrita">CIF/NIF: </span>
                <xsl:value-of select="cif"/>
            </td>
        </tr>
        <tr>
            <td>
                <span class="negrita">DIRECCIÓN </span>
            </td>
            <td colspan="2">
                <xsl:value-of select="dir"/>
                <br/>
                <xsl:value-of select="poblacion/@cod_postal"/>
                <xsl:value-of select="poblacion"/>
                <br/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <span class="negrita">DATOS DE CONTACTO </span>
            </td>
        </tr>
        <tr>
            <td>
                <span class="negrita">TELÉFONO: <xsl:value-of select="telefono"/></span>
            </td>
            <td colspan="2">
                <span class="negrita">FAX: <xsl:value-of select="fax"/></span>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="datos_receptor">
        <tr>
            <td colspan="3"  style="color:#AA1C47"><span class="negrita">DATOS RECEPTOR </span></td>
        </tr>
        <tr>
            <td colspan="3"><span class="negrita">Num Cliente: <xsl:value-of select="@n_cli"/></span></td>
        </tr>
        <tr>
            <td>
                <span class="negrita">DIRECCIÓN </span>
            </td>
            <td colspan="2">
                <xsl:value-of select="dir_env"/>
                <br/>
                <xsl:value-of select="poblacion/@cod_postal"/>
                <xsl:value-of select="poblacion"/>
                <br/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="datos_factura">
        <tr>
            <td colspan="3"  style="color:#AA1C47"><span class="negrita">RESUMEN FACTURA </span></td>
        </tr>
        <tr>
            <td>
                <span class="negrita">Número pedido: </span>
                <xsl:value-of select="@n_ped"/>
            </td>
            <td>
                <span class="negrita">IVA: </span>
                <xsl:value-of select="@iva"/>
            </td>
            <td>
                <span class="negrita">Forma de Pago: </span>
                <xsl:value-of select="@f_pago"/>
            </td>
        </tr>
        <tr>
            <td>
                <span class="negrita">Moneda: </span>
                <xsl:value-of select="moneda"/>
            </td>
            <td colspan="2">
                <span class="negrita">Fecha: </span>
                <xsl:value-of select="fecha"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"  style="color:#AA1C47"><span class="negrita">DETALLE FACTURA </span>
                <table class="subtabla">
                    <tr>
                        <th>REF</th>
                        <th>Descripción</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Importe</th>
                    </tr>
                    <xsl:for-each select="linea">
                        <tr>
                          <td><xsl:value-of select="ref"/></td>
                          <td><xsl:value-of select="desc"/></td>
                          <td><xsl:value-of select="cant"/></td>
                          <td><xsl:value-of select="precio"/></td>
                          <td><xsl:value-of select="importe"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3"  style="color:#AA1C47"><span class="negrita">IMPORTE FACTURA </span></td>
        </tr>
        <tr class="tfooter">
        <td>
            <span class="negrita">Base: </span><xsl:value-of select="base"/>
        </td>
        <td>
            <span class="negrita">Cuota IVA: </span><xsl:value-of select="cuota_iva"/>
        </td>
        <td>
            <span class="negrita">Total Captura: </span><xsl:value-of select="total"/>
        </td>
    </tr>
    </xsl:template>
</xsl:stylesheet>

