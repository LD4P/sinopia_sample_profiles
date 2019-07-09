## Some notes
#### 2019-06-06
Currently using [v009base schemas](https://github.com/CECSpecialistI/UWLibCatProfiles/tree/master/uwSchemas/v009base) for profile validation:
- Still no fix to reduce validation errors for not-filled-in-yet PTs ([Issue #4](https://github.com/CECSpecialistI/UWLibCatProfiles/issues/4))
#### 2019-05-16
JSON schema modules in the [v010base](https://github.com/CECSpecialistI/UWLibCatProfiles/tree/master/uwSchemas/v010base) directory include a handful of modifications detailed in the following commits:
- [02 May](https://github.com/CECSpecialistI/UWLibCatProfiles/commit/c005f101343fda9335a9a4bb5c58a9162b51730e)
   - Comments here include [a still-outstanding question](https://github.com/CECSpecialistI/UWLibCatProfiles/commit/c005f101343fda9335a9a4bb5c58a9162b51730e#r33395969) about whether dual-type properties are actually functioning as expected in validation
- [10 May](https://github.com/CECSpecialistI/UWLibCatProfiles/commit/2d8262a876accc4cd9b1461dac4857c0598d28bc)
- [10 May (again)](https://github.com/CECSpecialistI/UWLibCatProfiles/commit/ee1d95ddc020afd5a582a49699e0104cea09fb73)

Currently creating new [UW schemas based on v0.0.9](https://github.com/CECSpecialistI/UWLibCatProfiles/tree/master/uwSchemas/v009base) based on a tentative understanding that profiles being loaded into the LDe should conform to this schema version, *not* v0.1.0
