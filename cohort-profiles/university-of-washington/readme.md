# UWLibCatProfiles

Profiles for RDA cataloging in Sinopia, being developed locally at the University of Washington for use in the LD4P2 project. Web views of all Sinopia profiles currently in use at UW are available [here](https://uwlib-cams.github.io/webviews/) (see "RDA-in-RDF Application Profiles").

### Naming Conventions for University of Washington Sinopia Profiles and Resource Templates

- All ID's start with `WAU`
   - Profile ID's start with `WAU:profile`
   - Resource template ID's start with `WAU:RT`
- Next is an abbreviation for the content standard or data model used primarily in the profile and resource template
   - Examples: `WAU:profile:RDA[...]`, `WAU:RT:RDA[...]`
- Next is a term or multiple terms for the contents of the profile or resource template (this can include specific RDF classes and formats of materials being described by the resource and property templates)
   - Examples: `WAU:profile:RDA:monograph`, `WAU:RT:RDA:Work:monograph`

**Note that:**
- Terms for RDF classes described in resource templates (such as "Work") are *always* capitalized.
- Terms for formats described in a profile or resource template (such as "monograph") are controlled by a local schema and are *never* capitalized.
- Profiles and resource templates also have labels. Labels should exactly mirror ID's, but with spaces in place of colons.
   - Examples: "WAU profile RDA monograph", "WAU RT RDA Work monograph"
