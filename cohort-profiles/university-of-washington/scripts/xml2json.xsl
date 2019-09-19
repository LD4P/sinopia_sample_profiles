<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:output method="text"/>
    
    <!-- BEFORE USING THIS TRANSFORM, 
        *CONFIRM OUTPUT FILE LOCATION TO AVOID OVERWRITING
        A DIFFERENT FORMAT-SPECIFIC JSON PROFILE -->
    
    <xsl:template match="/">
        <xsl:value-of select="xml-to-json(.)"/>
    </xsl:template>
    
</xsl:stylesheet>