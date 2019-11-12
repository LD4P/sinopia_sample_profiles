# Ransom Center test profiles using the ARM ontology

#### HRC Bibliographic Citation test
*High level JSON profile for the [ARM bibliographic citation modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/bibliographic_citations.md) following the USE CASE 2 (Citation located, cataloger adds commentary on citation)*

Standing questions:

1. What is "bib:" namespace for? Is this Bilbiotek-o?

2. In the basic citation model, the ex:citation -- hasSource -- ex:source. Should the object be a Source, and if so, is there a modeling for source documented somewhere? Is bf:Source appropriate in this case?

3. The located citation model seems to include blank nodes. The HRC test example attempts to reflect  that modeling (relatinship between citation source, entry and page..) but it doesn't look right. How should this be modeled in a profile?

4. In the located citation model, when linking a Citation to an instance via dcterms:isPartOf, how would be the recomendation to link directly to the instance (e.g a record on worldcat or Share-vde) instead of a literal?

5. The class Volume doesn't exist in the ARM Core Ontology (while Entry and Page do). Is there a suggested ontology for Volume?

6. Are we using properly the https://w3id.org/arm/core/ontology/0.1/citedBy property? Per the definition, seems to be visual materials focused.


#### HRC Binding test
*High level JSON profile test for the [ARM Binding modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/bindings.md). Some of the RTs included here should probably defined outside of this profile on its own.*


#### HRC Custodial History test
*High level JSON profile test for the [ARM Custodial History modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/custodial_history.md). It doesn't include price, accession number, aggregate custodial events or precedence relationships.*

Standing questions:

1. Modeling of custodial event type using the *rdf:type* property. Should the value of this property be a Custodial Event subclass (https://ld4p.github.io/arm/custodial_history/ontology/0.1/custodial_history.html#CustodialEvent) and how to enforce it in the profile. Can a subclass be used as a scheme for a property value?

2. arm:atLocation vs. bf:place. Seems the discussion is closed (https://github.com/LD4P/arm/issues/48), but not sure about the difference.

3. Activity subclasses. Does the sinopia RT Agents Contribution (https://github.com/LD4P/sinopia_sample_profiles/blob/master/profiles/v0.1.0/BIBFRAME%202.0%20Agents%20Contribution.json) work in this context? 

4. Does it make sense to have a Custodial History RT that calls to a Custodial Event RT, or should this just include the Custodial Event RT as the starting point?


#### HRC Identifiers test
*High level JSON profile for HRC identifiers to be used on the item level. It modifies the LC canonical profile to include the [ARM accession numbers modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/accession_numbers.md)*

Standing Questions:

1. Accession number --> Is LC planning to include AccessionNumber to BF2? Can I use the arm:AccessionNumber with bf:identifyBy even if the expected value is bf:Idnetifier or one of its classes? Also, there is an ARM Status Vocabulary (https://ld4p.github.io/arm/core/vocabularies/status/0.1/status.html) that has not yet been requested as a lookup. Leaving it as a literal by now, with recommendation to use an ARM Status Vocabulary term (or URI as a literal?)


#### HRC Markings test
*High level JSON profile test for the [ARM markings modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/markings.md)*


#### HRC Rare Book Item test
*High level JSON profile for an item from the Carl H. Pforzheimer Library held at the HRC*

Standing Questions:

1. Linking the item to the digital surrogate --> Use property bf:otherPhysicalFormat or bf:hasEquivalent? otherPhysicalFormat can only be used with Instance, while hasEquivalent works with Work, Instance and Item. Here we use hasEquivalent as we want to state that it is this specific item that has been digitized, howeverit might be more appropriate to create that relationship on the instance level (if we want to follow a 776 marc field model)? Also, what should be the object of this statement? To make it here simple, we are using the URL in our CONTENTdm as a literal, but should this link to a brief instance description of the Digitized Instance?

2. Linking to the Sammelband --> Is the ARM Bound collection model its own record, and if so, is it an item on its own that the other items link to? Should it be a blank node?

3. Linking to the instance --> Ideally this will be a lookup for the HRC instance data on SVDE, but have we modeled that properly on the profile (currently using the "urn:ld4p:qa:sharevde_stanford_instance_ld4l_cache" as a place holder)?


#### HRC Sammelband test
*High level JSON profile for the [ARM bound-with modeling](https://github.com/LD4P/arm/blob/master/modeling_recommendations/carriers_and_bound_withs.md). It doesn't include table of contents.*

Standing questions:

1. Is this the right way of linking to the item? Should an RT for bound-with item be created within this profile to include precedes and follows properties, and how would that link to the more generic item RT?
