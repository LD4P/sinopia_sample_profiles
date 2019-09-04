<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2005/xpath-functions" xmlns:j="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="j" version="3.0">
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <map xmlns="http://www.w3.org/2005/xpath-functions">
            <xsl:apply-templates select="j:map/j:map[@key = 'Profile']"/>
        </map>
    </xsl:template>
    <xsl:template match="j:map[@key = 'Profile']">
        <map key="Profile">
            <!-- Pulling profile properties from the profile -->
            <string key="author">
                <xsl:value-of select="j:string[@key = 'author']"/>
            </string>
            <string key="date">
                <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
            </string>
            <!-- Description not accurate for format-specific profiles as not all RTs are pushed through to them -->
            <string key="description">
                <xsl:value-of select="concat(j:string[@key = 'description'], ' for DVD videos')"/>
            </string>
            <string key="id">
                <xsl:value-of select="concat(j:string[@key = 'id'], ':dvdVideo')"/>
            </string>
            <string key="title">
                <xsl:value-of
                    select="concat(j:string[@key = 'title'], ' for describing DVD videos')"/>
            </string>
            <!-- Hard-coded schema value here
                *Conformance requirements may change in future* -->
            <string key="schema">https://ld4p.github.io/sinopia/schemas/0.0.9/profile.json</string>
            <array key="resourceTemplates">
                <xsl:apply-templates select="j:array[@key = 'resourceTemplates']"/>
            </array>
        </map>
    </xsl:template>
    <xsl:template match="j:array[@key = 'resourceTemplates']">
        <!-- Specify each RT to push through to dvdVideo profile below -->
        <xsl:for-each
            select="j:map[matches(j:string[@key = 'id'], 'Work|Expression|Manifestation|Item|Timespan')]">
            <map>
                <string key="id">
                    <xsl:value-of select="concat(j:string[@key = 'id'], ':dvdVideo')"/>
                </string>
                <string key="resourceURI">
                    <xsl:value-of select="j:string[@key = 'resourceURI']"/>
                </string>
                <string key="resourceLabel">
                    <xsl:value-of
                        select="concat(normalize-space(j:string[@key = 'resourceLabel']), ' for DVD videos')"
                    />
                </string>
                <string key="author">
                    <xsl:value-of select="normalize-space(j:string[@key = 'author'])"/>
                </string>
                <string key="date">
                    <xsl:value-of select="j:string[@key = 'date']"/>
                </string>
                <!-- Hard-coded schema value here
                *Conformance requirements may change in future* -->
                <string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.0.9/resource-template.json</string>
                <array key="propertyTemplates">
                    <xsl:apply-templates select="j:array[@key = 'propertyTemplates']"/>
                </array>
            </map>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="j:array[@key = 'propertyTemplates']">
        <xsl:for-each select="j:map">
            <!-- Sorting PTs within each RT by uwForm order values
                NOTE: 
                0 (undetermined) first, 
                everything else next -->
            <xsl:sort select="j:number[@key = 'uwFormOrder']" data-type="number"/>
            <xsl:if test="j:array[@key = 'usedInProfile']/j:string = 'dvdVideo'">
                <map>
                    <!-- activate uwFormOrder below only to check accuracy of sort; otherwise suppress in this transform using comment -->
                    <!-- <string key="uwFormOrderValue"><xsl:value-of select="j:number[@key = 'uwFormOrder']"/></string> -->
                    <string key="propertyLabel">
                        <xsl:value-of select="normalize-space(j:string[@key = 'propertyLabel'])"/>
                    </string>
                    <string key="propertyURI">
                        <xsl:value-of select="j:string[@key = 'propertyURI']"/>
                    </string>
                    <string key="mandatory">
                        <xsl:value-of select="j:string[@key = 'mandatory']"/>
                    </string>
                    <string key="repeatable">
                        <xsl:value-of select="j:string[@key = 'repeatable']"/>
                    </string>
                    <string key="type">
                        <xsl:value-of select="j:string[@key = 'type']"/>
                    </string>
                    <xsl:if test="j:string[@key = 'remark']/text()">
                        <string key="remark">
                            <xsl:value-of select="j:string[@key = 'remark']"/>
                        </string>
                    </xsl:if>
                    <xsl:if test="j:map[@key = 'valueConstraint']/descendant::text()">
                        <map key="valueConstraint">
                            <xsl:apply-templates select="j:map[@key = 'valueConstraint']"/>
                        </map>
                    </xsl:if>
                </map>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="j:map[@key = 'valueConstraint']">
        <xsl:if test="j:array[@key = 'valueTemplateRefs']/descendant::text()">
            <xsl:for-each select="j:array[@key = 'valueTemplateRefs']">
                <array key="valueTemplateRefs">
                    <xsl:choose>
                        <xsl:when test="matches(j:string, 'AdminMetadata')">
                            <string>
                                <xsl:value-of select="j:string"/>
                            </string>
                        </xsl:when>
                        <xsl:otherwise>
                            <string>
                                <xsl:value-of select="concat(j:string, ':monograph')"/>
                            </string>
                        </xsl:otherwise>
                    </xsl:choose>
                </array>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="j:array[@key = 'useValuesFrom']/descendant::text()">
            <xsl:copy-of select="j:array[@key = 'useValuesFrom']"/>
        </xsl:if>
        <xsl:if test="j:map[@key = 'valueDataType']/descendant::text()">
            <xsl:copy-of select="j:map[@key = 'valueDataType']"/>
        </xsl:if>
        <xsl:if test="j:array[@key = 'defaults']/descendant::text()">
            <xsl:copy-of select="j:array[@key = 'defaults']"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
