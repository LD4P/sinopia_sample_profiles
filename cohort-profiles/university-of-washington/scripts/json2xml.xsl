<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http:www.w3.org/2013/XSL/json" version="3.0">
    <xsl:output method="xml"/>

    <!-- Pass jsonFile param for target JSON-in-XML profile in oXygen transform scenario -->
    <xsl:param name="jsonFile"/>
    <xsl:param name="j" select="unparsed-text($jsonFile)"/>


    <xsl:template match="/">
        <xsl:copy-of select="json-to-xml($j)"/>
    </xsl:template>

</xsl:stylesheet>
