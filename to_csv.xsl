<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes="ltx">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/">
header, type, name
<xsl:apply-templates/>    
  </xsl:template>
  <xsl:template match="ltx:note[@role='header']">
    <xsl:value-of select="@class"/>,header,<xsl:value-of select="@class"/>
<xsl:text>
</xsl:text>
<xsl:apply-templates/>    
  </xsl:template>
  
  <xsl:template match="ltx:note[@role='macro']">
    <xsl:value-of select="ancestor::ltx:note[@role='header']/@class"/>,macro,<xsl:value-of select="."/>
<xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="ltx:note[@role='type alias']">
    <xsl:value-of select="ancestor::ltx:note[@role='header']/@class"/>,type alias,<xsl:value-of select="."/>
<xsl:text>
</xsl:text>
  </xsl:template>
<xsl:template match="text()|@*"/>
</xsl:stylesheet>
