# Ransom Center test profiles

This directory includes HRC profiles created for testing purposes. 

>Files that include the sufix **_v0.1.0** have been validated against the JSON schemas v0.1.0.


#### HRC ARM Monograph Binding test
*High level JSON profile test for the ARM Binding model. Some of the RTs included here should probably defined outside of this profile on its own.*

#### HRC ARM Monograph Custodial History test
*High level JSON profile test for the ARM Custodial History model. It doesn't include price, accession number, aggregate custodial events or precedence relationships.*

Standing questions:

1. Modeling of custodial event type using the *rdf:type* property. Should the value of this property be a Custodial Event subclass (https://ld4p.github.io/arm/custodial_history/ontology/0.1/custodial_history.html#CustodialEvent) and how to enforce it in the profile. Can a subclass be used as a scheme for a property value?

2. arm:atLocation vs. bf:place. Seems the discussion is closed (https://github.com/LD4P/arm/issues/48), but not sure about the difference.

3. Activity subclasses. Does the sinopia RT Agents Contribution (https://github.com/LD4P/sinopia_sample_profiles/blob/master/profiles/v0.1.0/BIBFRAME%202.0%20Agents%20Contribution.json) work in this context? 

4. Does it make sense to have a Custodial History RT that calls to a Custodial Event RT, or should this just include the Custodial Event RT as the starting point?

#### HRC ARM Bound-with test
*High level JSON profile for the ARM bound-with model. It doesn't include table of contents.*

Standing questions:

1. Is this the right way of linking to the item? Should an RT for bound-with item be created within this profile to include precedes and follows properties, and how would that link to the more generic item RT?

#### HRC ARM citation test
*High level JSON profile for the ARM citation model following the USE CASE 2 (Citation located, cataloger adds commentary on citation)*

Standing questions:

1. What is "bib:" namespace for? Is this Bilbiotek-o?
2. In the basic citation model, the ex:citation -- hasSource -- ex:source. Should the object be a Source, and if so, is there a modeling for source documented somewhere? Is bf:Source appropriate in this case?
3. In the located citation model, if Citation is subject of a statement and hasSource is the predicate, what if the object? Not clear on the diagram what the empty dottend line circles mean? However, they seem to be the subject of antoher statement. The HRC test example attempts to reflect  that modeling (relatinship between citation source, entry and page..) but it doesn't look too good
4. In the located citation model, when linking a Citation to an instance via dcterms:isPartOf, how would be the recomendation to link directly to the instance (e.g a record on worldcat or Share-vde) instead of a literal?
5. The class Volume doesn't exist in the ARM Core Ontology (while Entry and Page do). Is there a suggested ontology for Volume?

# Tips and tricks

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

`ajv validate -s [schemas_folder]/profile -r "[schemas_folder]/*.json" -d "[profiles_folder]/*.json"`



>`-s` --- indicates the JSON-schema to validate against (only takes one schema!).
>
>`-r` --- indicates all the referenced schemas (which would be the rest of the Sinopia JSON-schemas v0.1.0 downloaded to a local directory).
>
>`-d` --- indicates the JSON profiles (it takes multiple files, so the wild card will allow to validate all the profiles in the given folder). 


