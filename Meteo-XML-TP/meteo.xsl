<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Météo - Mesures</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    table { border-collapse: collapse; width: 60%; margin-bottom: 20px; }
                    th, td { border: 1px solid #ccc; padding: 6px 8px; text-align: left; }
                    th { background: #f0f0f0; }
                    h2 { margin-top: 30px; }
                </style>
            </head>
            <body>
                <h1>Mesures de température</h1>
                <xsl:for-each select="meteo/mesure">
                    <h2>
                        Date: <xsl:value-of select="@date"/>
                    </h2>
                    <table>
                        <thead>
                            <tr><th>Ville</th><th>Température (°C)</th></tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="ville">
                                <tr>
                                    <td><xsl:value-of select="@nom"/></td>
                                    <td><xsl:value-of select="@temperature"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
