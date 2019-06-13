<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:j="http://www.w3.org/2005/xpath-functions"
    xmlns="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- IDENTITY TEMPLATE -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="j:string[@key = 'uwFormOrder']">
        <number key="uwFormOrder"><xsl:value-of select="."/></number>
    </xsl:template>
</xsl:stylesheet>