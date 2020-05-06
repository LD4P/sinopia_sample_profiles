<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:j="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="j" version="3.0">
    
    <!-- This stylesheet could use proofreading:
        * Do all authority references given accurately represent what is being queried (usually in a cache) based on URN?
            See https://github.com/LD4P/sinopia_editor/blob/master/static/authorityConfig.json
        * Where available, subauthorities from the QA site > Authorities page should be used for the text following the anchor; as these provide the most specific info about what is being queried 
        * Does hot text match authority labels?
        * Are authority labels consistent (LC vs. LoC, etc.)
        ADDITIONAL NOTE:
        * What about the lookups that use a URL rather than a URN. Should we now be using a different property "type" value for these
            (This last is not a stylesheet issue but a profile issue) -->
    
    <xsl:variable name="viaQaText">
        <xsl:text> via the </xsl:text>
        <a href="https://lookup.ld4l.org/">
            <xsl:text>LD4P Authority Lookup Service</xsl:text>
        </a>
        <xsl:text> > </xsl:text>
        <a href="https://lookup.ld4l.org/authority_list">
            <xsl:text>Authorities</xsl:text>
        </a>
        <xsl:text> (cached) > </xsl:text>
    </xsl:variable>
    
    <!-- Previously, in the template below, the test attribute used ".", not $node.
        Why did it work?? -->
    
    <xsl:template name="qaLinks">
        <xsl:param name="node"/>
        <xsl:choose>
            <xsl:when test="$node = 'urn:ld4p:qa:names'">
                <a href="http://id.loc.gov/authorities/names.html">
                    <xsl:text>LC Name Authority File (all names)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locnames_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:names:person'">
                <a href="http://id.loc.gov/authorities/names.html">
                    <xsl:text>LC Name Authority File (persons / RWO IRIs)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locnames_rwo_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:names:organization'">
                <a href="http://id.loc.gov/authorities/names.html">
                    <xsl:text>LC Name Authority File (organizations / RWO IRIs)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locnames_rwo_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:sinopia'">
                <xsl:text>Sinopia resources</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:genres'">
                <a href="http://id.loc.gov/authorities/genreForms.html">
                    <xsl:text>LC Genre/Form Terms</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locgenres_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:gettyaat'">
                <a href="https://www.getty.edu/research/tools/vocabularies/aat/index.html">
                    <xsl:text>Getty Art &amp; Architecture Thesaurus</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>getty_aat_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:subjects'">
                <a href="http://id.loc.gov/authorities/subjects.html">
                    <xsl:text>LC Subject Headings (all)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locsubjects_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:demographics'">
                <a href="http://id.loc.gov/authorities/demographicTerms.html">
                    <xsl:text>LC Demographic Group Terms</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locdemographics_ld4l_cache</xsl:text>
            </xsl:when>
            <!-- *C1* A lookup *not* through QA = dropdown menu? -->
            <xsl:when test="$node = 'https://www.rdaregistry.info/termList/RDAColourContent/'">
                <a href="https://www.rdaregistry.info/termList/RDAColourContent/">
                    <xsl:text>RDA Colour Content</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:names:geographic'">
                <a href="http://id.loc.gov/authorities/names.html">
                    <xsl:text>LC Name Authority File (geographic)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locnames_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:dbpedia'">
                <a href="https://wiki.dbpedia.org/">
                    <xsl:text>DBpedia</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>dbpedia_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:isni'">
                <a href="http://www.isni.org/">
                    <xsl:text>ISNI</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>isni_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:fast:work'">
                <a href="https://www.oclc.org/research/areas/data-science/fast.html">
                    <xsl:text>OCLC FAST (Faceted Application of Subject Terminology)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>oclcfast_ld4l_cache</xsl:text>
            </xsl:when>
            <!-- *C2* / UNCLEAR ON WHAT EXACTLY GETS SEARCHED: WIKIDATA OR WIKIDATA_DIRECT?? -->
            <xsl:when test="$node = 'urn:wikidata'">
                <a href="https://www.wikidata.org/wiki/Wikidata:Main_Page">
                    <xsl:text>Wikidata</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:mesh:subject'">
                <a href="https://www.nlm.nih.gov/mesh/meshhome.html">
                    <xsl:text>National Library of Medicine Medical Subject Headings (MeSH)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>mesh_nlm_ld4l_cache</xsl:text>
            </xsl:when>
            <!-- See *C1* -->
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/millus'">
                <a href="http://id.loc.gov/vocabulary/millus.html">
                    <xsl:text>MARC Illustrative Content List (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <!-- See *C1* -->
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/languages'">
                <a href="https://id.loc.gov/vocabulary/languages">
                    <xsl:text>MARC List for Languages (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:scale_designation'">
                <a href="http://www.rdaregistry.info/termList/scale/">
                    <xsl:text>RDA Scale Designation</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>scale_designation</xsl:text>
            </xsl:when>
            <!-- See *Q1* -->
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/mrelief'">
                <a href="https://id.loc.gov/vocabulary/mrelief">
                    <xsl:text>Relief (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:colour_content'">
                <a href="https://www.rdaregistry.info/termList/RDAColourContent/">
                    <xsl:text>RDA Colour Content</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>colour_content</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:form_of_tactile_notation'">
                <a href="http://www.rdaregistry.info/termList/TacNotation/">
                    <xsl:text>RDA Form of Tactile Notation</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>form_of_tactile_notation</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:content_type'">
                <a href="http://www.rdaregistry.info/termList/RDAContentType/">
                    <xsl:text>RDA Content Type</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>content_type</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/mprojection'">
                <a href="https://id.loc.gov/vocabulary/mprojection">
                    <xsl:text>Projection (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:aspect_ratio'">
                <a href="http://www.rdaregistry.info/termList/AspectRatio/">
                    <xsl:text>RDA Aspect Ratio Designation</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>aspect_ratio</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:performance'">
                <a href="http://id.loc.gov/authorities/performanceMediums.html">
                    <xsl:text>Library of Congress Medium of Performance Thesaurus for Music</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>locperformance_ld4l_cache</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:material'">
                <a href="http://www.rdaregistry.info/termList/RDAMaterial/">
                    <xsl:text>RDA Material</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>material</xsl:text>
            </xsl:when>
            <!-- *C1* -->
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/mgroove'">
                <a href="https://id.loc.gov/vocabulary/mgroove">
                    <xsl:text>MARC Groove Width/Pitch/CuttingList (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:font_size'">
                <a href="http://www.rdaregistry.info/termList/fontSize/">
                    <xsl:text>RDA Font Size</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>font_size</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:bibliographic_format'">
                <a href="http://www.rdaregistry.info/termList/bookFormat/">
                    <xsl:text>RDA Bibliographic Format</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>bibliographic_format</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:file_type'">
                <a href="http://www.rdaregistry.info/termList/fileType/">
                    <xsl:text>RDA File Type</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>file_type</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:type_of_recording'">
                <a href="http://www.rdaregistry.info/termList/typeRec/">
                    <xsl:text>RDA Type of Recording</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>type_of_recording</xsl:text>
            </xsl:when>
            <xsl:when test=". = 'urn:ld4p:qa:rda_registry_ld4l_cache:generation'">
                <a href="http://www.rdaregistry.info/termList/RDAGeneration/">
                    <xsl:text>RDA Generation</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>generation</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:groove_pitch'">
                <a href="http://www.rdaregistry.info/termList/groovePitch/">
                    <xsl:text>RDA Groove Pitch of an Analog Cylinder</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>groove_pitch</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:groove_width'">
                <a href="http://www.rdaregistry.info/termList/grooveWidth/">
                    <xsl:text>RDA Groove Width of an Analog Disc</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>groove_width</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:production_method'">
                <a href="http://www.rdaregistry.info/termList/RDAproductionMethod/">
                    <xsl:text>RDA Production Method</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>production_method</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:carrier_type'">
                <a href="http://www.rdaregistry.info/termList/RDACarrierType/">
                    <xsl:text>RDA Carrier Type</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>carrier_type</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:mode_of_issuance'">
                <a href="http://www.rdaregistry.info/termList/ModeIssue/">
                    <xsl:text>RDA Mode of Issuance</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>mode_of_issuance</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:media_type'">
                <a href="http://www.rdaregistry.info/termList/RDAMediaType/">
                    <xsl:text>RDA Media Type</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>media_type</xsl:text>
            </xsl:when>
            <!-- *C1* -->
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/mmaterial'">
                <a href="https://id.loc.gov/vocabulary/mmaterial">
                    <xsl:text>MARC Support Material List (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:gettyaat:Materials'">
                <a href="https://www.getty.edu/research/tools/vocabularies/aat/index.html">
                    <xsl:text>Getty Art &amp; Architecture Thesaurus (materials)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>Materials</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:config_playback_channels'">
                <a href="http://www.rdaregistry.info/termList/configPlayback/">
                    <xsl:text>RDA Configuration of Playback Channels</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>config_playback_channels</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:polarity'">
                <a href="http://www.rdaregistry.info/termList/RDAPolarity/">
                    <xsl:text>RDA Polarity</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>polarity</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:presentation_format'">
                <a href="http://www.rdaregistry.info/termList/presFormat/">
                    <xsl:text>RDA Presentation Format</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>presentation_format</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:names:family'">
                <a href="http://id.loc.gov/authorities/names.html">
                    <xsl:text>LC Name Authority File (families)</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>family</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:regional_encoding'">
                <a href="http://www.rdaregistry.info/termList/RDARegionalEncoding/">
                    <xsl:text>RDA Regional Encoding</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>regional_encoding</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:recording_medium'">
                <a href="https://www.rdaregistry.info/termList/recMedium/">
                    <xsl:text>RDA Recording Medium</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>recording_medium</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:track_config'">
                <a href="http://www.rdaregistry.info/termList/trackConfig/">
                    <xsl:text>RDA Track Configuration</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>track_config</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:special_playback'">
                <a href="http://www.rdaregistry.info/termList/specPlayback/">
                    <xsl:text>RDA Special Playback Characteristic</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>special_playback</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:broadcast_standard'">
                <a href="http://www.rdaregistry.info/termList/broadcastStand/">
                    <xsl:text>RDA Broadcast Standard</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>broadcast_standard</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:layout'">
                <a href="http://www.rdaregistry.info/termList/layout/">
                    <xsl:text>RDA Layout</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>layout</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'urn:ld4p:qa:rda_registry_ld4l_cache:video_format'">
                <a href="http://www.rdaregistry.info/termList/videoFormat/">
                    <xsl:text>RDA Video Format</xsl:text>
                </a>
                <xsl:copy-of select="$viaQaText"/>
                <xsl:text>video_format</xsl:text>
            </xsl:when>
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/menclvl'">
                <a href="https://id.loc.gov/vocabulary/menclvl">
                    <xsl:text>MARC Encoding Level List (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/descriptionConventions'">
                <a href="https://id.loc.gov/vocabulary/descriptionConventions">
                    <xsl:text>Description Conventions (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:when test="$node = 'https://id.loc.gov/vocabulary/marcauthen'">
                <a href="https://id.loc.gov/vocabulary/marcauthen">
                    <xsl:text>MARC Authentication Action (LC Linked Data Service)</xsl:text>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <strong>
                    <xsl:text>Unknown Lookup URN (!)</xsl:text>
                </strong>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
