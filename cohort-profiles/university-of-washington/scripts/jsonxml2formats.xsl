<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2005/xpath-functions" xmlns:j="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="j" version="3.0">
    <xsl:strip-space elements="*"/>

    <!-- BEFORE USING THIS TRANSFORM, 
        *CONFIRM OUTPUT FILE LOCATION TO AVOID OVERWRITING
        A DIFFERENT FORMAT-SPECIFIC JSON-IN-XML PROFILE -->

    <!-- Variables here to facilitate use for all formats /
        *EDIT EACH for each format to output -->
    <xsl:variable name="formatID" select="':dvdVideo'"/>
    <xsl:variable name="formatTitle" select="' for describing DVD videos'"/>
    <xsl:variable name="formatLabel" select="' DVD videos'"/>
    <xsl:variable name="formatEnum" select="'dvdVideo'"/>

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
            <string key="description">
                <xsl:value-of select="concat(j:string[@key = 'description'], $formatLabel)"/>
            </string>
            <string key="id">
                <xsl:value-of select="concat(j:string[@key = 'id'], $formatID)"/>
            </string>
            <string key="title">
                <xsl:value-of select="concat(j:string[@key = 'title'], $formatTitle)"/>
            </string>
            <!-- Hard-coded schema value here
                *Conformance requirements may change in future* -->
            <string key="schema">https://ld4p.github.io/sinopia/schemas/0.2.1/profile.json</string>
            <array key="resourceTemplates">
                <xsl:apply-templates select="j:array[@key = 'resourceTemplates']"/>
            </array>
        </map>
    </xsl:template>
    <xsl:template match="j:array[@key = 'resourceTemplates']">
        <!-- Specify RTs to push through to profile below -->
        <xsl:for-each
            select="j:map[matches(j:string[@key = 'id'], 'Work|Expression|Manifestation|Item')]">
            <map>
                <string key="id">
                    <xsl:value-of select="concat(j:string[@key = 'id'], $formatID)"/>
                </string>
                <string key="resourceURI">
                    <xsl:value-of select="j:string[@key = 'resourceURI']"/>
                </string>
                <string key="resourceLabel">
                    <xsl:value-of
                        select="concat(normalize-space(j:string[@key = 'resourceLabel']), $formatLabel)"
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
                    >https://ld4p.github.io/sinopia/schemas/0.2.1/resource-template.json</string>
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
            <xsl:if test="j:array[@key = 'usedInProfile']/j:string = $formatEnum">
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
                    <xsl:if test="j:string[@key = 'subtype']/text()">
                        <string key="subtype">
                            <xsl:value-of select="j:string[@key = 'subtype']"/>
                        </string>
                    </xsl:if>
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
        <xsl:if test="j:array[@key = 'valueTemplateRefs']/j:string/text()">
            <xsl:apply-templates select="j:array[@key = 'valueTemplateRefs']"/>
        </xsl:if>
        <xsl:if test="j:array[@key = 'useValuesFrom']/descendant::text()">
            <xsl:choose>
                <xsl:when test="../j:string[@key = 'type'] != 'literal'">
                    <xsl:copy-of select="j:array[@key = 'useValuesFrom']"/>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="j:map[@key = 'valueDataType']/descendant::text()">
            <xsl:copy-of select="j:map[@key = 'valueDataType']"/>
        </xsl:if>
        <xsl:for-each select="j:array[@key = 'defaults']">
            <xsl:if test="descendant::text()">
                <array key="defaults">
                    <map>
                        <xsl:if test="j:map/j:string[@key = 'defaultURI']/text()">
                            <xsl:copy-of select="j:map/j:string[@key = 'defaultURI']"/>
                        </xsl:if>
                        <xsl:if test="j:map/j:string[@key = 'defaultLiteral']/text()">
                            <xsl:copy-of select="j:map/j:string[@key = 'defaultLiteral']"/>
                        </xsl:if>
                    </map>
                </array>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="j:array[@key = 'valueTemplateRefs']">
        <xsl:if test="../../j:string[@key = 'type'] != 'literal'">
            <array key="valueTemplateRefs">
                <xsl:for-each select="j:string">
                    <string>
                        <xsl:choose>
                            <xsl:when
                                test="matches(., 'AdminMetadata|complexSubject|simpleSubject')">
                                <xsl:value-of select="."/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat(., $formatID)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </string>
                </xsl:for-each>
            </array>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
