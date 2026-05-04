<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math" version="3.0">

  <!--   <xsl:variable name="w_seg">
        
        <xsl:choose>
            <xsl:when test=".//tei:w">
                <xsl:for-each select=".//tei:w">
                    
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                    
                </xsl:for-each>
            </xsl:when>
            <xsl:when test=".//tei:seg">
                <xsl:for-each select=".//tei:seg">
                    
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                    
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
    </xsl:variable> -->

    <!-- HTML -->

    <xsl:output method="html"/>

    <!-- Pour chaque article : aller chercher le xml:id ; faire un tableau avec comme colonne n1, n2 ... 
    => group-by article, dans chaque article récupérer le @xml:id les @n et faire tableau via 
    
    
    <table>
    
    ligne titre 
    
        <tr>
            <th></th>
        </tr>
        
    Contenu
        
        <tr>
            <td></td>
        </tr>

    </table>
    
    => 
    
    pour chaque n != faire une <th> dans <td>
    Pour chaque n="1" commencer un <tr> 
        mettre chaque @n dans un <td> 
    -->

    <xsl:template match="master">
        
        
        <xsl:element name="html">
            
            
            <!-- CSS pour visu  -->
            
            <xsl:element name="head">
                <xsl:element name="meta">
                    <xsl:attribute name="charset">
                        <xsl:text>UTF-8</xsl:text>
                    </xsl:attribute>
                </xsl:element>
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
                </xsl:text>
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
                                    <xsl:when test="contains(., 'Jeanne')">
                                        <xsl:text>L'affaire Jeanne traitée par </xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'Menaces')">
                                        <xsl:text>Sur les menaces contre les juges traitées par </xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'Ali')">
                                        <xsl:text>L'affaire Ibrahim Ali traitée par </xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="contains(., 'Libé')">
                                        <xsl:text>Libération</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'Figaro')">
                                        <xsl:text>le Figaro</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="contains(., 'Monde')">
                                        <xsl:text>le Monde</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:text> en </xsl:text>
                                <xsl:value-of select="tokenize(current-grouping-key(), '_')[last()]"/>

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

                       <!--          <xsl:for-each select=".//*[@n='1']">
                                    
                                    

                                    <xsl:element name="tr">
                                        
                                        On se trouve dans ? 
                                        Il faut récuperer chaque w et seg, en garder la cohésion 1 2 3
                                        
                                        
                                            <xsl:element name="td">
                                                <xsl:value-of select="$w_seg"/>
                                            </xsl:element>
                                        
                                    </xsl:element>

                                </xsl:for-each> -->
                                
                                
                                
                                <!-- Ok mais juste première phrase -->
                                
                                
                                <!--  
                                <xsl:choose>
                                    <xsl:when test=""></xsl:when>
                                </xsl:choose>
                                
                                
                                <xsl:element name="tr">
                                    
                                    <xsl:for-each-group select=".//*[@n]" group-by="@n">
                                        <xsl:element name="td">
                                            <xsl:value-of select="."/>
                                        </xsl:element>
                                    </xsl:for-each-group>
                                    -->
                                
                                
                                <!-- Prendre les s ? si présence de @n à l'intérieur ajouter tr + td, sinon rien -->
                                
                                <xsl:for-each select=".//tei:s">
                                    
                                    <xsl:choose>
                                        <xsl:when test=".//*[@n]">
                                            
                                            <!-- Mettre un for each @n=1 ou test=n='1' ?-->
                                            
                                            <xsl:element name="tr">
                                                
                                                <xsl:for-each-group select=".//*[@n]" group-by="@n">
                                                    
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

                    <!-- Créer fichier HTML classer les oeuvres en 3 catégories speeches/rhetoric/philosophy 
    
    <xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:element name="body">
                
                
                <xsl:element name="ul">
                    
                    <xsl:for-each-group select=".//tei:bibl" group-by="@type">
                        
                        <xsl:element name="li">
                        
                            <xsl:element name="h2">
                            <xsl:value-of select="current-grouping-key()"/>
                            </xsl:element>
                        
                            <xsl:for-each select="current-group()">
                                <xsl:element name="li">
                                    <xsl:value-of select="tei:title"/>
                                </xsl:element>
                            </xsl:for-each>        
                            
                        </xsl:element>
                        
                    </xsl:for-each-group>
                    
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    -->
                    
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!--     <xsl:element name="a">
        <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="class">
            <xsl:text>top</xsl:text>
        </xsl:attribute>
        <xsl:text>&#8593;</xsl:text>
    </xsl:element>
    
    
    
    -->

</xsl:stylesheet>
