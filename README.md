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

The following commands validates schemas themselves and JSON instances against a schema using the [`ajv CLI library`](https://www.npmjs.com/package/ajv-cli). However, there are [many available JSON Schema validation libraries in numerous languages](https://json-schema.org/implementations.html#validators); just make sure you select one that validates JSON Schema version draft-07.

```
$ ajv validate -s schemas/profiles-array.json -d profiles/v1/all_profiles.json -r 'schemas/*.json'
$ profiles/v1/all_profiles.json invalid
  [ { keyword: 'format',
      dataPath:
       '[3].Profile.resourceTemplates[1].propertyTemplates[0].valueConstraint.valueDataType.dataTypeURI',
      schemaPath:
       '#/properties/valueConstraint/properties/valueDataType/properties/dataTypeURI/format',
      params: { format: 'uri' },
      message: 'should match format "uri"' } ]
```
