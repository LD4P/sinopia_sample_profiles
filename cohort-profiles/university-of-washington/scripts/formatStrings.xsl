<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="3.0">
    
    <xsl:template name="titleCase">
        <xsl:param name="format"/>
        <xsl:choose>
            <xsl:when test="$format = 'adminMetadata'">
                <xsl:text>Administrative Metadata</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'dvdVideo'">
                <xsl:text>DVD Videos</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eBook'">
                <xsl:text>e-Books</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eGraphic'">
                <xsl:text>Electronic Graphic Materials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eMap'">
                <xsl:text>Electronic Maps</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eSerial'">
                <xsl:text>Electronic Serials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'etd'">
                <xsl:text>Electronic Theses and Dissertations</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'graphic'">
                <xsl:text>Graphic Materials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'map'">
                <xsl:text>Maps</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'monograph'">
                <xsl:text>Monographs</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'serial'">
                <xsl:text>Serials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'soundRecording'">
                <xsl:text>Sound Recordings</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <strong>
                    <xsl:text>UNKNOWN FORMAT VALUE (!)</xsl:text>
                </strong>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="lowerCase">
        <xsl:param name="format"/>
        <xsl:choose>
            <xsl:when test="$format = 'adminMetadata'">
                <xsl:text>administrative metadata</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'dvdVideo'">
                <xsl:text>DVD videos</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eBook'">
                <xsl:text>e-books</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eGraphic'">
                <xsl:text>electronic graphic materials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eMap'">
                <xsl:text>electronic maps</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'eSerial'">
                <xsl:text>electronic serials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'etd'">
                <xsl:text>electronic theses and dissertations</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'graphic'">
                <xsl:text>graphic materials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'map'">
                <xsl:text>maps</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'monograph'">
                <xsl:text>monographs</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'serial'">
                <xsl:text>serials</xsl:text>
            </xsl:when>
            <xsl:when test="$format = 'soundRecording'">
                <xsl:text>sound recordings</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
