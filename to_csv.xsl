<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/">
header, type, name
<xsl:apply-templates/>    
  </xsl:template>
  <xsl:template match="header">
    <xsl:value-of select="@name"/>,header,<xsl:value-of select="@name"/>
<xsl:text>
</xsl:text>
<xsl:apply-templates/>    
  </xsl:template>
  
  <xsl:template match="macro">
    <xsl:value-of select="ancestor::header/@name"/>,macro,<xsl:value-of select="@name"/>
<xsl:text>
</xsl:text>
  </xsl:template>
  
  <xsl:template match="type-alias">
    <xsl:value-of select="ancestor::header/@name"/>,type alias,<xsl:value-of select="@name"/>
<xsl:text>
</xsl:text>
  </xsl:template>
  
  <xsl:template match="enum-class">
    <xsl:value-of select="ancestor::header/@name"/>,enum class,<xsl:value-of select="@name"/>
<xsl:text>
</xsl:text>
  </xsl:template>
  
  <xsl:template match="text()|@*"/>
</xsl:stylesheet>
