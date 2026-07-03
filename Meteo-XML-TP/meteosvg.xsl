<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- échelle : pixels par degré -->
    <xsl:variable name="scale" select="6"/>
    
    <!-- liste de ticks (0,5,10,...,70) -->
    <xsl:variable name="ticks">
        <tick val="0"/><tick val="5"/><tick val="10"/><tick val="15"/><tick val="20"/>
        <tick val="25"/><tick val="30"/><tick val="35"/><tick val="40"/><tick val="45"/>
        <tick val="50"/><tick val="55"/><tick val="60"/><tick val="65"/><tick val="70"/>
    </xsl:variable>
    
    <!-- Calculer la température maximale parmi toutes les villes (toutes les mesures) -->
    <xsl:variable name="maxTemp">
        <xsl:for-each select="/meteo/mesure/ville">
            <xsl:sort select="@temperature" data-type="number" order="ascending"/>
            <xsl:if test="position() = last()">
                <xsl:value-of select="@temperature"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:template match="/">
        <!-- SVG racine -->
        <svg:svg xmlns:svg="http://www.w3.org/2000/svg"
            width="1000" height="480" viewBox="0 0 1000 480">
            
            <svg:style>
                <![CDATA[
          .bar { fill: steelblue; }
          .label { font-family: Arial; font-size: 12px; text-anchor:middle; }
          .axis { font-family: Arial; font-size: 12px; text-anchor:end; }
        ]]>
            </svg:style>
            
            <!-- marges et dimensions -->
            <xsl:variable name="marginLeft" select="80"/>
            <xsl:variable name="marginBottom" select="80"/>
            <xsl:variable name="chartHeight" select="320"/>
            <xsl:variable name="chartWidth" select="820"/>
            
            <!-- Axe Y -->
            <svg:line x1="{$marginLeft}" y1="{50}" x2="{$marginLeft}" y2="{ $marginBottom + $chartHeight }" stroke="black"/>
            
            <!-- Axe X -->
            <svg:line x1="{$marginLeft}" y1="{ $marginBottom + $chartHeight }" x2="{ $marginLeft + $chartWidth }" y2="{ $marginBottom + $chartHeight }" stroke="black"/>
            
            <!-- Ticks Y & labels : on parcourt la variable $ticks et on affiche uniquement <= $maxTemp -->
            <xsl:for-each select="document('')/*/xsl:variable[@name='ticks']/tick">
                <xsl:variable name="tickVal" select="number(@val)"/>
                <xsl:if test="$tickVal &lt;= number($maxTemp)">
                    <xsl:variable name="yPos" select="$marginBottom + $chartHeight - ($tickVal * $scale)"/>
                    <!-- texte du tick (sidebar) -->
                    <svg:text class="axis" x="{ $marginLeft - 10 }" y="{ $yPos + 4 }">
                        <xsl:value-of select="$tickVal"/>°C
                    </svg:text>
                    <!-- ligne de grid -->
                    <svg:line x1="{ $marginLeft }" y1="{ $yPos }" x2="{ $marginLeft + $chartWidth }" y2="{ $yPos }" stroke="#e0e0e0" stroke-dasharray="3,3"/>
                    <!-- petit tick marker -->
                    <svg:line x1="{ $marginLeft - 6 }" y1="{ $yPos }" x2="{ $marginLeft }" y2="{ $yPos }" stroke="black"/>
                </xsl:if>
            </xsl:for-each>
            
            <!-- Bars : on prend la liste des villes de la première mesure -->
            <xsl:for-each select="/meteo/mesure[1]/ville">
                <xsl:variable name="i" select="position()"/>
                <xsl:variable name="nom" select="@nom"/>
                <xsl:variable name="t1" select="number(@temperature)"/>
                <xsl:variable name="t2" select="number(../../mesure[2]/ville[@nom = $nom]/@temperature)"/>
                <xsl:variable name="h1" select="$t1 * $scale"/>
                <xsl:variable name="h2" select="$t2 * $scale"/>
                
                <!-- bar width / gap -->
                <xsl:variable name="barWidth" select="60"/>
                <xsl:variable name="gap" select="20"/>
                <xsl:variable name="x" select="$marginLeft + ($i - 1) * ($barWidth + $gap)"/>
                
                <xsl:variable name="y1" select="$marginBottom + $chartHeight - $h1"/>
                <xsl:variable name="y2" select="$marginBottom + $chartHeight - $h2"/>
                
                <!-- rectangle (barre) -->
                <svg:g>
                    <svg:rect class="bar"
                        x="{ $x }" y="{ $y1 }"
                        width="{ $barWidth }" height="{ $h1 }">
                        <!-- animations entre mesure1 et mesure2 (si tu veux) -->
                        <svg:animate attributeName="height" from="{ $h1 }" to="{ $h2 }" dur="3s" repeatCount="indefinite"/>
                        <svg:animate attributeName="y" from="{ $y1 }" to="{ $y2 }" dur="3s" repeatCount="indefinite"/>
                    </svg:rect>
                    
                    <!-- nom de la ville sur l'axe X (sous la barre) -->
                    <svg:text class="label" x="{ $x + ($barWidth div 2) }" y="{ $marginBottom + $chartHeight + 22 }">
                        <xsl:value-of select="$nom"/>
                    </svg:text>
                    
                    <!-- option: afficher la valeur de température au-dessus de la barre (décommenter si voulu) -->
                    <!--
          <svg:text class="label" x="{ $x + ($barWidth div 2) }" y="{ $y2 - 6 }">
            <xsl:value-of select="$t2"/>°C
          </svg:text>
          -->
                </svg:g>
            </xsl:for-each>
            
            <!-- titre -->
            <svg:text x="{ $marginLeft + ($chartWidth div 2) }" y="30" font-size="18" text-anchor="middle" font-family="Arial">
                Histogramme animé des températures
            </svg:text>
            
            <!-- légende (dates) -->
            <svg:text x="{ $marginLeft }" y="{ $marginBottom - 10 }" font-size="12" font-family="Arial">
                Date 1 : <xsl:value-of select="/meteo/mesure[1]/@date"/> — Date 2 : <xsl:value-of select="/meteo/mesure[2]/@date"/>
            </svg:text>
            
        </svg:svg>
    </xsl:template>
</xsl:stylesheet>
