<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    
    <!-- still to do:
           1. output WAU.profile.RDA.json.xml using this xslt -->
    
    <!-- general statement:
             This transform is an XSLT3 pipeline.
             This transform is to produce all format-specific profiles at the same time.
             The profiles will be saved in the xml/ directory.
             The input json data is taken from github. 
                 This can be changed by changing information in the source-node parameter of fn:transform.
             To produce selected format-specific profiles: edit the @select of the xsl:for-each.
                 Be sure to save the edited file using "Save As."
             Each format-specific json profile should be manually validated and indented before pushing to Github.
             Attempts should be made to keep the result-documents (xml and json) in sync.
    -->
    
    <xsl:template match="/">
    <!-- create template for all processes; matchong is meaningless; oXygen transform scenario can input this .xsl -->
        <xsl:for-each select="('adminMetadata', 'dvdVideo', 'eBook', 'eGraphic', 'eMap', 'eSerial', 'etd', 'graphic', 'map', 'monograph', 'serial', 'soundRecording')">
        <!-- wrap everything in a for each; select each format as a string -->
            <xsl:variable name="fmat" select="."/>
            <!-- assign each context string to the var $fmat -->
            <xsl:variable name="create-json.xml-profile">
            <!-- create a var where the RDA profile is transformed into xml -->
                <!-- below: sequence instruction to store format-specific profiles in var $create-json.xml-profile  -->
                <xsl:sequence
                    select="let $t := transform(
            map{
            'stylesheet-location': 'formatSpecificProfiles-core.xsl',
            'source-node': unparsed-text('../WAU.profile.RDA.json') =>
            json-to-xml(),
            'stylesheet-params': map{
            QName('http://theo-namespace.edu','format') : $fmat
            }
            })
            return $t?output"
                />
            <!-- What's done in the sequence:
                 (1) use fn:transform()
                 (2) fn:transform retuens a map; store it in var $t
                 (3) create a map to input the fn:transform() options
                 (4) the fn:transform() option are 
                    (a) stylesheet location = path to a .xsl file
                    (b) source node = document node for the xml we'll transform
                    (c) stylesheet params = parameters used in .xsl entered as stylesheet-location value
                 (5) source node value is the value of two functions
                    (a) feeding a the large RDA profile json file to unparsed-text()
                    (b) feeding the text-string result of unparsed-text() to json-to-xml()
                 (6) given that the source node is now an XML version of the RDA profile
                    (a) invoke the transform that produces format-specific profiles
                 (7) that stylesheet needs a single param with the value entered as a map
                    (a) key must be the name of the param entered as a QName using the QName function
                    (b) the value will be the context string stored in the original for-each instruction
                 (8) fn:transform returns a map stored in $t
                 (9) the xml result document of the transform is the value of the key 'output'
                 (10) access the xml result using $t?output
            -->
            </xsl:variable>
            <!-- result document 1 stores the xml version of the format-specific profile:
                     note the $fmat var, the value of the context string established by the original for-each instruction-->
            <xsl:result-document href="../xml/WAU.profile.RDA.{$fmat}.xml">
                <xsl:sequence select="$create-json.xml-profile"/>
            </xsl:result-document>
            <!-- result document 2 stores the json version of the format-specific profile:
                     note the $fmat var, the value of the context string established by the original for-each instruction.
                     also note the absence of the format=indent option inside xml-to-json:
                         the formatting retained all escaping; use oXygen indent-->
            <xsl:result-document href="../WAU.profile.RDA.{$fmat}.json"
                omit-xml-declaration="yes">
                <xsl:sequence select="xml-to-json($create-json.xml-profile)"/>
            </xsl:result-document>
            <!-- all result documents should be manually validated, and the json should be indented using oXygen-->
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
