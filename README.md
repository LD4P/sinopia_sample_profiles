# Sinopia Sample Profiles & Templates

This repository contains sample profiles and repository templates for use with the Library of Congress BIBFRAME Editor (and derived codebases including Sinopia). These are the specifications that guide input form generation in those editors, and maps the form field values to RDF statements (or vice versa).

Profiles generally are combinations of resource templates with some additional metadata included. For the sake of this repository, we make the following assumptions:

- Profiles are used primarily / only by the LC Profile Editor to group a set of Resource Templates for editing;
- The LC BFE and Sinopia Editor load at the Resource Template level for generating RDF resource editing forms;
- Thus, a Profile is a collection of Resource Templates (referenced via their identifiers) and some additional metadata, and each Profile has its own identifier;
- A Resource Template is a collection of Property Templates (that guide assertions about the same implied Resource or Entity) and some additional metadata, and each Resource Template has its own identifier;
- And Property Templates are embedded / nested hashes within a Resource Template.

## Data Included Here

```
.
├── LICENSE
├── README.md
├── schemas
│   └── profile-schema.json : Validates a Profile (captured as a JSON document)
│   └── profiles-array.json : Validates an array of Profiles
│   └── property-template.json : Validates a Property Template embedded in a Resource Template
│   └── property-templates-array.json : Validates an array of Property Templates embedded in a Resource Template
│   └── resource-template.json : Validates a Resource Template
│   └── resource-templates-array.json : Validates an array of Resource Templates
├── resourceTemplates ;
│   └── v1
│       ├── all_resource_templates.json : All resource templates derived from LC Verso, updated to validate for Sinopia
├── profiles
│   └── v1
│       ├── all_profiles.json : All profiles derived from LC Verso, updated to validate for Sinopia
└── bfe-verso-profiles
    ├── profiles : All profiles as captured in LC Verso, both as a single JSON document and broken apart into separate JSON documents
    ├── derived-resource-templates : Resource Templates derived from the profiles above from LC Verso
```

## Validating JSON

### JSON schemas

#### For Sinopia Profiles

In `schemas` there is currently a set of JSON schema files that are under construction.
- these will soon live at https://ld4p.github.io/sinopia/schemas (and will be removed from here, with a README note)
- source will be in git repo at https://github.com/LD4P/sinopia, in the `schemas` directory.

These are under construction because we have to coordinate changes to resource templates in addition to the schemas, but we wanted to wire up validation for existing BFE Verso Profiles first.  Basically, we want to build the plumbing before we upgrade the faucets.

#### For BFE Verso Profiles

In `bfe-verso-profiles/schemas` there is a set of JSON schema files that
- are themselves valid
- can be used to validate everything in `bfe-verso-profiles/profiles` _except_ for `all_profiles.json`.  

### Example ajv validation commands

The following commands validate use the [`ajv CLI library`](https://www.npmjs.com/package/ajv-cli) for JSON schema validation. However, there are [many available JSON Schema validation libraries in numerous languages](https://json-schema.org/implementations.html#validators); just make sure you select one that validates JSON Schema version draft-07.

#### Validate schema itself

```
$ ajv compile -s bfe-verso-profiles/schemas/property-template

schema bfe-verso-profiles/schemas/property-template is valid
```

```
$ ajv compile -s bfe-verso-profiles/schemas/profile

schema bfe-verso-profiles/schemas/profile is invalid
error: can't resolve reference resource-templates-array from id profile#
```

#### Validate JSON instance against schema(s)

##### Validate a single file

```
$ ajv validate -s schemas/profiles-array.json -r 'schemas/*.json' -d profiles/v1/all_profiles.json

profiles/v1/all_profiles.json invalid
  [ { keyword: 'format',
      dataPath:
       '[3].Profile.resourceTemplates[1].propertyTemplates[0].valueConstraint.valueDataType.dataTypeURI',
      schemaPath:
       '#/properties/valueConstraint/properties/valueDataType/properties/dataTypeURI/format',
      params: { format: 'uri' },
      message: 'should match format "uri"' } ]
```

```
$ ajv validate -s bfe-verso-profiles/schemas/profile -r 'bfe-verso-profiles/schemas/*.json' -d "bfe-verso-profiles/profiles/BIBFRAME 2.0 Place.json"

bfe-verso-profiles/profiles/BIBFRAME 2.0 Place.json valid
```

##### Validate all files in a folder

```
$ ajv validate -s bfe-verso-profiles/schemas/profile -r 'bfe-verso-profiles/schemas/*.json' -d "bfe-verso-profiles/profiles/*.json"

bfe-verso-profiles/profiles/all_profiles.json invalid
[ { keyword: 'type',
    dataPath: '',
    schemaPath: '#/type',
    params: { type: 'object' },
    message: 'should be object' } ]
bfe-verso-profiles/profiles/BIBFRAME 2.0 Admin Metadata.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Agents Contribution.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Agents Primary Contribution.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Agents.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Cartographic.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 DDC.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Edition Information.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Extra menus.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Form.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 IBC.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Identifiers.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Item.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Language.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 LCC.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Load.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Monograph.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Moving Image-35mm Feature Film.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Moving Image-BluRay DVD.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Notated Music.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Note.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Place.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Prints and Photographs.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Publication, Distribution, Manufacturer Activity.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Rare Materials.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Related Works and Expressions.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 RWO.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Serial.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Series Information.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Sound Recording-Analog.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Sound Recording-Audio CD-R.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Sound Recording-Audio CD.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Title Information.json valid
bfe-verso-profiles/profiles/BIBFRAME 2.0 Topic.json valid
bfe-verso-profiles/profiles/PMO Medium of Performance.json valid
```
