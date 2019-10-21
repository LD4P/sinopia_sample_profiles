<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http:www.w3.org/2013/XSL/json" version="3.0">
    <xsl:output method="xml"/>

    <xsl:param name="j" select="unparsed-text('../WAU.profile.RDA.json')"/>

    <xsl:template match="/">
        <xsl:result-document href="../xml/WAU.profile.RDA.json.xml">
            <xsl:copy-of select="json-to-xml($j)"/>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
