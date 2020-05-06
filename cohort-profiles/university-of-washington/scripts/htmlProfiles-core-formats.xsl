<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:j="http://www.w3.org/2005/xpath-functions"
  xmlns:brgh="https://github.com/briesenberg07/bmrLIS/" exclude-result-prefixes="j" version="3.0">
  <xsl:strip-space elements="*"/>

  <xsl:param name="brgh:format"/>
  <xsl:variable name="id" select="concat(':', $brgh:format)"/>

  <xsl:include href="qaSources.xsl"/>
  <xsl:include href="formatStrings.xsl"/>

  <xsl:template match="/">
    <xsl:apply-templates select="j:map/j:map[@key = 'Profile']" mode="html"/>
  </xsl:template>
  <xsl:template match="j:map/j:map[@key = 'Profile']" mode="html">
    <!-- Would there be any advantages to outputting HTML5 over XHTML? Is this possible/advisable? -->
    <html xmlns="http://www.w3.org/1999/xhtml" version="XHTML"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
      <head>
        <title>
          <xsl:value-of select="concat('RDA/RDF profile | ', $brgh:format)"/>
        </title>
        <link href="profiles.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <h1 id="profile">
          <xsl:text>University of Washington Libraries RDA/RDF Profile for </xsl:text>
          <xsl:call-template name="titleCase">
            <xsl:with-param name="format" select="$brgh:format"/>
          </xsl:call-template>
        </h1>
        <xsl:apply-templates select="." mode="profileInfo"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="j:map/j:map[@key = 'Profile']" mode="profileInfo">
    <!-- Why am I getting attr xmlns="" in table element below? -->
    <table class="profileInfo">
      <thead>
        <tr>
          <th colspan="2">
            <xsl:text>Profile: </xsl:text>
            <xsl:value-of select="j:string[@key = 'title']"/>
            <xsl:text> for </xsl:text>
            <xsl:call-template name="titleCase">
              <xsl:with-param name="format" select="$brgh:format"/>
            </xsl:call-template>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">ID</th>
          <td>
            <xsl:value-of select="concat(j:string[@key = 'id'], $id)"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Author</th>
          <td>
            <xsl:value-of select="j:string[@key = 'author']"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Last Updated</th>
          <td>
            <xsl:value-of select="format-date(current-date(), '[Y0001]-[M01]-[D01]')"/>
          </td>
        </tr>
        <tr>
          <th scope="row">Description</th>
          <td>
            <xsl:text>Resource templates and property templates for </xsl:text>
            <xsl:call-template name="lowerCase">
              <xsl:with-param name="format" select="$brgh:format"/>
            </xsl:call-template>
          </td>
        </tr>
        <tr>
          <th scope="row">Schema</th>
          <td>
            <!-- *NOTE hard coding* -->
            <a href="https://ld4p.github.io/sinopia/schemas/0.2.1/profile.json">
              <xsl:text>https://ld4p.github.io/sinopia/schemas/0.2.1/profile.json</xsl:text>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
    <!-- section element? XHTML or HTML5? Etc. Etc. -->
    <section class="rtList">
      <h2 id="rtList">
        <span>
          <xsl:text>Resource Templates for </xsl:text>
          <xsl:call-template name="titleCase">
            <xsl:with-param name="format" select="$brgh:format"/>
          </xsl:call-template>
        </span>
      </h2>
      <ul>
        <!-- WHY IS THE AGENT RT SHOWING UP IN OUTPUT PROFILES??
          Is it also showing up in output JSON? -->
        <xsl:for-each
          select="j:array[@key = 'resourceTemplates']/j:map[j:array[@key = 'propertyTemplates']/j:map/j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
          <li>
            <a href="#{translate(j:string[@key='resourceLabel'],' ','')}">
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
            </a>
          </li>
        </xsl:for-each>
      </ul>
    </section>
    <xsl:apply-templates select="j:array[@key = 'resourceTemplates']/j:map" mode="rtInfo"/>
  </xsl:template>
  <xsl:template match="j:array[@key = 'resourceTemplates']/j:map" mode="rtInfo">
    <!-- SEE COMMENT ABOVE: WHY IS THE AGENT RT COMING THROUGH? -->
    <xsl:for-each
      select=".[j:array[@key = 'propertyTemplates']/j:map/j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
      <table class="rtInfo" id="{translate(j:string[@key='resourceLabel'],' ', '')}">
        <thead>
          <tr>
            <th colspan="2">
              <xsl:text>Resource Template: </xsl:text>
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
              <xsl:text> for </xsl:text>
              <xsl:call-template name="titleCase">
                <xsl:with-param name="format" select="$brgh:format"/>
              </xsl:call-template>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">Resource IRI</th>
            <td>
              <a href="{j:string[@key='resourceURI']}">
                <xsl:value-of select="j:string[@key = 'resourceURI']"/>
              </a>
            </td>
          </tr>
          <tr>
            <th scope="row">Label</th>
            <td>
              <!-- Would like a way to remove 'WAU RT ' from labels here and elsewhere -->
              <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
            </td>
          </tr>
          <tr>
            <th scope="row">ID</th>
            <td>
              <xsl:value-of select="j:string[@key = 'id']"/>
            </td>
          </tr>
          <tr class="backlink">
            <th scope="row" colspan="2">
              <a href="#profile">
                <xsl:text>RETURN TO PROFILE TOP</xsl:text>
              </a>
            </th>
          </tr>
        </tbody>
      </table>
      <section class="ptList">
        <h3 id="{concat(translate(j:string[@key='resourceLabel'],' ',''), 'ptList')}">
          <span>
            <xsl:text>Property Templates in </xsl:text>
            <xsl:value-of select="j:string[@key = 'resourceLabel']"/>
            <xsl:text> for </xsl:text>
            <xsl:call-template name="titleCase">
              <xsl:with-param name="format" select="$brgh:format"/>
            </xsl:call-template>
          </span>
        </h3>
        <!-- TO DO: SORT BY uwFormOrder
          Is this the correct place to add xsl:sort for property templates? -->
        <ul>
          <xsl:for-each
            select="j:array[@key = 'propertyTemplates']/j:map[j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
            <xsl:sort select="j:number[@key = 'uwFormOrder']" data-type="number"/>
            <li>
              <!-- NOTE translate pattern for later use when creating prop ID values -->
              <a href="#{translate(j:string[@key='propertyLabel'],' (*)','')}">
                <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
              </a>
            </li>
          </xsl:for-each>
          <li>
            <span class="backlink">
              <a href="#{translate(j:string[@key='resourceLabel'],' ', '')}">
                <strong>
                  <xsl:text>RETURN TO RESOURCE TEMPLATE TOP</xsl:text>
                </strong>
              </a>
            </span>
          </li>
          <li>
            <span class="backlink">
              <a href="#profile">
                <strong>
                  <xsl:text>RETURN TO PROFILE TOP</xsl:text>
                </strong>
              </a>
            </span>
          </li>
        </ul>
      </section>
    </xsl:for-each>
    <xsl:apply-templates select="j:array[@key = 'propertyTemplates']/j:map" mode="ptInfo"/>
  </xsl:template>
  <xsl:template match="j:array[@key = 'propertyTemplates']/j:map" mode="ptInfo">
    <section class="ptInfo" id="{translate(j:string[@key='propertyLabel'],' (*)','')}">
      <xsl:for-each select=".[j:array[@key = 'usedInProfile']/j:string = $brgh:format]">
        <xsl:sort select="j:number[@key = 'uwFormOrder']"/>
        <!-- See translate pattern NOTE above -->
        <h4>
          <span>
            <xsl:text>Property Template: </xsl:text>
            <xsl:value-of select="j:string[@key = 'propertyLabel']"/>
          </span>
        </h4>
        <ul>
          <li>
            <xsl:text>Property IRI: </xsl:text>
            <a href="{j:string[@key='propertyURI']}">
              <xsl:value-of select="j:string[@key = 'propertyURI']"/>
            </a>
          </li>
          <!-- May want to double-check my node/child text elements tests,
            especially later when testing for content in child nodes;
            see prev. html transform -->
          <xsl:if test="j:string[@key = 'remark']/text()">
            <li>
              <xsl:text>RDA Toolkit Element Reference: </xsl:text>
              <!-- Would be a great place for a regex to get part of URL or part of label
                  and display rule number as hot text -->
              <a href="{j:string[@key='remark']}">
                <xsl:value-of select="j:string[@key = 'remark']"/>
              </a>
            </li>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="j:string[@key = 'mandatory'] = 'true'">
              <li>
                <xsl:text>Mandatory</xsl:text>
              </li>
            </xsl:when>
            <xsl:when test="j:string[@key = 'mandatory'] = 'false'">
              <li>
                <xsl:text>Optional</xsl:text>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <li>
                <xsl:text>Missing/incorrect value for 'mandatory' (!)</xsl:text>
              </li>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="j:string[@key = 'repeatable'] = 'true'">
              <li>
                <xsl:text>Repeatable</xsl:text>
              </li>
            </xsl:when>
            <xsl:when test="j:string[@key = 'repeatable'] = 'false'">
              <li>
                <xsl:text>Not repeatable</xsl:text>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <li>
                <xsl:text>Missing/incorrect value for 'repeatable' (!)</xsl:text>
              </li>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:choose>
            <xsl:when test="j:string[@key = 'type'][text()]">
              <li>
                <xsl:text>Property type: </xsl:text>
                <!-- NOTE that there are new property types in Sinopia schema v0.2.1!
                  Ideally capitalize property type value (regex?) -->
                <xsl:value-of select="j:string[@key = 'type']"/>
              </li>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>Missing/incorrect value for 'propertyType' (!)</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="j:map[@key = 'valueConstraint']/descendant-or-self::text()">
            <li>
              <xsl:text>Value Constraint(s):</xsl:text>
              <ul>
                <xsl:apply-templates select="j:map[@key = 'valueConstraint']" mode="valCons"/>
              </ul>
            </li>
          </xsl:if>
          <li>
            <span class="backlink">
              <a href="#{concat(translate(../../j:string[@key='resourceLabel'],' ',''), 'ptList')}">
                <xsl:text>RETURN TO PROPERTY LIST FOR </xsl:text>
                <xsl:value-of select="../../j:string[@key = 'resourceLabel']"/>
                <xsl:text> </xsl:text>
                <xsl:call-template name="titleCase">
                  <xsl:with-param name="format" select="$brgh:format"/>
                </xsl:call-template>
              </a>
            </span>
          </li>
          <li>
            <span class="backlink">
              <a href="#rtList">
                <xsl:text>RETURN TO RESOURCE TEMPLATE LIST</xsl:text>
              </a>
            </span>
          </li>
        </ul>
      </xsl:for-each>
    </section>
  </xsl:template>
  <xsl:template match="j:map[@key = 'valueConstraint']" mode="valCons">
    <!-- In theory, there may be more than one value for the valueTemplateRefs key.
      UW Profiles only ever have one, thus:
      1) lack of a for-each for valueTemplateRefs
      2) Hard-coding of the adminMetadata profile link -->
    <xsl:if test="j:array[@key = 'valueTemplateRefs']/j:string/text()">
      <li>
        <!-- NOTE *hard coding* -->
        <xsl:text>Resource Template for Value(s): </xsl:text>
        <a
          href="{concat('https://www.lib.washington.edu/static/public/cams/profiles/WAU.profile.RDA.adminMetadata.html#',translate(j:array[@key='valueTemplateRefs']/j:string,':',''))}">
          <xsl:value-of select="j:array[@key = 'valueTemplateRefs']/j:string"/>
        </a>
      </li>
    </xsl:if>
    <xsl:if test="j:array[@key = 'useValuesFrom']/j:string/text()">
      <li>
        <xsl:text>Value Lookup Source(s):</xsl:text>
        <ul>
          <xsl:for-each select="j:array[@key = 'useValuesFrom']/j:string/text()">
            <li>
              <xsl:call-template name="qaLinks">
                <xsl:with-param name="node" select="."/>
              </xsl:call-template>
            </li>
          </xsl:for-each>
        </ul>
      </li>
    </xsl:if>
    <!-- Coding for valueDataType > dataTypeURI is based on assumption of max 1 value.
      Does this match Sinopia schema requirements? -->
    <xsl:if test="j:map[@key = 'valueDataType']/j:string[@key = 'dataTypeURI']/text()">
      <li>
        <xsl:text>Value Datatype: </xsl:text>
        <a href="{j:map[@key = 'valueDataType']/j:string[@key = 'dataTypeURI']}">
          <xsl:value-of select="j:map[@key = 'valueDataType']/j:string[@key = 'dataTypeURI']"/>
        </a>
      </li>
    </xsl:if>
    <xsl:if
      test="j:array[@key = 'defaults']/j:map/j:string[@key = 'defaultLiteral' or 'defaultURI']/text()">
      <li>
        <xsl:text>Default Values:</xsl:text>
        <ul>
          <xsl:for-each
            select="j:array[@key = 'defaults']/j:map/j:string[@key = 'defaultLiteral']/text()">
            <li>
              <xsl:text>Default Literal: </xsl:text>
              <xsl:value-of select="."/>
            </li>
          </xsl:for-each>
          <xsl:for-each
            select="j:array[@key = 'defaults']/j:map/j:string[@key = 'defaultURI']/text()">
            <li>
              <xsl:text>Default IRI: </xsl:text>
              <a href="{.}">
                <xsl:value-of select="."/>
              </a>
            </li>
          </xsl:for-each>
        </ul>
      </li>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
