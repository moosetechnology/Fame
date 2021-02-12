# Fame

![CI](https://github.com/moosetechnology/Fame/workflows/CI/badge.svg?branch=development)

Fame is an meta-modelling framework for executable models. 

  - [Installation](#installation)
  - [Documentation](#documentation)
  - [Version management](#version-management)
  - [Smalltalk versions compatibility](#smalltalk-versions-compatibility)
  - [Contact](#contact)

## Installation

To install the project on your Pharo image, execute the following script: 

```Smalltalk
Metacello new
	githubUser: 'moosetechnology' project: 'Fame' commitish: 'development' path: 'src';
	baseline: 'Fame';
	load
```

To add the project to your baseline:

```Smalltalk
spec
	baseline: 'Fame'
	with: [ spec repository: 'github://moosetechnology/Fame:development/src' ]
```

Note you can replace the #master by another branch such as #development or a tag such as #v1.0.0, #v1.? or #v1.2.? .

## Documentation


### Export to mse

To export a model (or metamodel) in the mse format (for example to use FameJava and VerveineJ), execute the following code:

```Smalltalk
'/path/to/file.mse' asFileReference writeStreamDo: [ :writeStream | MyModel metamodel exportOn: writeStream ]
```

### Export to JSON

```Smalltalk
String streamContents: [ :writeStream | MyModel metamodel exportOn: writeStream usingPrinter: FMJSONPrinter ]
```

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Smalltalk versions compatibility

| Version 	| Compatible Pharo versions 	|
|-------------	|---------------------------	|
| development      	| Pharo 80		|

## Contact

If you have any questions or problems do not hesitate to open an issue or contact cyril (a) ferlicot.me 
