<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http:www.w3.org/2013/XSL/json" version="3.0">
    <xsl:output method="xml"/>
    <xsl:param name="json" select="unparsed-text('../WAU.profile.RDA.json')"/>
    <xsl:template match="/">
        <xsl:copy-of select="json-to-xml($json)"/>
    </xsl:template>
</xsl:stylesheet>
