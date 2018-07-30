<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

<!-- Adapted from https://stackoverflow.com/questions/4845660/xsl-how-to-split-strings -->
 <xsl:template name="split">
  <xsl:param name="pText" select="."/>
  <xsl:if test="string-length($pText)">
   <xsl:if test="not($pText=.)"><xsl:text> </xsl:text></xsl:if>
   <xsl:value-of select=
    "substring-before(concat($pText,'-'),'-')"/>
   <xsl:call-template name="split">
    <xsl:with-param name="pText" select=
     "substring-after($pText, '-')"/>
   </xsl:call-template>
  </xsl:if>
 </xsl:template>
 
  <xsl:template match="/">
header, type, name, text
<xsl:apply-templates/>    
  </xsl:template>
  
  <xsl:template match="header">
<xsl:text>
</xsl:text><xsl:value-of select="@name"/>, header,<xsl:value-of select="@name"/>
<xsl:text>
</xsl:text>
<xsl:apply-templates/>    
  </xsl:template>
  
<xsl:template match="class|class-template|macro|type-alias|enum-class|enum">
<xsl:value-of select="ancestor::header/@name"/>,<xsl:call-template name="split"><xsl:with-param name="pText"><xsl:value-of select ="name(.)"/></xsl:with-param></xsl:call-template>,<xsl:value-of select="@name"/>,"<xsl:value-of select="text"/>"
</xsl:template>
  
  <xsl:template match="text()|@*"/>
</xsl:stylesheet>
