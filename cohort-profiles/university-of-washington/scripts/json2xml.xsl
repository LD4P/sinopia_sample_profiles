<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http:www.w3.org/2013/XSL/json" version="3.0">
    <xsl:output method="xml"/>

    <xsl:param name="j" select="unparsed-text('https://raw.githubusercontent.com/CECSpecialistI/UWLibCatProfiles/master/uw-rda-profile-v03.json')"/>

    <xsl:template match="/">
        <xsl:copy-of select="json-to-xml($j)"/>
    </xsl:template>

</xsl:stylesheet>
