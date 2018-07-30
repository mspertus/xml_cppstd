<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes="ltx">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <standard>
      <xsl:apply-templates/>
    </standard>
  </xsl:template>
  
  <xsl:template match="ltx:note[@role='header']">
    <header>
      <xsl:attribute name="name"><xsl:value-of select="@class"/></xsl:attribute> 
      <xsl:apply-templates/>
    </header>
  </xsl:template>

  <xsl:template match="ltx:note[@role='declaration' and @class='class']">
    <class>
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
    </class>
  </xsl:template>

  <xsl:template match="ltx:note[@role='declaration' and @class='macro']">
    <macro>
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
    </macro>
  </xsl:template>

  <xsl:template match="ltx:note[@role='declaration' and @class='type-alias']">
    <type-alias>
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
    </type-alias>
  </xsl:template>

  <xsl:template match="ltx:note[@role='declaration' and @class='enum-class']">
    <enum-class> 
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
   </enum-class>
  </xsl:template>

  <xsl:template match="text()|@*"/>
</xsl:stylesheet>
