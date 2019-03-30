 # Ransom Center test profiles

This directory includes HRC profiles created for testing purposes

**Test no. 1 - profile editing workflow**

Cloned and edited LC Admin Metadata collating profile using both the Sinopia Profile editor (SPE) and directly in Atom. The atom profile gives an error when trying ot upload to Sinopia LD editor ("ERROR - CANNOT USE PROFILE/RESOURCE TEMPLATE: problem parsing JSON template: SyntaxError: Unexpected token in JSON at position 6458"). The SPE profile uploads wiht no problem, but Sinopia LD editor still doesn't load properties that include default values, and only allows to enter data on the first two properties. When trying to enter data in any of the other properties, it will automatically jump to the first two.

>*Installed the atom package **pretty-json** (https://atom.io/packages/pretty-json) in order to format and index the json file that the SPE exports. It makes easier navigate and doublecheck the profile in Atom.*

**Test no. 2 - profile validation**

