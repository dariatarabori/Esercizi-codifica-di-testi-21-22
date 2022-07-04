<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:tei="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head> 
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
                <!-- <link rel="stylesheet" href="style.css"> -->
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong"/>
                <style>
                    body{
                        font-family: "Trirong", serif;
                    }
                    h1{
                        color:blue;
                        margin: auto;
                        width: 50%;
                        border: 3px solid green;
                        padding: 10px;
                    }
                </style>
            </head>
            <body>
                <div class="titolo_pagina">
                    <h1>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                    <h5>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/>                         
                         
                    </h5>
                   <!--  <ul>
                        <xsl:apply-templates select="//tei:div[@type='lettera']" mode="index"/>
                    </ul> -->
                </div>
                <header>
                    <xsl:apply-templates select="//tei:dateline" mode="dateline"/>
                </header>
                <div id="corpo_lettera">
                    <xsl:apply-templates select="//tei:div" mode="corpo_lettera"/>
                </div>
            </body>
        </html>
    </xsl:template>

<!--     <xsl:template match="tei:div" mode="index">
        <ul>
            <xsl:for-each select=".">
                <li>
                    <xsl:value-of select="tei:head"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template> -->

<!--     <xsl:template match="tei:titleStmt/tei:title">
        <h2>
            <xsl:value-of select="." />
        </h2>
    </xsl:template> -->

    <xsl:template name="dateline" match="//tei:dateline" mode="dateline">
        <h3 id="data">
            <xsl:value-of select="tei:unclear"/><xsl:value-of select="tei:date"/>
        </h3>
        <h3 id="luogo">
            <xsl:value-of select="tei:name"/>
        </h3>
    </xsl:template> 

    <xsl:template name="corpo_lettera" match="//tei:div" mode="corpo_lettera">
        <p id="destinatario">
            <xsl:value-of select="tei:salute"/>  <!-- devi dirgli di cercare ricorsivamente fra i figli -->
        </p>
        <p id="testo_lettera">
            <xsl:value-of select="tei:p"/>
        </p>
    </xsl:template> 

   <!--  <xsl:template match="tei:teiHeader">
        <span>[identificativo del documento: <xsl:value-of select="@id"/>]</span>
    </xsl:template> -->


</xsl:stylesheet>

