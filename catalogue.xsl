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
                            <th id="marques"><xsl:value-of select="@nomMarque"/></th>
                        </xsl:for-each>
                    </tr>
                </table>
                 <div id="searchbar"><input type="text"/><button>Recherche</button></div>
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
                        <td><img>
                            <xsl:attribute name="src">
                                <xsl:value-of select='image/@src'/>
                            </xsl:attribute>
                        </img><br/>
                        <xsl:value-of select="nom"/>
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
                                <li><xsl:value-of select="upper-case(@nom)"/></li>
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
            
        </body>
        
    </xsl:template>
    
    
</xsl:stylesheet>
