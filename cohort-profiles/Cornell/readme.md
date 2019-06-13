# Sinatra Profiles

Here you will find BIBFRAME Profile Editor profiles for the LD4P2 Cornell work item for cataloging Frank Sinatra related 45 RPM records. These profiles were derived from the Library of Congress
        https://github.com/lcnetdev/verso/data/profiles/BIBFRAME 2.0 Sound Recording-Analog.json profiles.

How this Sinatra profile differs from the orginal LC profile is illustrated here: https://github.com/LD4P/ld4p2-cornell/blob/master/Sinatra/profiles/Sinatra_profile_Decisions-copy.pdf

Changes include:

* Linking to id.loc.gov RWOs from LCNAF rather than authorities
* Linking to geoname features rather than bf:Places. The idea here being that Geonames is a dataset optimized for describing places, has more "place" information that can benefit discovery, and has a level of granularity that allows to link to highly specific features if needed.
* Defaults for extents are customized for 45 RPM records
* Pruned Identifier types based on Cataloger Feedback
* Added the ability to describe songs as separate works
* Changed the default for the bf:heldBy value to Cornell Music Library
* useValuesFrom have been updated in some cases to use URN that point to the Questioning Authority Lookup Service.
* LC's AdminMetadata pattern is not used.

See: https://github.com/LD4P/ld4p2-cornell/blob/master/Sinatra/profiles/Sinatra_profile_Decisions-copy.pdf for other outstanding questions (as of 2019-02-08).

## Notes about process

These profiles were used using a text editor (atom.io) rather than a BF Profile Editor instance, which means external validation is required. No assurances are made that the most recent commits for a particualar file has been validated.

These profiles are subject to change; we anticipate after they have been uploaded and tested by catalogers there will be changes in the profiles that affect both the UI of the forms and also the data targets. The data targets have not been vetted by MLA, PCC, or any other standards body.

## Contact

Please add questions or comments here in this repository or send them via email to: sf433 [at] cornell [dot] edu.
