We will be moving these JSON schemas to our github pages https://ld4p.github.io/sinopia.

We decided to serve them via github pages so it would be easiest for the devs to

    have clearly versioned schemas
    persist old versions of the schemas
    be able to add new versions with a minimum of dependency on ops

The version 0.0.1 schemas have already moved;  v0.0.1 corresponds to schemas requiring the minimum of changes to get the profiles from https://github.com/lcnetdev/verso to cleanly validate with a minimum of changes.

The official place to look for version 0.0.1 JSON schemas is now
- https://ld4p.github.io/sinopia/schemas/0.0.1/profile.json
- https://ld4p.github.io/sinopia/schemas/0.0.1/resource-templates-array.json
- https://ld4p.github.io/sinopia/schemas/0.0.1/resource-template.json
- https://ld4p.github.io/sinopia/schemas/0.0.1/property-templates-array.json
- https://ld4p.github.io/sinopia/schemas/0.0.1/property-template.json
- https://ld4p.github.io/sinopia/schemas/0.0.1/profiles-array.json

Once we have a later version of schemas available in our github pages at https://ld4p.github.io/sinopia, we will remove the JSON schemas here, and change the name of this file to SCHEMAS_HAVE_MOVED.md
