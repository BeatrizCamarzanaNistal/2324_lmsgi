<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pregunta1.xsl
    Created on : 6 de junio de 2024, 11:59
    Author     : Beatriz
    Description:
        exmwen 05
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../lib/plantillahtml.xsl"/>
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/datos">
        <xsl:call-template name="escribirDoctype"/>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                    <xsl:call-template name="escribirMeta"/>
                    <xsl:call-template name="escribirTitulo">
                        <xsl:with-param name="titulo" select="'05 Examen XSLT Beatriz Camarzana'"/>
                    </xsl:call-template>
                </head>
            <body>
                <div>
                    <nav>
                        <ol>
                            <li>
                                <xsl:apply-templates select="proveedores"/>
                            </li>
                            <li>
                                <xsl:apply-templates select="productos"/>
                            </li>
                            <li>
                                <xsl:apply-templates select="proyectos"/>
                            </li>
                            <li>
                                <xsl:apply-templates select="suministros"/>
                            </li>
                            <li>Estadisticas</li>
                        </ol>
                    </nav>
                    <article>
                        <header>
                            <h1 id="proveedores">Proveedores</h1>
                        </header>
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombre(Num Proveedor)</th>
                                    <th>Estado</th>
                                    <th>Ciudad</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <xsl:for-each select="proveedores/proveedor">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="nombreprov"/>(<xsl:value-of select="@numprov"/>)
                                            </td>
                                            <td>
                                                <xsl:value-of select="estado"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="ciudad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                            </tbody>
                        </table>
                    </article>
                    <!--articulo y tabla 2, productos-->
                    <article>
                        <header>
                            <h1 id="productos">Productos </h1>
                        </header>
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombre(Num Producto)</th>
                                    <th>Color</th>
                                    <th>Peso</th>
                                    <th>Ciudad</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <xsl:for-each select="productos/producto">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="nombreproducto"/>(<xsl:value-of select="@numproducto"/>)
                                            </td>
                                            <td>
                                                <xsl:value-of select="color"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="peso"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="ciudad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                            </tbody>
                        </table>
                    </article>
                    <!--articulo y tabla 3. proyectos-->
                    <article>
                        <header>
                            <h1 id="proyecto">Proyectos </h1>
                        </header>
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombre(Num Proyecto)</th>
                                    <th>Ciudad</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <xsl:for-each select="proyectos/proyecto">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="nombreproyecto"/>(<xsl:value-of select="@numproyecto"/>)
                                            </td>
                                            <td>
                                                <xsl:value-of select="ciudad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                            </tbody>
                        </table>
                    </article>
                    <!--ultimo articulo tabla proyectos-->
                    <article>
                        <header>
                            <h1 id="suministros">Suministra </h1>
                        </header>
                        <table>
                            <thead>
                                <tr>
                                    <th>Proveedor(Num Prov)</th>
                                    <th>Producto(Num Prod)</th>
                                    <th>Proyecto(Num Proy)</th>
                                    <th>Cantidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                   
                                       <xsl:for-each select="proveedores/proveedor">
                                           <td>
                                           <xsl:value-of select="nombreprov"/>(<xsl:value-of select="@numprov"/>)
                                           </td>
                                       </xsl:for-each>
                                    
                                    <xsl:apply-templates select="productos/producto"/>
                                    <xsl:apply-templates select="proyectos/proyecto"/>
                                </tr>
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </article>
                    <article>
                        <header>
                            <h1 id="">Numero de productos / vendedor </h1>
                        </header>
                        <p>
                            <xsl:value-of select="concat(suministros/suministra/numprov,':',count(suministros/suministra/numprov))"/>
                        </p>
                    </article>
                </div>
            </body>
        </html>
    </xsl:template>
    <!--NAV-->
    <xsl:template match="proveedores">
         <a href="#proveedores"><xsl:value-of select="name()"/></a>
    </xsl:template>
    <xsl:template match="productos">
        <a href="#productos"><xsl:value-of select="name()"/></a>
    </xsl:template>
    <xsl:template match="proyectos">
        <a href="#proyecto"><xsl:value-of select="name()"/></a>
    </xsl:template> 
    <xsl:template match="suministros">
        <a href="#suministros"><xsl:value-of select="name()"/></a>
    </xsl:template>
    <!-- ultima tabla -->
    <xsl:template match="proveedores/proveedor">
        <tr>
            <td>
                <xsl:value-of select="nombreprov"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="productos/producto">
        <tr>
            <td>
                <xsl:value-of select="nombreproducto"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="proyectos/proyecto">
        <tr>
            <td>
                <xsl:value-of select="nombreproyecto"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
