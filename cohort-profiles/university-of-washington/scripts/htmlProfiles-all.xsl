<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:param name="sourceURL"/>
    <xsl:template match="/">
        <xsl:for-each
            select="('adminMetadata', 'dvdVideo', 'eBook', 'eGraphic', 'eMap', 'eSerial', 'etd', 'graphic', 'map', 'monograph', 'serial', 'soundRecording')">
            <xsl:variable name="format" select="."/>
            <xsl:variable name="html-transform">
                <xsl:sequence
                    select="
                        let $t := transform(
                        map {
                            'stylesheet-location': 'htmlProfiles-core-formats.xsl',
                            'source-node': unparsed-text($sourceURL) => json-to-xml(),
                            'stylesheet-params': map {QName('https://github.com/briesenberg07/bmrLIS/', 'format'): $format}
                        })
                        return
                            $t?output"
                />
            </xsl:variable>
            <xsl:result-document href="../html/WAU.profile.RDA.{$format}.html">
                <xsl:sequence select="$html-transform"/>
            </xsl:result-document>
            <!-- TO DO:
                Change to xsl:result-document to publish to profiles directory; use param so that filepath is not in code in GitHub
                (had trouble doing this -->
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
