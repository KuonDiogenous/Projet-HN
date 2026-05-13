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
<xsl:call-template name="page_acteurs"/>
    </xsl:template>

    <xsl:template name="page_acteurs">


        <!-- Variable de l'index modifiée -->
        <xsl:variable name="CorrespNamePage">

            <!-- Récupère tous les @corresp -->
            <xsl:for-each
                select="//tei:persName[@corresp] | //tei:roleName[@corresp] | //tei:addName[@corresp]">

                <!-- tokenize permettant de s'occuper des @corresp à multiples valeurs -->
                <xsl:for-each select="tokenize(@corresp, '\s+')">


                    <!-- Item pour récup -->
                    <xsl:element name="item">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="replace(., '^#', '')"/>
                        </xsl:attribute>
                    </xsl:element>



                </xsl:for-each>

            </xsl:for-each>

        </xsl:variable>


        <!-- group-by @xml:id pour uniformiser et enlever doublon -->
        <xsl:for-each-group select="$CorrespNamePage/item" group-by="@xml:id">

            <xsl:sort select="@xml:id"/>

            <!-- pour générer seuelement les pages nécessaires -->
            <xsl:if test="count(current-group()) &gt; 2">

                <!-- var pour éviter les répitions replace(current-grouping-key(), '_', ' ') -->
                <xsl:variable name="NameNorm" select="replace(current-grouping-key(), '_', ' ')"/>
                
                <!-- var pour éviter les répitions replace(current-grouping-key(), '_', ' ') -->
                <xsl:variable name="NameKey" select="current-grouping-key()"/>


                <xsl:result-document method="html" indent="yes" href="{current-grouping-key()}.html">

                    <xsl:element name="html">
                        <xsl:element name="head">
                            <xsl:element name="meta">
                                <xsl:attribute name="charset">
                                    <xsl:text>UTF-8</xsl:text>
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:element name="link">
                                <xsl:attribute name="rel">
                                    <xsl:text>stylesheet</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="type">
                                    <xsl:text>text/css</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="href">
                                    <xsl:text>./style.css</xsl:text>
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:element name="title">
                                <xsl:value-of select="$NameNorm"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="nav">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>Menu transfo.html</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Retour à la liste des transfo</xsl:text>
                            </xsl:element>
                        </xsl:element>

                        <xsl:element name="body">

                            <xsl:element name="header">
                                <xsl:element name="div">
                                    <xsl:attribute name="class">
                                        <xsl:text>menu</xsl:text>
                                    </xsl:attribute>

                                    <xsl:element name="ul">

                                        <xsl:element name="li">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                  <xsl:text>index.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Accueil</xsl:text>
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="li">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                  <xsl:text>démarche.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Notre démarche</xsl:text>
                                            </xsl:element>
                                        </xsl:element>


                                        <xsl:element name="li">
                                            <xsl:attribute name="class">
                                                <xsl:text>base_sous_menu</xsl:text>
                                            </xsl:attribute>
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                  <xsl:text>résultats.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Résultats</xsl:text>
                                            </xsl:element>

                                            <xsl:element name="ul">
                                                <xsl:attribute name="class">
                                                  <xsl:text>sous_menu</xsl:text>
                                                </xsl:attribute>


                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>transfo_seg.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Transformation - Ordonnancement des informations</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>transfo_cit.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Transformation - Citations</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>transfo_acteurs.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Transformation - Acteurs</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="li">
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                  <xsl:text>observations.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Observations</xsl:text>
                                            </xsl:element>
                                        </xsl:element>

                                        <xsl:element name="li">
                                            <xsl:attribute name="class">
                                                <xsl:text>base_sous_menu</xsl:text>
                                            </xsl:attribute>
                                            <xsl:element name="a">
                                                <xsl:attribute name="href">
                                                  <xsl:text>dépôt_fichiers.html</xsl:text>
                                                </xsl:attribute>
                                                <xsl:text>Dépôt des fichiers</xsl:text>
                                            </xsl:element>

                                            <xsl:element name="ul">
                                                <xsl:attribute name="class">
                                                  <xsl:text>sous_menu</xsl:text>
                                                </xsl:attribute>


                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>dépôt_articles.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Articles (PDF)</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>dépôt_xml.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Fichiers encodés (XML)</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                                <xsl:element name="li">
                                                  <xsl:element name="a">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>dépôt_xslt.html</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:text>Transformations (XSLT)</xsl:text>
                                                  </xsl:element>
                                                </xsl:element>

                                            </xsl:element>
                                        </xsl:element>


                                    </xsl:element>


                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="main">


                                <xsl:element name="div">
                                    <xsl:attribute name="class">
                                        <xsl:text>container_grid</xsl:text>
                                    </xsl:attribute>


                                    <xsl:element name="div">
                                        <xsl:attribute name="id">
                                            <xsl:text>item1</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="h1">
                                            <xsl:value-of select="$NameNorm"/>
                                        </xsl:element>
                                    </xsl:element>


                                    <xsl:element name="div">
                                        <xsl:attribute name="id">
                                            <xsl:text>item2</xsl:text>
                                        </xsl:attribute>



                                        <!-- Photo de profil, vérifier que format toujours dans le même format
                                que photo toujours avec le bon nom. Possibilité de mettre sur github 
                                et de faire un .../current-grouping-key().png-->
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="current-grouping-key()"/>
                                                <xsl:text>.jpg</xsl:text>
                                            </xsl:attribute>
                                            <xsl:attribute name="class">
                                                <xsl:text>pp</xsl:text>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt"/>
                                        </xsl:element>



                                        <xsl:element name="div">
                                            <xsl:attribute name="class">
                                                <xsl:text>desc</xsl:text>
                                            </xsl:attribute>
                                        </xsl:element>
                                        <!-- ? -->
                                    </xsl:element>

                                    <!-- présentation -->
                                    <xsl:element name="div">
                                        <xsl:attribute name="id">
                                            <xsl:text>item3</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="h2">
                                            <xsl:attribute name="class">
                                                <xsl:text>desc</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Présentation</xsl:text>

                                        </xsl:element>

                                        <xsl:element name="p">
                                            <xsl:attribute name="class">
                                                <xsl:text>desc</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Test
                                        </xsl:text>

                                        </xsl:element>
                                    </xsl:element>



                                    <!-- Noms -->
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">
                                            <xsl:text>nick</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="id">
                                            <xsl:text>item5</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="h2">
                                            <xsl:attribute name="class">
                                                <xsl:text>nick</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Désignation</xsl:text>
