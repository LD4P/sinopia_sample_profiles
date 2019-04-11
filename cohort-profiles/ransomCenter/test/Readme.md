 # Ransom Center test profiles

This directory includes HRC profiles created for testing purposes. 

Files that include the sufix **-spe** are fresh from the Sinopia Profile editor.
Files that include the sufix **_v0.1.0** have been validated against the JSON schemas v0.1.0.

### Atom pakages installed

The Sinopia Profile Editor exports not formated JSON files, which makes it hard to review on a text editor.

>*Installed the atom package **pretty-json** (https://atom.io/packages/pretty-json) in order to format and index the json file that the SPE exports. It makes easier navigate and doublecheck the profile in Atom.*

### Validating a profile in Command Promp using the Sinopia JSON schemasand AJV (Windows)

**AJV** (Another JSON Schema Validator) requires **Node.js** , so that would be the first step. 

1. Installed **Node.js** (https://nodejs.org/en/)

2. Installed **AJV** (https://ajv.js.org/) using command promp

>`npm install -g ajv-cli`

3. Downloaded the **Sinopia JSON schemas v0.1.0** (https://ld4p.github.io/sinopia/schemas) to a local folder

4. In command promp typed

>`ajv validate -s [local_schemas_direcotry_path]/profile -r '[local_schemas_direcotry_path]/*.json' -d "[local_profiles_direcotry_path]/*.json"`

>*Parameter -s indicates the JSON-schema to validate against (only takes one schema!)*  
>*Parameter -r indicates all the referenced schemas (which would be the rest of the Sinopia JSON-schemas v0.1.0 downloaded to a local directory)*  
>*Parameter -d indicates the JSON profiles (it takes multiple files, so the wild card will allow to validate all the profiles in the given folder*  
