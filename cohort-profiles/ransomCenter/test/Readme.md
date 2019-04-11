# Ransom Center test profiles

This directory includes HRC profiles created for testing purposes. 

>Files that include the sufix **-spe** are fresh from the Sinopia Profile editor.  
>Files that include the sufix **_v0.1.0** have been validated against the JSON schemas v0.1.0.



### Atom packages installed

**Pretty-json** (https://atom.io/packages/pretty-json)  
The Sinopia Profile Editor exports not formated JSON files, which makes it hard to review on a text editor. This package allows to format the json file when opening it with Atom.


### Validating a profile in Command Promp using the Sinopia JSON schemasand AJV (Windows)

**AJV** (Another JSON Schema Validator) requires **Node.js** , so that would be the first step. 

1. Installed **Node.js** (https://nodejs.org/en/)

2. Installed **AJV** (https://ajv.js.org/) using command promp

`npm install -g ajv-cli`



3. Downloaded the **Sinopia JSON schemas v0.1.0** (https://ld4p.github.io/sinopia/schemas) to a local folder

4. In command promp typed:

`ajv validate -s [schemas_folder]/profile -r '[schemas_folder]/*.json' -d "[profiles_folder]/*.json"`



>`-s` --- indicates the JSON-schema to validate against (only takes one schema!).
>
>`-r` --- indicates all the referenced schemas (which would be the rest of the Sinopia JSON-schemas v0.1.0 downloaded to a local directory).
>
>`-d` --- indicates the JSON profiles (it takes multiple files, so the wild card will allow to validate all the profiles in the given folder). 


