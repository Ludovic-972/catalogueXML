<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <head>
            <meta charset="UTF-8"/>
            <title>Catalogue de chaussures</title>
            <link rel="stylesheet" href="style.css"/>
        </head>
        <body>
            <div id="header">
                <table border="1">
                    <tr>
                        <xsl:for-each select="//marque">
                            <th class="marqueHeader"><xsl:value-of select="@nomMarque"/></th>
                        </xsl:for-each>
                    </tr>
                </table>
                <div id="searchbox">
                    <label for="marque">Marque : 
                        <select id="marque">
                            <option value=""></option>
                            <xsl:for-each select="//marque">
                                <option>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="@nomMarque"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="@nomMarque"/>
                                </option>
                            </xsl:for-each>  
                        </select>
                    </label>
                    
                    <label for="couleur">Couleur : 
                        <select id="couleur">
                            <option value=""></option>
                            <xsl:for-each select="//couleur[not(@nomCouleur=preceding::couleur/@nomCouleur)]">
                                <option>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="upper-case(@nomCouleur)"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="upper-case(@nomCouleur)"/>
                                </option>
                            </xsl:for-each>  
                        </select>
                    </label>
                    
                    <label for="matiere">Matière : 
                        <select id="matiere">
                            <option value=""></option>
                            <xsl:for-each select="//matiere[not(text()=preceding::matiere/text())]">
                                <option>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="upper-case(current()/text())"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="upper-case(current()/text())"/>
                                </option>
                            </xsl:for-each>  
                        </select>
                    </label>
                    
                    <label for="taille">
                        Taille :<input id="taille" type="number" min="30" max="47"/>
                    </label>
                    
                    <label for="prixMax">
                        Prix maximum:
                        <input id="prixMax" type="number" onchange="watch()">
                            <xsl:attribute name="min">
                                <xsl:value-of select="//chaussure[prix = min(//chaussure/prix)]/prix"/>
                            </xsl:attribute>
                            <xsl:attribute name="max">
                                <xsl:value-of select="//chaussure[prix = max(//chaussure/prix)]/prix"/>
                            </xsl:attribute>
                        </input>
                    </label>
                    
                    <button id="searchButton" onclick="search()">Recherche</button>
                </div>
            </div>
                <br/><br/>
            
            <table id="catalogue" border="1">
                <tr>
                    <th>Chaussure</th>
                    <th>Prix (en &#8364;)</th>
                    <th>Matiere</th>
                    <th>Couleurs</th>
                    <th>Stock</th>
                    <th>Marque</th>
                </tr>
                <xsl:for-each select="//chaussure">
                    <tr>
                        <td>
                        <xsl:value-of select="nom"/>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select='image/@src'/>
                            </xsl:attribute>
                        </img><br/>
                        </td>
                        <td>
                            <xsl:value-of select="prix"/>
                        </td>
                        <td>
                            <ul>
                                <xsl:for-each select="matiere">
                                    <li><xsl:value-of select="text()"/></li>
                                </xsl:for-each>
                            </ul>
                        </td>
                        <td>
                            <ul>
                            <xsl:for-each select="stock/couleur">
                                <li><xsl:value-of select="upper-case(@nomCouleur)"/></li>
                            </xsl:for-each>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <xsl:for-each select="stock">
                                    <xsl:for-each select="couleur/taille">
                                        <li>Taille <xsl:value-of select="current()/text()"/> (<xsl:value-of select="@quantite"/> articles)</li>
                                    </xsl:for-each>
                                </xsl:for-each>
                                
                            </ul>
                        </td>
                        <td>
                            <xsl:value-of select="@nomMarque"/>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
            
            <script src="script.js">&#160;</script>
            
        </body>
        
    </xsl:template>
    

    
</xsl:stylesheet>
