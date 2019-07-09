<?xml version="1.0" encoding="UTF-8"?>
<!-- 2019-05-12: this script output a new profile in about 3 seconds on TG's 2012 MacBook Pro -->
<!-- known bug: there will be a few \n in the json; may have to manually remove (1) in resourceTempate with erroneous multiple resourceURI values; (2) defaults/defaultLiteral values may have \n -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http://www.w3.org/2005/xpath-functions" xmlns="http://www.w3.org/2005/xpath-functions"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdakit="http://metadataregistry.org/uri/profile/rdakit/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" version="2.0" exclude-result-prefixes="#all">
    <!-- namespaces needed above to interact with property files from RDA Registry -->
    <xsl:output indent="yes"/>
    <!-- indent for increased human readability -->
    <xsl:strip-space elements="*"/>
    <!-- needed to handle white space so that we could traverse the sub-tree at /valueConstraint -->
    <xsl:key name="propuri" match="rdf:Description" use="@rdf:about"/>
    <!-- key to facilitate extracting values from RDA Registry property files using propertyURI in UW's profile:RDA -->
    <xsl:variable name="w" select="document('../rda/w.xml')"/>
    <xsl:variable name="e" select="document('../rda/e.xml')"/>
    <xsl:variable name="m" select="document('../rda/m.xml')"/>
    <xsl:variable name="i" select="document('../rda/i.xml')"/>
    <xsl:variable name="a" select="document('../rda/a.xml')"/>
    <xsl:variable name="n" select="document('../rda/n.xml')"/>
    <xsl:variable name="p" select="document('../rda/p.xml')"/>
    <xsl:variable name="t" select="document('../rda/t.xml')"/>
    <xsl:variable name="c" select="document('../rda/c.xml')"/>
    <!-- store all RDA Document Registry property files paths in their own varable for easy reference -->
    <!-- below: establish the output document as a json object -->
    <xsl:template match="/">
        <map xmlns="http://www.w3.org/2005/xpath-functions">
            <xsl:apply-templates select="j:map" mode="profile"/>
        </map>
    </xsl:template>
    <!-- below: establish the profile description; push source doc's description and type-in any additions; normalize-space to eliminate \n from json -->
    <xsl:template match="j:map" mode="profile">
        <xsl:for-each select="j:map">
            <map key="Profile">
                <xsl:for-each select="j:string">
                    <xsl:copy-of select=".[not(@key='schema')]"/>
                </xsl:for-each>
                <string key="schema">https://github.com/CECSpecialistI/UWLibCatProfiles/raw/master/uwSchemas/uwProfile.json</string>
                <xsl:apply-templates select="j:array[@key = 'resourceTemplates']"/>
            </map>
        </xsl:for-each>
    </xsl:template>
    <!-- below: establish the resource template description; push source doc's description and type-in any additions -->
    <xsl:template match="j:array[@key = 'resourceTemplates']">
        <array key="resourceTemplates">
            <xsl:for-each select="j:map">
                <map>
                    <xsl:copy-of select="j:string[not(@key='schema')]"/>
                    <string key="schema">https://github.com/CECSpecialistI/UWLibCatProfiles/raw/master/uwSchemas/uwResource-template.json"</string>
                    <xsl:apply-templates select="j:array[@key = 'propertyTemplates']"/>
                </map>
            </xsl:for-each>
        </array>
    </xsl:template>
    <!-- below: establish the property template description; also here is where most changes to UW's profile:RDA will be created -->
    <xsl:template match="j:array[@key = 'propertyTemplates']">
        <array key="propertyTemplates">
            <xsl:for-each select="j:map">
                <xsl:variable name="puri" select="j:string[@key = 'propertyURI']"/>
                <!-- above: store each property's propertyURI in its own variable -->
                <map>
                    <string key="propertyLabel">
                        <xsl:value-of select="normalize-space(j:string[@key='propertyLabel'])"/>
                    </string>
                    <!-- deep-copy not adequate for propertyLabel; need to enter literal result elements with values wrapped in normalize-space to eliminate \n and other possible white space control  -->
                    <xsl:copy-of select="j:string[@key='propertyURI' or @key='mandatory' or @key='repeatable'  or @key='type']"/>
                    <!-- push source doc's key/values using deep-copy -->
                    <xsl:choose>
                        <xsl:when test="j:map[@key='valueConstraint']/descendant-or-self::text()">
                            <xsl:copy-of select="j:map[@key='valueConstraint']"/>
                        </xsl:when>
                        <xsl:when test="not(j:map[@key='valueConstraint']) and j:string[@key='mandatory']"/>
                        <xsl:otherwise>
                            <map key="valueConstraint">
                                <array key="valueTemplateRefs"/>
                                <array key="useValuesFrom"/>
                                <map key="valueDataType">
                                    <string key="dataTypeURI"/>
                                </map>
                                <array key="defaults">
                                    <map>
                                        <string key="defaultURI"/>
                                    </map>
                                    <map>
                                        <string key="defaultLiteral"/>
                                    </map>
                                </array>
                            </map>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- above: allows source doc's valueConstrint block to push through if any values were entered into the source doc; otherwise output a modified block that accounts for all possibilities in the json schemas for profiles, which the source doc did not do -->
                    <xsl:copy-of select="j:string[@key='uwFormOrder' or @key='statusUw']"/>
                    <!-- above: push some source doc's key/values using deep-copy -->
                    <string key='noteUw'>
                        <xsl:value-of select="normalize-space(j:string[@key='noteUw'])"/>
                    </string>
                    <string key='qUw'>
                        <xsl:value-of select="normalize-space(j:string[@key='qUw'])"/>
                    </string>
                    <!-- deep-copy not adequate for some key/values; need to enter literal result elements with values wrapped in normalize-spac to eliminate \n and other possible white space control  -->
                    <xsl:copy-of select="j:array[@key='usedInProfile']"/>
                    <xsl:choose>
                        <xsl:when test="contains($puri, '/w/')">
                            <xsl:if test="key('propuri', $puri, $w)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $w)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/e/')">
                            <xsl:if test="key('propuri', $puri, $e)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $e)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/m/')">
                            <xsl:if test="key('propuri', $puri, $m)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $m)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/i/')">
                            <xsl:if test="key('propuri', $puri, $i)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $i)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/a/')">
                            <xsl:if test="key('propuri', $puri, $a)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $a)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/n/')">
                            <xsl:if test="key('propuri', $puri, $n)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $n)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/p/')">
                            <xsl:if test="key('propuri', $puri, $p)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $p)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/t/')">
                            <xsl:if test="key('propuri', $puri, $t)/rdakit:instructionNumber">
                                <string key="remark">
                                    <xsl:value-of
                                        select="concat('http://access.rdatoolkit.org/', key('propuri', $puri, $t)/rdakit:instructionNumber, '.html')"
                                    />
                                </string>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="contains($puri, 'bibframe')"/>
                        <xsl:when test="not($puri/text()) or not($puri)">
                            <string key="remark">Do please note that there is no propertyURI</string>
                        </xsl:when>
                        <xsl:when test="contains($puri, '/u/')"/>
                        <xsl:otherwise>
                            <string key="remark">DANGER! REMARK ANOMALY!</string>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!-- above: pull rdakit:instructionNumber from the appropriate RDA Registry file when it exists; if it does not exist, do nothing -->
                </map>
            </xsl:for-each>
        </array>
    </xsl:template>
</xsl:stylesheet>
