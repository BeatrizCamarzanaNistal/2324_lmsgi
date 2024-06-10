<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 06.xsl
    Created on : 6 de mayo de 2024, 20:00
    Author     : Beatriz
    Description:
        Transfromar tres xml a html
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="corregido" select="'no'"/>
    <xsl:template match="/examen">
        <!--*__________PARA REFERERIRNOS A UN XML__________________*-->
        <!--<xsl:value-of select="document('modulosdaw1.xml')"/>
            <xsl:value-of select="document('meses.xml')"/>-->
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'06 XSLT-Beatriz Camarzana'"/>
                </xsl:call-template>
            </head>
            <body>
                <header>
                    <xsl:apply-templates select="datos"/>
                </header>
                <main>
                    <form action="examen.php" method="get">
                        <xsl:apply-templates select="preguntas/pregunta"/>
                    </form>
                </main>
                <footer>
                    <xsl:if test="$corregido='no'">
                        <fieldset class="botones">
                             <input type="button" value="Enviar formulario"/>
                             <input type="reset" value="Borrar formulario"/>
                        </fieldset>
                    </xsl:if>
                </footer>
            </body>
        </html>
    </xsl:template>
    <!--HEADER-->
    <xsl:template match="datos">
        <h1><xsl:value-of select="nombreCiclo"/></h1>
        <h2><xsl:value-of select="document('../data/modulosdaw1.xml')/modulos/modulo[@codM=current()/nombreModulo]"/></h2>
        <h3>Fecha: 
            <xsl:value-of select="concat(fecha/dia,' de ',document('../data/meses.xml')/meses/mes[5],' de ',fecha/anyo)"/>
        </h3>
    </xsl:template>
    <!--LAS PREGUNTAS Y RESPUESTAs-->
    <xsl:template match="preguntas/pregunta">
        <fieldset>
            <p><xsl:value-of select="concat(@id,'.-',enunciado)"/></p>
            <xsl:apply-templates select="respuestas/respuesta"/>
            
        </fieldset>
    </xsl:template>
    <!--RESPUESTAS-->
    <xsl:template match="respuestas/respuesta">
        <!--Vamos a utilizar esta exzpresion mas de una vez asi que la almacenamos en una variable-->
        <xsl:variable name="idPregunta" select="../../@id"/>
        <div>
            <label>
                <input type="radio" name="{concat('p',$idPregunta)}" value="{concat($idPregunta,position())}">
                    <xsl:if test="$corregido='si'">
                        <xsl:attribute name="disabled"/>
                        <xsl:if test="@correcta='correcta'">
                            <xsl:attribute name="checked"/>
                        </xsl:if>
                    </xsl:if>
                </input>
                <xsl:value-of select="current()"/>
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
