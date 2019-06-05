**to do: a configuration demo to test all the various QA lookups**

## Configuration demo with expected RDF ##
**[ConfigurationDemoFuller.json](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/ConfigurationDemoFuller.json)** is a Profile intended to show the various configuration possibilities for describing a Resource, including the 3 types of property templates, and variations of mandatory and repeatable, plus default values and tooltips. A full description of how this Profile is configured is here: [Key to ConfigurationDemoFuller](https://docs.google.com/spreadsheets/d/1V0yNUMBV5W4Hv1KU455tq4-APW190hUWuqBbyrZYVls/edit#gid=0) (Google sheet)
- ConfigurationDemoFuller.json refers to several other Resource Templates:
    - sinopia:RT:demo:Note is in Demo RT.json https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/Demo%20RT.json in current repo
    - profile:bf2:Title and profile:bf2:Title:Note (referred to by profile:bf2:Title) are in this Profile: https://github.com/LD4P/sinopia_sample_profiles/blob/master/bfe-verso-profiles/profiles/BIBFRAME%202.0%20Title%20Information.json
    - profile:bf2:Note is in https://github.com/LD4P/sinopia_sample_profiles/blob/master/bfe-verso-profiles/profiles/BIBFRAME%202.0%20Note.json
    - profile:bf2:PublicationInformationTest is in https://github.com/LD4P/sinopia_sample_profiles/blob/master/bfe-verso-profiles/profiles/BIBFRAME%202.0%20Publication%2C%20Distribution%2C%20Manufacturer%20Activity.json
- [Key to ConfigurationDemoFuller](https://docs.google.com/spreadsheets/d/1V0yNUMBV5W4Hv1KU455tq4-APW190hUWuqBbyrZYVls/edit#gid=0) includes "User Input" column. Given that input (also shown in the following screenshots), the expected RDF output is given here: [ConfigWithEnteredExpectations](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/ConfigWithEnteredExpectations.txt). In the output example, http://sinopia.io/group/abc would be the URL minted by Sinopia for the resource being described.
![](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/Screen%20Shot%202019-06-03%20at%204.18.07%20PM.png)
![](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/Screen%20Shot%202019-06-03%20at%204.18.15%20PM.png)
![](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/Screen%20Shot%202019-06-03%20at%204.18.24%20PM.png)
![](https://github.com/LD4P/sinopia_sample_profiles/blob/master/configuration_demo/Screen%20Shot%202019-06-03%20at%204.18.33%20PM.png)


- *Note that some configuration combinations, while possible to set up in the Profile Editor, are not included here because they don't really have a logical outcome in the Linked Data Editor, namely: type = Resource with a default value (there is no way to populate the default values for an entire Resource Template) and type = Resource with mandatory = true (how would you define "mandatory" completion of the Resource Template?)*

**SinopiaConfigurationDemo.json** is an older (than ConfigurationDemoFuller.json) content-less profile intended to show the various configuration possibilities for describing a Resource. This is a sample profile, content is meaningless, Resource URI = http://id.loc.gov/ontologies/bibframe/Work; for literal examples, property URI = http://id.loc.gov/ontologies/bibframe/copyrightDate; for lookup examples, property URI = http://id.loc.gov/ontologies/bibframe/subject; for examples that point to another RT, property URI is http://id.loc.gov/ontologies/bibframe/note. Lookups are configured to use "LOC all subjects (QA)".

- *Note that SinopiaConfigurationDemo does not show any defaults, because that feature was not yet working at the time the demo profile was created. Also, the same property URI was used for multiple fields, which, for literals (possibly for lookups?), can cause entered values to display in multiple fields when the Resource Template is used in the Linked Data Editor. For a demo Profile with defaults and a variety of property URIs, use the more recent ConfigurationDemoFuller.json*
