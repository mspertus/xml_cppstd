<xsl:stylesheet
    version   = "1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:ltx = "http://dlmf.nist.gov/LaTeXML"
    exclude-result-prefixes="ltx">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="show-ignore" select="false"/>
  <xsl:template match="/">
    <standard>
      <xsl:apply-templates select="*"/>
    </standard>
  </xsl:template>

  <xsl:template match="ltx:note[@role='header']">
    <header>
      <xsl:attribute name="name"><xsl:value-of select="@class"/></xsl:attribute> 
      <xsl:apply-templates select="ltx:note[@role='declaration-seq']"/>
    </header>
  </xsl:template>
  
  <xsl:template match="ltx:note[@role='declaration-seq']">
    <xsl:apply-templates select="." mode="auto"/>
  </xsl:template>

  <xsl:template match="ltx:note[@role='statements']">
      <xsl:apply-templates select="." mode="auto"/>
  </xsl:template>
  
  <xsl:template match="ltx:note[@role='ignore']" mode="override">
    <xsl:element name="{@role}">
      <xsl:value-of select="text()"/>
      <xsl:apply-templates select="*" mode="auto"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="ltx:note[@class='ignore']" mode="auto">
    <xsl:if test="$show-ignore='true'">
      <xsl:element name="{@role}">
	<xsl:value-of select="text()"/>
	<xsl:apply-templates select="*" mode="auto"/>
      </xsl:element>
    </xsl:if>
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
      <xsl:for-each select="//ltx:note[@class='class-template-specialization' and descendant::ltx:note[@role='template-name']/text()=$primary-template-name]">
	<xsl:call-template name="declaration"/>
      </xsl:for-each>
    </class-template>
  </xsl:template>

  <xsl:template match="ltx:note" mode="auto">
    <xsl:element name="{@role}">
      <xsl:value-of select="text()"/>
      <xsl:apply-templates select="*" mode="auto"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="declaration">
    <xsl:element name="{@class}">
      <xsl:attribute name="name"><xsl:value-of select="./ltx:note[@role='name']"/></xsl:attribute>
      <text><xsl:value-of select="./ltx:note[@role='text']"/></text>
      <xsl:apply-templates select="*[@role != 'name']" mode="auto"/>
    </xsl:element>
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
