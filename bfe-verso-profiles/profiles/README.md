# Sinopia Sample Data from verso
This directory and sub-directories contain JSON Profiles and the language RDF XML
from the Library of Congress [Verso][VERSO] middleware source code repository
that is used in the Sinopia Profile Editor project.

## Log

### 2019-01-22

Small manual updates for JSON schema v0.0.2 validity:

- adjusted defaultURI and defaultLiteral when they weren't inside defaults object
    - the only slightly questionable one was when a non-empty defaultLiteral was provided without a defaultURI -- see ec91e62 (Prints and Photographs profile)
- changed contact to author (894d6f5 and others)
- removed adherence and source attributes from Admin Metadata - too soon! (ecae94d)

### 2018-12-18

Small manual updates for JSON schema v0.0.1 validity:

- fixed bad type value in propertyTemplate Cartographic (8405430)
- fixed bad type value in propertyTemplate in Moving Image BluRay DVD a889153
- fixed Edition - author, not contact (03c5b14)
- got rid of empty (invalid) dataTypeURI strings by removing the valueDataType for those (nothing else is of consequence) (8a7ee4b)

### 2018-12-17
Update to ecb3c1e from https://github.com/lcnetdev/verso

### 2018-10-31
Add README.md

### 2018-10-30
Initial import of the latest profiles in [Verso][VERSO]. Here is the listing of
profiles from the SHA commit 67786e709e2aa207f6605e6a484b69d01acb9a60.

	BIBFRAME 2.0 Admin Metadata.json
	BIBFRAME 2.0 Agents Contribution.json
	BIBFRAME 2.0 Agents Primary Contribution.json
	BIBFRAME 2.0 Agents.json
	BIBFRAME 2.0 Cartographic.json
	BIBFRAME 2.0 DDC.json
	BIBFRAME 2.0 Extra menus.json
	BIBFRAME 2.0 Form.json
	BIBFRAME 2.0 Identifiers.json
	BIBFRAME 2.0 Item.json
	BIBFRAME 2.0 LCC.json
	BIBFRAME 2.0 Language.json
	BIBFRAME 2.0 Monograph.json
	BIBFRAME 2.0 Moving Image-35mm Feature Film.json
	BIBFRAME 2.0 Moving Image-BluRay DVD.json
	BIBFRAME 2.0 Notated Music.json
	BIBFRAME 2.0 Note.json
	BIBFRAME 2.0 Place.json
	BIBFRAME 2.0 Publication, Distribution, Manufacturer Activity.json
	BIBFRAME 2.0 RWO.json
	BIBFRAME 2.0 Rare Materials.json
	BIBFRAME 2.0 Related Works and Expressions.json
	BIBFRAME 2.0 Serial.json
	BIBFRAME 2.0 Series Information.json
	BIBFRAME 2.0 Sound Recording-Analog.json
	BIBFRAME 2.0 Sound Recording-Audio CD-R.json
	BIBFRAME 2.0 Sound Recording-Audio CD.json
	BIBFRAME 2.0 Title Information.json
	BIBFRAME 2.0 Topic.json
	PMO Medium of Performance.json


[VERSO]: https://github.com/lcnetdev/verso