</xsl:element>

                                            <xsl:element name="ul">
                                                <xsl:attribute name="class">
                                                  <xsl:text>nick</xsl:text>
                                                </xsl:attribute>
<!-- 
                                                <xsl:for-each select="//ancestor::tei:persName | //ancestor::tei:roleName | //ancestor::tei:addName">
                                                    <xsl:element name="li">
                                                    </xsl:element>
                                                </xsl:for-each>
           -->                                      
                                                
                                                <xsl:value-of select="$NameKey"/>
                                                <xsl:value-of select="current-grouping-key()"/>
                                                
                                                

                                                
                                            </xsl:element>
                                        




                                    </xsl:element>

                                    <!-- occurences -->
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">
                                            <xsl:text>occurences</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="id">
                                            <xsl:text>item4</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="h2">
                                            <xsl:attribute name="class">
                                                <xsl:text>occurences</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Occurrences dans les articles</xsl:text>
                                        </xsl:element>
                                        <xsl:element name="p"> Test </xsl:element>
                                        
                                    </xsl:element>
<!--  -->
                                    <xsl:element name="div">
                                        <xsl:attribute name="class">
                                            <xsl:text>citations</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="id">
                                            <xsl:text>item6</xsl:text>
                                        </xsl:attribute>
                                        <xsl:element name="h2">
                                            <xsl:attribute name="class">
                                                <xsl:text>citations</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Citations</xsl:text>
                                        </xsl:element>
                                        
                                        <xsl:element name="h3">
                                            <xsl:attribute name="class">
                                                <xsl:text>titre_cit</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Citations prononcées</xsl:text>
                                        </xsl:element>
                                        
                                        <xsl:element name="ul">
                                            <xsl:element name="li">
                                                
                                                
                                                
                                            </xsl:element>
                                        </xsl:element>
                                        
                                        
                                        <xsl:element name="h3">
                                            <xsl:attribute name="class">
                                                <xsl:text>titre_cit</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>Ce qu'on en dit</xsl:text>
                                        </xsl:element>
                                        
                                        
                                        <xsl:element name="ul">
                                            <xsl:element name="li">
                                                
                                                
                                                
                                            </xsl:element>
                                        </xsl:element>
                                        
                                        
                                        <xsl:element name="p"> Test </xsl:element>
                                    </xsl:element>

                                </xsl:element>
                            </xsl:element>

                        </xsl:element>
                    </xsl:element>
                    <!--     Sur cette page html on pourra trouver : une photo des acteurs, des textes en durs pour les trouver + les surnoms qu’ils ont des les articles, 
                        où les citations dans lesquelles ils sont mentionnés. Avant ça il faut donc récupérer les données dans les fichiers XML, en créant un document html 
                        de base à travers le langage XSLT. Appeler les qualifications/citations Appeler le contenu de toutes les balises roleName, persName, addName avec un 
                        corresp ayant pour valeur les personnes récupérées + haut Appeler les citations ayant un corresp correspondant aux personnes récupérées + haut 
              -->

                </xsl:result-document>

            </xsl:if>

        </xsl:for-each-group>
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
