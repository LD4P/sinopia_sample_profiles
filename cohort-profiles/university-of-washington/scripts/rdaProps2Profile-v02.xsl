<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdakit="http://metadataregistry.org/uri/profile/rdakit/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:j="http://www.w3.org/2005/xpath-functions"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.0">
    <xsl:output indent="yes"/>
    <xsl:key name="labels" match="rdf:Description" use="@rdf:about"/>
    <xsl:variable name="e" select="document('../rda/e.xml')"/>
    <xsl:variable name="m" select="document('../rda/m.xml')"/>
    <xsl:variable name="i" select="document('../rda/i.xml')"/>
    <xsl:variable name="a" select="document('../rda/a.xml')"/>
    <xsl:variable name="n" select="document('../rda/n.xml')"/>
    <xsl:variable name="p" select="document('../rda/p.xml')"/>
    <xsl:variable name="t" select="document('../rda/t.xml')"/>
    <xsl:variable name="c" select="document('../rda/c.xml')"/>
    <xsl:template match="/">
        <j:map>
            <j:map key="Profile">
                <xsl:apply-templates select="rdf:RDF"/>
            </j:map>
        </j:map>
    </xsl:template>
    <xsl:template match="rdf:RDF">
        <j:string key="title">RDA</j:string>
        <j:string key="id">profile:rda</j:string>
        <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
        <j:string key="date">2019-04-16</j:string>
        <j:string key="description">RDA Work, Expression, Manifestation, Item, Agent, Nomen, Place,
            Timespan</j:string>
        <j:string key="schema">https://ld4p.github.io/sinopia/schemas/0.1.0/profile.json</j:string>
        <j:array key="resourceTemplates">
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values(//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Work</j:string>
                <j:string key="id">rt:rda:work</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($e//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Expression</j:string>
                <j:string key="id">rt:rda:expression</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$e/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($m//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Manifestation</j:string>
                <j:string key="id">rt:rda:manifestation</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$m/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($i//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Item</j:string>
                <j:string key="id">rt:rda:item</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$i/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($a//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Agent</j:string>
                <j:string key="id">rt:rda:agent</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$a/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($n//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Nomen</j:string>
                <j:string key="id">rt:rda:nomen</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$n/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($p//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Place</j:string>
                <j:string key="id">rt:rda:place</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$p/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
            <j:map>
                <j:string key="resourceURI">
                    <xsl:value-of select="distinct-values($t//rdfs:domain/@rdf:resource)"/>
                </j:string>
                <j:string key="resourceLabel">RT RDA Timespan</j:string>
                <j:string key="id">rt:rda:timespan</j:string>
                <j:string key="date">2019-04-16</j:string>
                <j:string key="author">Crystal Clements (cec23@uw.edu)</j:string>
                <j:string key="schema"
                    >https://ld4p.github.io/sinopia/schemas/0.1.0/resource-template.json</j:string>
                <j:array key="propertyTemplates">
                    <xsl:apply-templates select="$t/rdf:RDF/rdf:Description"/>
                </j:array>
            </j:map>
        </j:array>
    </xsl:template>
    <xsl:template match="rdf:Description">
        <xsl:if test="reg:status/@rdf:resource != 'http://metadataregistry.org/uri/RegStatus/1008'">
            <j:map>
                <j:string key="propertyLabel">
                    <xsl:choose>
                        <xsl:when test="rdakit:instructionNumber">
                            <xsl:value-of
                                select="concat(rdfs:label[@xml:lang = 'en'], ' (RDA ', rdakit:instructionNumber, ')')"
                            />
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="rdfs:label[@xml:lang = 'en']"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </j:string>
                <j:string key="propertyURI">
                    <xsl:value-of select="@rdf:about"/>
                </j:string>
                <j:string key="mandatory"/>
                <j:string key="repeatable"/>
                <j:string key="type"/>
                <j:map key="valueConstraint">
                    <j:array key="useValuesFrom"/>
                    <j:map key="valueDataType">
                        <j:string key="dataTypeURI"/>
                    </j:map>
                    <j:array key="defaults">
                            <j:map>
                                <j:string key="defaultURI"/>
                                <j:string key="defaultLiteral"/>
                            </j:map>
                        </j:array>
                </j:map>
                <j:string key="uwFormOrder"/>
                <j:string key="statusUw"/>
                <j:string key="noteUw"/>
                <j:string key="qUw"/>
                <j:array key="usedInProfile"/>
            </j:map>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
