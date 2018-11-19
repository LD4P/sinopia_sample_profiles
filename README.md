# Sinopia Sample Profiles & Templates

This repository contains sample profiles and repository templates for use with the Library of Congress BIBFRAME Editor (and derived codebases). These are the specifications that guide input form generation in those editors, and maps the form field values to RDF statements (or vice versa).

Profiles generally are combinations of resource templates with some additional metadata included.

## Definitions

Profiles:


Resource Templates:


## Data Included Here

```
.
├── LICENSE
├── README.md
├── schemas
│   └── profile-schema.json
│   └── resource-template-schema.jso
├── resource-templates
│   └── v1
│       ├── all_resource-templates.json
│       └──
├── profiles
│   └── v1
│       ├── all_profiles.json
│       └──
└── bfe-verso-profiles
    ├── profiles
    ├── derived-resource-templates
```

### Schemas

### Resource Templates

### Profiles

### BFE Verso Profiles

## Validating JSON

The following commands validates schemas themselves and JSON instances against a schema using the [`ajv CLI library`](https://www.npmjs.com/package/ajv-cli). However, there are [many available JSON Schema validation libraries in numerous languages](https://json-schema.org/implementations.html#validators); just make sure you select one that validates JSON Schema version draft-07.

```
$ 
```
