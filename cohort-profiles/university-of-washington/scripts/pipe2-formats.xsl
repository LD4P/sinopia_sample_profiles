<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2005/xpath-functions" xmlns:j="http://www.w3.org/2005/xpath-functions"
    xmlns:my="http://theo-namespace.edu"
    exclude-result-prefixes="j" version="3.0">
    <xsl:strip-space elements="*"/>

    <xsl:param name="my:format"/>
    <xsl:variable name="formatID" select="concat(':',$my:format)">
    </xsl:variable>
    <xsl:variable name="formatTitle">
        <xsl:choose>
            <xsl:when test="$my:format='monograph'">
                <xsl:text> for monographs</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='etd'">
                <xsl:text> for electronic theses and dissertations</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='dvdVideo'">
                <xsl:text> for DVD Videos</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='map'">
                <xsl:text> for maps</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='adminMetadata'">
                <xsl:text> for administrative metadata</xsl:text>
            </xsl:when> 
            <xsl:when test="$my:format='serial'">
                <xsl:text> for serials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eBook'">
                <xsl:text> for electronic books</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='graphic'">
                <xsl:text> for graphic materials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='soundRecording'">
                 <xsl:text> for sound recordings</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eMap'">
                <xsl:text> for electronic maps</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eSerial'">
                <xsl:text> for electronic serials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eGraphic'">
                <xsl:text> for electronic graphic materials</xsl:text>
            </xsl:when>
            <xsl:otherwise> formatTitle error</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="formatLabel">
        <xsl:choose>
            <xsl:when test="$my:format='monograph'">
                <xsl:text> monographs</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='etd'">
                <xsl:text> electronic theses and dissertations</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='dvdVideo'">
                <xsl:text> DVD Videos</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='map'">
                <xsl:text> maps</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='adminMetadata'">
                <xsl:text> administrative metadata</xsl:text>
            </xsl:when> 
            <xsl:when test="$my:format='serial'">
                <xsl:text> serials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eBook'">
                <xsl:text> electronic books</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='graphic'">
                <xsl:text> graphic materials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='soundRecording'">
                <xsl:text> sound recordings</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eMap'">
                <xsl:text> electronic maps</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eSerial'">
                <xsl:text> electronic serials</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='eGraphic'">
                <xsl:text> electronic graphic materials</xsl:text>
            </xsl:when>
            <xsl:otherwise> formatLabel error</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
  <!--  <xsl:variable name="formatEnum">
        <xsl:choose>
            <xsl:when test="$my:format='monograph'">
                <xsl:text>monograph</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='etd'">
                <xsl:text>etd</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='dvdVideo'">
                <xsl:text>dvdVideo</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='map'">
                <xsl:text>map</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='adminMetadata'">
                <xsl:text>adminMetadata</xsl:text>
            </xsl:when>
            <xsl:when test="$my:format='adminMetadata'">
                <xsl:text>adminMetadata</xsl:text>
            </xsl:when>
            <xsl:otherwise>error</xsl:otherwise>
        </xsl:choose>
    </xsl:variable> -->
    <xsl:variable name="profileDesc">
        <xsl:text>Resource templates for</xsl:text>
    </xsl:variable>
    
<!-- TEMPLATES START HERE**************************** -->
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
                <xsl:value-of select="concat($profileDesc, $formatLabel)"/>
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
      <xsl:if test="not($my:format='adminMetadata')">  
        <xsl:for-each
            select="j:map[matches(j:string[@key = 'id'], 'Work|Expression|Manifestation|Item')][j:array[@key='propertyTemplates']/j:map/j:array[@key='usedInProfile']/j:string=$my:format]">
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
        </xsl:if>
        <xsl:if test="$my:format='adminMetadata'">
            <xsl:for-each
                select="j:map[matches(j:string[@key = 'id'], 'AdminMetadata|Status')]">
                <map>
                    <string key="id">
                        <xsl:value-of select="j:string[@key = 'id']"/>
                    </string>
                    <string key="resourceURI">
                        <xsl:value-of select="j:string[@key = 'resourceURI']"/>
                    </string>
                    <string key="resourceLabel">
                        <xsl:value-of
                            select="normalize-space(j:string[@key = 'resourceLabel'])"
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
        </xsl:if>
    </xsl:template>
    <xsl:template match="j:array[@key = 'propertyTemplates']">
        <xsl:for-each select="j:map">
            <!-- Sorting PTs within each RT by uwForm order values
                NOTE: 
                0 (undetermined) first, 
                everything else next -->
            <xsl:sort select="j:number[@key = 'uwFormOrder']" data-type="number"/>
            <xsl:if test="j:array[@key = 'usedInProfile']/j:string = $my:format">
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
                                test="matches(., 'AdminMetadata')">
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
