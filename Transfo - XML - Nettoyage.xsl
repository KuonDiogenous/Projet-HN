<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" exclude-result-prefixes="xs" version="3.0">

    <xsl:output method="html"/>

    

    <xsl:template match="master" name="liste_acteurs">

        <xsl:element name="html">
            <xsl:element name="head">

                  <xsl:element name="meta">

                    <xsl:attribute name="charset"><xsl:text>UTF-8</xsl:text></xsl:attribute>

                    <!--<xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet
                            </xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css
                            </xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>///
                            </xsl:text>
                        </xsl:attribute>
                    </xsl:element>-->

                </xsl:element>

            </xsl:element>
            
            
             
            
            <xsl:element name="body">
                
                <xsl:element name="h1">
                    <xsl:text>Liste pour nettoyage</xsl:text>
                </xsl:element>
                
                <!-- group-by affaires -->
                <xsl:for-each-group select=".//tei:TEI" group-by="@xml:id">
                    
                    
                    
                    
                    
                    <!-- Afficher le xml:id  -->
                    
                    <xsl:element name="h2">
                        <xsl:choose>
                            <xsl:when test="contains(current-grouping-key(), 'Jeanne')">
                                <xsl:text>L'affaire Jeanne traitée par </xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Menaces')">
                                <xsl:text>Sur les menaces contre les juges traitées par </xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Ali')">
                                <xsl:text>L'affaire Ibrahim Ali traitée par </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="contains(current-grouping-key(), 'Libé')">
                                <xsl:text>Libération</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Figaro')">
                                <xsl:text>le Figaro</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Monde')">
                                <xsl:text>le Monde</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:text> en </xsl:text>
                        <xsl:value-of
                            select="tokenize(current-grouping-key(), '_')[last()]"/>
                        
                    </xsl:element>
                    <!-- Fin h1 -->
                    
                    
                    
                    <!-- var de l'index modifiée : besoin d'un stockage temporaire ? Ne pas oublier que l'on est déjà dans un group-by affaire, current-grouping-key utilisable -->
                    <xsl:variable name="CorrespName">
                        
                        
                        
                        <!-- A l'intérieur de chaque aricle, pour chaque @corresp de persName, de roleName ET de addName -->
                        <xsl:for-each
                            select="current-group()//*[@corresp]">
                            
                            
                            <!-- tokenize permettant de s'occuper des @corresp à multiples valeurs -->
                            <xsl:for-each select="tokenize(@corresp, '\s+')">
                                
                                
                                
                                <!-- transfo selon les #, storage dans un <item xml:id=""> -->
                                <xsl:choose>
                                    <xsl:when test="starts-with(., '#')">
                                        <xsl:element name="item">
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of select="substring-after(., '#')"/>
                                            </xsl:attribute>
                                        </xsl:element>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:element name="item">
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </xsl:element>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                                
                                
                            </xsl:for-each>
                            <!-- sortie du tokenize corresp -->
                            
                        </xsl:for-each>
                        <!-- sortie du pour chaque Name -->
                        
                        
                    </xsl:variable>
                    
                    
                    <!-- Application de la variable, affichage de sortie -->
                    <xsl:element name="ul">
                        
                        <!-- enlève doublon via group-by="@xml:id" -->
                        <xsl:for-each-group select="$CorrespName/item" group-by="@xml:id">
                            
                            <xsl:sort select="@xml:id"/>
                            
                            <!-- Permet d'imposer un seuil de récurrence, modifier le nombre pour dire : > x -->
                            <xsl:if test="current-group()">
                                
                                <xsl:element name="li">
                                    <xsl:value-of select="current-grouping-key()"/>
                                </xsl:element>
                                
                            </xsl:if>
                            
                        </xsl:for-each-group>
                        
                    </xsl:element>
                    
                    
                    
                </xsl:for-each-group>
                
                
                <!-- LISTE DES CORRESP -->
                <xsl:element name="h2">
                    <xsl:text>Liste complète des corresp</xsl:text>
                </xsl:element>
                
                <xsl:element name="ul">
                    
                    <xsl:for-each-group 
                        select=".//*[@corresp]"
                        group-by="tokenize(@corresp, '\s+')">
                        <xsl:sort select="current-grouping-key()"/>
                        <xsl:for-each select="current-grouping-key()">
                            
                            <xsl:choose>
                                <xsl:when test="starts-with(., '#')">
                                    <xsl:element name="li">
                                        <xsl:value-of select="substring-after(., '#')"/>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="li">
                                        <xsl:value-of select="."/>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                        </xsl:for-each>
                        
                    </xsl:for-each-group>
                    
                </xsl:element>
                
                
                <!-- LISTE DES FN/RN -->
                <xsl:element name="h1">
                    <xsl:text>Liste complète des FN/RN</xsl:text>
                </xsl:element>
                
                <xsl:for-each-group select=".//tei:TEI" group-by="@xml:id">
                    
                    
                    
                    
                    
                    <!-- Afficher le xml:id  -->
                    
                    <xsl:element name="h2">
                        <xsl:choose>
                            <xsl:when test="contains(current-grouping-key(), 'Jeanne')">
                                <xsl:text>L'affaire Jeanne traitée par </xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Menaces')">
                                <xsl:text>Sur les menaces contre les juges traitées par </xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Ali')">
                                <xsl:text>L'affaire Ibrahim Ali traitée par </xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="contains(current-grouping-key(), 'Libé')">
                                <xsl:text>Libération</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Figaro')">
                                <xsl:text>le Figaro</xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(current-grouping-key(), 'Monde')">
                                <xsl:text>le Monde</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:text> en </xsl:text>
                        <xsl:value-of
                            select="tokenize(current-grouping-key(), '_')[last()]"/>
                        
                    </xsl:element>
                    <!-- Fin h1 -->
                    
                    
                    <xsl:element name="ul">
                        <xsl:choose>
                            <xsl:when test=".//tei:*[@*='FN']">
                                <xsl:element name="li"><xsl:text>Contient un attribut avec comme valeur FN</xsl:text></xsl:element>
                            </xsl:when>
                            <xsl:when test=".//tei:*[@*='RN']">
                                <xsl:element name="li"><xsl:text>Contient un attribut avec comme valeur RN</xsl:text></xsl:element>
                            </xsl:when>
                            
                        </xsl:choose>
                    </xsl:element>
                    
                </xsl:for-each-group>
                
                
                
                
                
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="class">
                        <xsl:text>top</xsl:text>
                    </xsl:attribute>
                    <xsl:text>Retour en haut &#8593;</xsl:text>
                </xsl:element>
            </xsl:element>

        </xsl:element>

    </xsl:template>

    



    


</xsl:stylesheet>
