<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math" version="3.0">




    <xsl:output method="html"/>

    <xsl:template match="tei:TEI" name="citation">


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
    </xsl:template>

    <!-- 
    <xsl:template match="master">


        <xsl:element name="html">




            <xsl:element name="head">
                <xsl:element name="meta">
                    <xsl:attribute name="charset">
                        <xsl:text>UTF-8</xsl:text>
                    </xsl:attribute>
               
                </xsl:element>
                        <xsl:attribute name="rel">
                            <xsl:text>stylesheet</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="type">
                            <xsl:text>text/css</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>C:\Users\nicob\OneDrive - univ-lyon3.fr\Travail\Stage SC\Fichiers centralisés\CSS\style_HTML_textes.css</xsl:text>
                        </xsl:attribute>
                    </xsl:element> 
                <xsl:element name="style">
                    <xsl:text>
.cit_dir{
font-style: italic;}

.cit_indir{
font-weight: bold;}
.cit_inap
}
                </xsl:text>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                
                
                <xsl:for-each-group select=".//tei:TEI" group-by="@xml:id" >
                    
                    
                    
                    <xsl:choose>
                        <xsl:when test=".//tei:said[@direct]">
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
                            
                            
                            
                            
                            <xsl:for-each-group select=".//tei:said" group-by="@direct">
                                
                                
                                  
                                
                                <xsl:sort select="if (@direct='true') then 1
                                    else if (@direct='false') then 2
                                    else 3"
                                    data-type="number"/>

                                <xsl:choose>

                                    <xsl:when test="@direct = 'true'">
                                        <xsl:element name="h2">
                                            <xsl:text>Citations directes</xsl:text>
                                        </xsl:element>

                                        <xsl:element name="ul">
                                            
                                            
                                            
                                            <xsl:for-each select="ancestor::tei:TEI.//tei:said[@direct='true']">
                                            
                                            

                                            <xsl:element name="li">
                                                <xsl:value-of select="@who"/>
                                                <xsl:text> : </xsl:text>
                                                <xsl:element name="span">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>cit_dir</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="."/>
                                                </xsl:element>
                                            </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>

                                    </xsl:when>


                                    <xsl:when test="@direct = 'false'">
                                        <xsl:element name="h2">
                                            <xsl:text>Citations indirectes</xsl:text>
                                        </xsl:element>

                                        <xsl:element name="ul">
                                            <xsl:for-each select="//tei:said[@direct='false']">
                                            <xsl:element name="li">
                                                <xsl:value-of select="@who"/>
                                                <xsl:text> : </xsl:text>
                                                <xsl:element name="span">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>cit_indir</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="."/>
                                                </xsl:element>
                                            </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>

                                    </xsl:when>


                                    <xsl:when test="@direct = 'inapplicable'">
                                        <xsl:element name="h2">
                                            <xsl:text>Citations inapplicables (?)</xsl:text>
                                        </xsl:element>

                                        <xsl:element name="ul">
                                            <xsl:for-each select="//tei:said[@direct='inapplicable']">
                                            <xsl:element name="li">
                                                <xsl:value-of select="@who"/>
                                                <xsl:text> : </xsl:text>
                                                <xsl:element name="span">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>cit_inap</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="."/>
                                                </xsl:element>
                                            </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>

                                    </xsl:when>
                                </xsl:choose>

                            </xsl:for-each-group>


                        </xsl:when>
                    </xsl:choose>

                </xsl:for-each-group>



            </xsl:element>
        </xsl:element>
        
    </xsl:template>

 -->

</xsl:stylesheet>