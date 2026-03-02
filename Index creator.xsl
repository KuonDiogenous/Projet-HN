<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml"/>
    <xsl:output indent="yes"/>


    <!-- Création du fichier xml -->

    <xsl:template match="master">

        <xsl:result-document method="xml" href="Index.xml">
            <xsl:element name="TEI">

                <!-- header -->
                <xsl:element name="teiHeader">                                      <!-- Juste faire un header pour faire un header -->
                    <xsl:element name="fileDesc">
                        <xsl:element name="titleStmt">
                            <xsl:element name="title">
                                <xsl:text>Index</xsl:text>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="publicationStmt">
                        <xsl:element name="p">
                            <xsl:text>Publication Information</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="sourceDesc">
                        <xsl:element name="p">
                            <xsl:text>Information about the source</xsl:text>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="text">
                    <xsl:element name="body">

                        <xsl:call-template name="id"/>

                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
    <!--  
    <xsl:template match="/" name="truncate">
        <xsl:for-each-group select="//@corresp" group-by="//@corresp">
            <xsl:value-of select=""/>
            </xsl:for-each-group>
            
        
    </xsl:template>-->

    <!-- tokenization / group-by -->



    <xsl:template match="/" name="id">


            <xsl:variable name="correspid">                                         <!-- Variable -->
            <xsl:for-each select="//@corresp">                                      <!-- Selectionne tous les @corresp -->
                <xsl:choose>
                    <xsl:when test="starts-with(., '#')">                           <!-- Si le @corresp commence par #-->
                        <xsl:for-each select="tokenize(., ' ')">                    <!-- Alors tokenizer -->
                            <xsl:element name="item">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="."/>                      <!-- et le mettre dans un @xml:id d'un <item> -->
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>                                                     <!-- Pas d'autres <when> => si pas de # tu ne fais rien -->
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>


        <xsl:element name="list">


            <xsl:for-each-group select="$correspid" group-by="//@xml:id">           <!-- Pour toutes les variables, groupe les par leur @xml:id -->

                <xsl:element name="item">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="current-grouping-key()"/>             <!-- Met les dans un @xml:id d'un <item> d'un <list> -->
                    </xsl:attribute>
                </xsl:element>

            </xsl:for-each-group>


        </xsl:element>


    </xsl:template>




    <!--  
                        <xsl:element name="item">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="current-grouping-key()"/>                            </xsl:attribute>
                        </xsl:element>-->
    <!--
                <xsl:element name="item">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="current-grouping-key()"/>
                    </xsl:attribute>
                </xsl:element>  -->
    
    <!-- Variable ? -->
</xsl:stylesheet>
