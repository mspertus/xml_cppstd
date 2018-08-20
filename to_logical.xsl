<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes="ltx">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <xsl:element name="standard">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="header">
    <xsl:element name="header">
      <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="declaration[block-declaration/alias-declaration]">
    <xsl:element name="type-alias">
      <xsl:attribute name="name">
	<xsl:value-of select="block-declaration/alias-declaration/identifier/match"/>
      </xsl:attribute>
      <xsl:element name="match">
	<xsl:value-of select="match"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="declaration[linkage-specification/declaration/block-declaration/alias-declaration]">
    <xsl:element name="type-alias">
      <xsl:attribute name="name">
	<xsl:value-of select="linkage-specification/declaration/block-declaration/alias-declaration/identifier/match"/>
      </xsl:attribute>
      <xsl:element name="match">
	<xsl:value-of select="match"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="declaration[block-declaration/simple-declaration/init-declarator-list//parameters-and-qualifiers]">
    <xsl:element name="function">
      <xsl:attribute name="name">
	<xsl:value-of select="block-declaration/simple-declaration/init-declarator-list//declarator-id/match"/>
      </xsl:attribute>
      <xsl:element name="match">
	<xsl:value-of select="match"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="declaration[control-line]">
    <xsl:element name="macro">
      <xsl:attribute name="name">
	<xsl:value-of select="control-line/identifier/match"/>
      </xsl:attribute>
      <xsl:element name="match">
	<xsl:value-of select="match"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>


<xsl:template match="text()|@*"/>
</xsl:stylesheet>
