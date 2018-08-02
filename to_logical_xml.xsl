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

  <xsl:template match="ltx:note[@role='declaration' and @class='class-template']">
    <xsl:variable name="primary-template-name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:variable>
    <class-template>
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
      <xsl:for-each select="//ltx:note[@class='class-template-specialization' and ltx:note[@role='template-name']/text()=$primary-template-name]">
	<xsl:call-template name="class-template-specialization"/>
      </xsl:for-each>
    </class-template>
  </xsl:template>

  <xsl:template name="class-template-specialization">
    <class-template-specialization>
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <xsl:attribute name="template-name"><xsl:value-of select="./ltx:note[@role='template-name']"/></xsl:attribute>
      <template-arguments>
	<xsl:for-each select="ltx:note[@role='template-arguments']">
	  <xsl:for-each select="ltx:note[@role='template-argument']">
	    <template-argument><xsl:value-of select="."/></template-argument>
	  </xsl:for-each>
      </xsl:for-each>
      </template-arguments>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
    </class-template-specialization>
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
