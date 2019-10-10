# Some notes on XSL scripts
- **jsonxml2formats.xsl**  
  - Generating format-specific profiles from the UW RDA profile (validate format-specific profiles with Sinopia, not UW, schema)
- **json2xml.xsl** / **xml2json.xsl**:
   - For use in workflow to create format-specific profiles (more details in the draft documentation **[here](https://docs.google.com/document/d/1cY1MSnXYlY8UqpLQ6pH3TPxpFkR-bvYQxSD3rrlpcDo/edit?usp=sharing)**)
   - UW RDA profile converted to XML for generation of format-specific profile(s), and...
   - Format-specific profile(s) output from XSLT must be converted to JSON for use in Sinopia environment
   - Conversion using `json-to-xml` and `xml-to-json` functions defined in the [XQuery, XPath, and XSLT Functions and Operators Namespace Document](https://www.w3.org/2005/xpath-functions/)
