<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Bancaire</title>
            </head>
            <body>
                
                <h1>Relevé Bancaire</h1>
                
                <!-- Liste des opérations -->
                <xsl:for-each select="releve/operations/operation">
                    <ul>
                        <li>Date : <xsl:value-of select="@date"/></li>
                        <li>Type : <xsl:value-of select="@type"/></li>
                        <li>Montant : <xsl:value-of select="@montant"/></li>
                        <li>Description : <xsl:value-of select="@description"/></li>
                    </ul>
                    <hr/>
                </xsl:for-each>
                
                <!-- Tableau des totaux -->
                <h2>Totaux des opérations</h2>
                
                <table border="1" width="90%">
                    <tr>
                        <th>Total des opérations Crédit</th>
                        <td>
                            <xsl:value-of
                                select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Total des opérations Débit</th>
                        <td>
                            <xsl:value-of
                                select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/>
                        </td>
                    </tr>
                </table>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
