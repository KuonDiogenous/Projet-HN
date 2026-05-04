<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math" version="3.0">


    <xsl:output method="html"/>

    <xsl:template match="master">

        <xsl:result-document method="html" href="Menu transfo.html">

            <xsl:element name="html">


                <!-- CSS pour visu  -->

                <xsl:element name="head">
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <!--    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text></xsl:text>
                        </xsl:attribute>
                    </xsl:element>-->
                </xsl:element>

                <xsl:element name="body">
                    <xsl:element name="h1">
                        <xsl:text>Résultats des transfo</xsl:text>
                    </xsl:element>
                    <xsl:element name="nav">
                        <xsl:element name="h2">
                            <xsl:text>Menu</xsl:text>
                        </xsl:element>
                        <xsl:element name="ul">
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>transfo_table_w.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Table des word/seg</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>transfo_citation.html</xsl:text>
                                    </xsl:attribute>

                                    <xsl:text>Page des citations</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>transfo_acteur.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Page(s) des acteurs</xsl:text>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="li">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:text>transfo_nettoyage.html</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>Page pour le nettoyage</xsl:text>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:call-template name="table_w_seg"/>
            <xsl:call-template name="citation"/>
            <xsl:call-template name="acteurs"/>
            <xsl:call-template name="nettoyage"/>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="//tei:TEI" name="table_w_seg">

        <xsl:result-document method="html" href="transfo_table_w.html">

            <xsl:element name="html">


                <!-- CSS pour visu  -->

                <xsl:element name="head">
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <!--    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text></xsl:text>
                        </xsl:attribute>
                    </xsl:element>-->
                    <xsl:element name="style">
                        <xsl:text>
                    table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.top {
  --offset: 50px; 
  
  position: sticky;
  bottom: 20px;      
  margin-right:10px; 
  place-self: end;
  margin-top: calc(100vh + var(--offset));
  
  /* visual styling */
  text-decoration: none;
  padding: 10px;
  font-family: sans-serif;
  color: #fff;
  background: #000;
  border-radius: 100px;
  white-space: nowrap;
}
                </xsl:text>
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


                    <xsl:element name="ul">


                        <!-- Group-by article -->

                        <xsl:for-each-group select=".//tei:TEI" group-by="@xml:id">



                            <xsl:element name="li">

                                <!-- Afficher le xml:id  -->

                                <xsl:element name="h1">
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

                                <xsl:element name="table">

                                    <!-- Colonnes Titres -->

                                    <xsl:element name="tr">

                                        <xsl:for-each-group select=".//*[@n]" group-by="@n">
                                            <xsl:element name="th">
                                                <xsl:value-of select="current-grouping-key()"/>
                                            </xsl:element>
                                        </xsl:for-each-group>

                                    </xsl:element>



                                    <!-- Contenu -->

                                    <!-- Prendre les s ? si présence de @n à l'intérieur ajouter tr + td, sinon rien -->

                                    <xsl:for-each select=".//tei:s">

                                        <xsl:choose>
                                            <xsl:when test=".//*[@n]">

                                                <!-- Mettre un for each @n=1 ou test=n='1' ?-->

                                                <xsl:element name="tr">

                                                  <xsl:for-each-group select=".//*[@n]"
                                                  group-by="@n">

                                                  <xsl:element name="td">
                                                  <xsl:value-of select="current-group()"/>
                                                  </xsl:element>

                                                  </xsl:for-each-group>

                                                </xsl:element>

                                            </xsl:when>
                                        </xsl:choose>

                                    </xsl:for-each>

                                </xsl:element>


                            </xsl:element>


                        </xsl:for-each-group>



                    </xsl:element>


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

        </xsl:result-document>
    </xsl:template>

    <xsl:template match="//tei:TEI" name="citation">
        <xsl:result-document method="html" href="transfo_citation.html">
            <xsl:element name="hmtl">
                <xsl:element name="head">
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">UTF-8</xsl:attribute>
                    </xsl:element>
                    <xsl:element name="style"> 
                        
                        
                        .cit_dir { 
                        font-style: italic; } 
                        
                        .cit_indir {
                        font-weight: bold; } 
                        
                        .cit_inap { } 
                        
                        .top { 
                        --offset: 50px; 
                        position: sticky;
                        bottom: 20px; 
                        margin-right: 10px; 
                        place-self: end; 
                        margin-top: calc(100vh + var(--offset)); 
                        text-decoration: none; 
                        padding: 10px; 
                        font-family: sans-serif;
                        color: #fff; 
                        background: #000; 
                        border-radius: 100px; }
                        
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="body">
                    
                    <xsl:element name="nav">
                        <xsl:element name="a">
                            <xsl:attribute name="href">Menu transfo.html</xsl:attribute>
                            <xsl:text>Retour à la liste des transfo</xsl:text>
                        </xsl:element>
                    </xsl:element>
                    
                    <!-- Revoir le each group pour l'utiliser plus intelligement -->
                    
                    
                    
                    
                    <xsl:for-each select="//tei:TEI[.//tei:said[@direct]]">
                        
                        <xsl:element name="h1">
                            
                            
                            <!-- Affaire -->
                            <xsl:choose>
                                <xsl:when test="contains(@xml:id, 'Jeanne')">
                                    <xsl:text>L'affaire Jeanne traitée par </xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(@xml:id, 'Menaces')">
                                    <xsl:text>Sur les menaces
                                    contre les juges traitées par </xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(@xml:id, 'Ali')">
                                    <xsl:text>L'affaire Ibrahim Ali traitée par </xsl:text>
                                </xsl:when>
                            </xsl:choose>
                            
                            
                            <!-- Journal -->
                            <xsl:choose>
                                <xsl:when test="contains(@xml:id, 'Libé')">
                                    <xsl:text>Libération</xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(@xml:id, 'Figaro')">
                                    <xsl:text>le Figaro</xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(@xml:id, 'Monde')">
                                    <xsl:text>le Monde</xsl:text>
                                </xsl:when>
                            </xsl:choose>
                            
                            <!-- Date -->
                            <xsl:text> en </xsl:text>
                            <xsl:value-of select="tokenize(@xml:id, '_')[last()]"/>
                        </xsl:element>
                        
                        
                        <!-- Catégorisation à l'intérieur de chaque fichier par @direct -->
                        <xsl:for-each-group select=".//tei:said" group-by="@direct">
                            
                            <xsl:sort select="
                                if (current-grouping-key() = 'true') then
                                1
                                else
                                if (current-grouping-key() = 'false') then
                                2
                                else
                                3" data-type="number"/>
                            
                            <!-- h2 -->
                            <xsl:element name="h2">
                                <xsl:choose>
                                    <xsl:when test="current-grouping-key() = 'true'">
                                        <xsl:text>Citations directes</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="current-grouping-key() = 'false'">
                                        <xsl:text>Citations indirectes</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Citations inapplicables (?)</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:element>
                            
                            
                            
                            <!-- Citations -->
                            
                            <!-- On se trouve alors dans chaque catégorie et à l'intérieur de chaque article => uniformisation -->
                            <xsl:element name="ul">
                                
                                
                                <xsl:for-each select="current-group()">
                                    
                                    <!-- A géométrie variable -->
                                    <xsl:sort select="@who"/>
                                    
                                    
                                    <xsl:element name="li">
                                        
                                        <!-- Enlève les # -->
                                        <xsl:choose>
                                            <xsl:when test="starts-with(@who, '#')">
                                                <xsl:value-of select="substring-after(@who, '#')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@who"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text> : </xsl:text>
                                        
                                        
                                        <!-- span pour css -->
                                        <xsl:element name="span">
                                            <xsl:attribute name="class">
                                                <xsl:choose>
                                                    <xsl:when test="@direct = 'true'"
                                                        >cit_dir</xsl:when>
                                                    <xsl:when test="@direct = 'false'"
                                                        >cit_indir</xsl:when>
                                                    <xsl:otherwise>cit_inap</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            
                                            <!-- €article > €said => . -->
                                            <xsl:value-of select="."/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                                
                                
                            </xsl:element>
                            
                        </xsl:for-each-group>
                        
                    </xsl:for-each>
                    
                    
                    <!-- QoL -->
                    <xsl:element name="a">
                        <xsl:attribute name="href">#</xsl:attribute>
                        <xsl:attribute name="class">top</xsl:attribute>
                        <xsl:text>Retour en haut ↑</xsl:text>
                    </xsl:element>
                    
                </xsl:element>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>



    <xsl:template match="//tei:TEI" name="acteurs">
        <xsl:result-document method="html" href="transfo_acteur.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <!--    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text></xsl:text>
                        </xsl:attribute>
                    </xsl:element>-->
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
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//tei:TEI" name="nettoyage">
        <xsl:result-document method="html" href="transfo_nettoyage.html">
            <xsl:element name="html">
                <xsl:element name="head">
                    <xsl:element name="meta">
                        <xsl:attribute name="charset">
                            <xsl:text>UTF-8</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    <!--    <xsl:element name="link">
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text></xsl:text>
                        </xsl:attribute>
                    </xsl:element>-->
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
            
        </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>
