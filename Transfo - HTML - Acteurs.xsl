<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" exclude-result-prefixes="xs" version="3.0">

    <xsl:output method="html"/>

    <!-- Acteurs L’idée serait de faire une page qui recense les acteurs les plus mentionnés par affaire et à travers les articles. 
        
        Sur cette page html on pourra trouver : une photo des acteurs, des textes en durs pour les trouver + les surnoms qu’ils ont des les articles, 
        où les citations dans lesquelles ils sont mentionnés. Avant ça il faut donc récupérer les données dans les fichiers XML, en créant un document 
        html de base à travers le langage XSLT. Transfos seraient donc les suivantes Récupérer les acteurs mentionnés + de 10x par affaire 
        Appeler tous les articles (TEI :tei avec xml :id) Group by : XML :ID avec Jeanne, XML :ID avec Menaces, XML :iD avec Ali 
        Dans chaque chercher les Corresp + # mentionnés plus de 10x Appeler les qualifications/citations 
        Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut 
        Appeler les citations ayant un corresp correspondant aux personnes récupérées + haut 1 pages HTML composées de plusieurs pages html 
        
        1ère pages html : Group-by affaire afficher dans chaque affaire la liste les acteurs (corresp) les plus récurrents 10 me parait peu mais on peut baisser le seuil. 
        Faire une page pour chacun des corresp (voir lettres jérômes Pour chaque page créée : image, nom, listes des citations, listes des appelations (enlever doublon, voir index) 
        Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut 
        Appeler les citations ayant un corresp correspondant aux personnes récupérées + haut => 2 template 1 pour faire la page principale, une autre pour créer toutes les pages -->

    <xsl:template match="master" name="liste_acteurs">

        <xsl:element name="html">
            <xsl:element name="head">

                  <xsl:element name="meta">

                    <xsl:attribute name="charset">

                        <xsl:text>
                            UTF-8
                        </xsl:text>

                    </xsl:attribute>

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
            
            
            <!--          <xsl:for-each-group select=".//*[@corresp]" group-by="@corresp">
                            
                            
                            <xsl:choose>
                               
                                <xsl:when test="starts-with(current-grouping-key(), '#')">
                                    
                                    
                                    <xsl:choose>
                                        <xsl:when test="contains(current-grouping-key(), ' #')">
                                            <xsl:for-each
                                                select="tokenize(current-grouping-key(), ' ')">
                                                <xsl:element name="li">
                                                    <xsl:value-of
                                                        select="substring(current-grouping-key(), 2)"/>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:element name="li">
                                                <xsl:value-of
                                                    select="substring(current-grouping-key(), 2)"/>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    
                                </xsl:when>
                                
                                
                                
                                <xsl:otherwise>
                                    <xsl:element name="li"><xsl:value-of select="current-grouping-key()"/></xsl:element>
                                </xsl:otherwise>
                                
                                
                            </xsl:choose>
                        </xsl:for-each-group>
                        -->
            
            
            <!--    <xsl:for-each-group select=".//*[@corresp]" group-by="@corresp">
                            <xsl:element name="li">
                                <xsl:value-of select="@corresp"/>
                            </xsl:element>
                        </xsl:for-each-group>-->  
            
            
            <!--      <xsl:for-each-group select=".//*[@corresp]" group-by="@corresp">                   
                            !          <xsl:element name="li">
                                                <xsl:value-of select="current-grouping-key()"/>                      
                                        </xsl:element>
                        </xsl:for-each-group>-->   
            
            <!--            <xsl:variable name="correspid">                                         
                      <xsl:for-each select="//@corresp">                                      
                                <xsl:choose>
                                    <xsl:when test="starts-with(., '#')">                           
                                        <xsl:for-each select="tokenize(., ' ')">                    
                                            <xsl:element name="item">
                                                <xsl:attribute name="xml:id">
                                                    <xsl:value-of select="."/>                      
                                                </xsl:attribute>
                                            </xsl:element>
                                        </xsl:for-e          </xsl:when>                                                     
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:variable>
                        
                        
                        <xsl:element name="list">
                            
                            
                            <xsl:for-each-group select="$correspid" group-by="//@xml:id">           
                                
                                <xsl:element name="item">
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="current-grouping-key()"/>             
                                    </xsl:attribute>
                                </xsl:element>
                                
                            </xsl:for-each-group>
                            
                            
                        </xsl:element>--> 
            
            
            
            <!-- Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut -->
            
            <!-- Trouver le moyen d'unifier ça ?
                        
                        <xsl:for-each-group select=".//tei:roleName" group-by="@corresp">
                        
                            <xsl:if test="count(current-grouping-key()) &gt; 1">
                            <xsl:element name="li">
                                <xsl:choose>
                                    <xsl:when test="starts-with(., '#')">                                     
                                        <xsl:value-of select="substring-after(current-grouping-key(), '#')"/>                      
                                    </xsl:when>                                                     
                                    <xsl:otherwise>
                                        <xsl:value-of select="current-grouping-key()"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                        </xsl:if>
                        </xsl:for-each-group>
                        
                        <xsl:for-each-group select=".//tei:addName" group-by="@corresp">
                            
                            <xsl:if test="count(current-grouping-key()) &gt; 1">
                                <xsl:element name="li">
                                    <xsl:choose>
                                        <xsl:when test="starts-with(., '#')">                                   
                                            <xsl:value-of select="substring-after(current-grouping-key(), '#')"/>                      
                                        </xsl:when>                                                     
                                        <xsl:otherwise>
                                            <xsl:value-of select="current-grouping-key()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:if>
                        </xsl:for-each-group>
                        
                        <xsl:for-each-group select=".//tei:persName" group-by="@corresp">
                            
                            <xsl:if test="count(current-grouping-key()) &gt; 1">
                                <xsl:element name="li">
                                    <xsl:choose>
                                        <xsl:when test="starts-with(., '#')">                             
                                            <xsl:value-of select="substring-after(current-grouping-key(), '#')"/>                      
                                        </xsl:when>                                                     
                                        <xsl:otherwise>
                                            <xsl:value-of select="current-grouping-key()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:element>
                            </xsl:if>
                        </xsl:for-each-group>
                        
                         -->
            
            
            
            
            
            <!--  </xsl:for-each-group>--> 
            
            
            
            
            
            <!--    <xsl:template match="//tei:TEI" name="page_acteurs">
        
        
        <xsl:for-each select="//*[@corresp]">
            <xsl:result-document method="html" href="{./@xml:id}.html">
                <xsl:element name="html">
                    
                    
                    
                    <xsl:element name="head">
                        <xsl:element name="title">
                            <xsl:value-of
                                select="replace(replace(replace(tokenize(base-uri(), '/')[last()], '%20', ' '), '.xml', ''), '%C3%A8', 'è')"
                            />
                        </xsl:element>
                        <xsl:element name="meta">
                            <xsl:attribute name="charset">
                                <xsl:text>UTF-8</xsl:text>
                            </xsl:attribute>
                                 <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text/>>
                        </xsl:attribute>
                    </xsl:element>
                        </xsl:element>
                        
                    </xsl:element>
                    
                    <xsl:element name="body">-->
            <!-- Sur cette page html on pourra trouver : une photo des acteurs, des textes en durs pour les trouver + les surnoms 
qu’ils ont des les articles, où les citations dans lesquelles ils sont mentionnés. Avant ça il faut donc récupérer 
les données dans les fichiers XML, en créant un document html de base à travers le langage XSLT. 
                        
Appeler les qualifications/citations
Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut 
Appeler les citations ayant un corresp correspondant aux personnes récupérées + haut  
                        
                        
                      
                    </xsl:element>
                    
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>  -->
            
            <!-- Prendre tous les @corresp, enlever les # si nécessaire
    
    Trouver le moyen d'appeler uniquement les xName
    
    -->
            
            <!-- 
    <xsl:template match="/" name="acteur_x10">
        
        <xsl:variable name="correspid">                                        
            <xsl:for-each select="//@corresp">                                      
                <xsl:choose>
                    <xsl:when test="starts-with(., '#')">                           
                        <xsl:for-each select="tokenize(., ' ')">                    
                            <xsl:element name="item">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="."/>                     
                                </xsl:attribute>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>                                                     
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>        
        
    </xsl:template> -->

            <!-- _____________________________On repart de zéro_____________________________________ -->


            <!-- Besoin de : body group-by affaires group-by @corresp pour enlever les doublons 
                     
                     => besoin de créer des variables pour ne pas avoir des group-by dans des group-by se mélangent entre eux 
                     
                     POSSIBILITE D'UTILISER IF DANS UN SELECT, à voir si possible et utile dans un group-by 
                     
                     Trouver solution pour récupérer dans plusieurs tag. => ancestor:: et child:: non -->


            <xsl:element name="body">

                <xsl:element name="h1">
                    <xsl:text>Transfo Acteur</xsl:text>
                </xsl:element>

                <!-- group-by affaires -->
                <xsl:for-each-group select=".//tei:TEI"
                    group-by="tokenize(@xml:id, '_')[position() = 1]">



                    <!-- Titres pour chaque affaires -->
                    <xsl:element name="h2">
                        <xsl:choose>
                            <xsl:when test="current-grouping-key() = 'Jeanne'">
                                <xsl:text>Acteur(s) récurrent(s) dans l'affaire Jeanne</xsl:text>
                            </xsl:when>
                            <xsl:when test="current-grouping-key() = 'Menaces'">
                                <xsl:text>Acteur(s) récurrent(s) lié(s) aux menaces contre les juges</xsl:text>
                            </xsl:when>
                            <xsl:when test="current-grouping-key() = 'Ali'">
                                <xsl:text>Acteur(s) récurrent(s) dans l'affaire Ibrahim Ali</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:element>
                    <!-- Fin h2 -->



                    <!-- var de l'index modifiée : besoin d'un stockage temporaire ? Ne pas oublier que l'on est déjà dans un group-by affaire, current-grouping-key utilisable -->
                    <xsl:variable name="CorrespName">



                        <!-- A l'intérieur de chaque aricle, pour chaque @corresp de persName, de roleName ET de addName -->
                        <xsl:for-each
                            select="current-group()//tei:persName[@corresp] | current-group()//tei:roleName[@corresp] | current-group()//tei:addName[@corresp]">


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
                                <xsl:if test="count(current-group()) &gt; 2">
                                    
                                    <xsl:element name="li">
                                        <xsl:value-of select="current-grouping-key()"/>
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="count(current-group())"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:element>
                                    
                                </xsl:if>
                                
                            </xsl:for-each-group>
                            
                        </xsl:element>

                </xsl:for-each-group>


            </xsl:element>

        </xsl:element>

    </xsl:template>

    <!-- Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut 
            Trouver le moyen d'unifier ça ? 
            <xsl:for-each-group select=".//tei:roleName" group-by="@corresp"> 
            <xsl:if test="count(current-grouping-key()) &gt; 1"> 
            <xsl:element name="li"> 
            <xsl:choose> 
            <xsl:when test="starts-with(., '#')"> 
            <xsl:value-of select="substring-after(current-grouping-key(), '#')"/> 
            </xsl:when> 
            <xsl:otherwise> 
            <xsl:value-of select="current-grouping-key()"/> 
            </xsl:otherwise> 
            </xsl:choose> 
            </xsl:element> 
            </xslsl:for-each-gxsl:iame" group-by="@corresp"> 
            <xsl:if test="count(current-grouping-key()) &gt; 1"> 
            <xsl:element name="li"> 
            <xsl:choose> 
            <xsl:when test="starts-with(., '#')"> 
            <xsl:value-of select="substring-after(current-grouping-key(), '#')"/> 
            </xsl:when> 
            <xsl:otherwise> 
            <xsl:value-of select="current-grouping-key()"/> 
            </xsl:otherwise> 
            </xsl:choose> 
            </xsl:element> 
            </xsl:if> 
            </xsl:for-each-group> 
            <xsl:for-each-group select=".//tei:persName" group-by="@corresp"> 
            <xsl:if test="count(current-grouping-key()) &gt; 1"> 
            <xsl:element name="li"> 
            <xsl:choose> 
            <xsl:when test="starts-with(., '#')"> 
            <xsl:value-of select="substring-after(current-grouping-key(), '#')"/> 
            </xsl:when> 
            <xsl:otherwise> 
            <xsl:value-of select="current-grouping-key()"/> 
            </xsl:otherwise> 
            </xsl:choose> 
            </xsl:element> 
            </xsl:if> 
            </xsl:for-each-group> -->



    <!--  
    <xsl:template match="//tei:TEI" name="page_acteurs">

        <xsl:for-each select="//*[@corresp]">

            <xsl:result-document method="html" href="{./@xml:id}.html">

                <xsl:element name="html">

                    <xsl:element name="head">

                        <xsl:element name="title">

                            <xsl:value-of
                                select="replace(replace(replace(tokenize(base-uri(), '/')[last()], '%20', ' '), '.xml', ''), '%C3%A8', 'è')"
                            />
                        </xsl:element>

                        <xsl:element name="meta">

                            <xsl:attribute name="charset">

                                <xsl:text>UTF-8
            </xsl:text>
                            </xsl:attribute>

                            <xsl:element name="link">

                                <xsl:attribute name="rel">

                                    <xsl:text>stylesheet
            </xsl:text>
                                </xsl:attribute>

                                <xsl:attribute name="type">

                                    <xsl:text>text/css
            </xsl:text>
                                </xsl:attribute>

                                <xsl:attribute name="href">
                                    <xsl:text/>> </xsl:attribute>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>

                    <xsl:element name="body"/>
                   Sur cette page html on pourra trouver : une photo des acteurs, des textes en durs pour les trouver + les surnoms qu’ils ont des les articles, où les citations dans lesquelles ils sont mentionnés. Avant ça il faut donc récupérer les données dans les fichiers XML, en créant un document html de base à travers le langage XSLT. Appeler les qualifications/citations Appeler le contenu de toutes les balises roleName, persName, addName avec un corresp ayant pour valeur les personnes récupérées + haut Appeler les citations ayant un corresp correspondant aux personnes récupérées + haut 
            </xsl:element> 
            </xsl:element> 
            </xsl:result-document> 
            </xsl:for-each> 
            </xsl:template>
                     Prendre tous les @corresp, enlever les # si nécessaire Trouver le moyen d'appeler uniquement les xName 
                </xsl:element>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

-->


</xsl:stylesheet>
