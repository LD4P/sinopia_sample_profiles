# XSL files
## Some notes--not a complete list
- jsonxml2monographs.xsl: Transform to generate a monographs profile (which will validate with Sinopia schemas and can be used in the Sinopia editor) from the UW RDA profile
- json2xml.xsl / xml2json.xsl: For use with jsonxml2monographs.xsl (profile must be converted to XML to be used as a source file for generation of format-specific profile(s), format-specific profile(s) generated with XSLT must be converted to JSON for use in editor)
