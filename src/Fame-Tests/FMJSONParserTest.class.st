Class {
	#name : #FMJSONParserTest,
	#superclass : #TestCase,
	#instVars : [
		'a',
		'parser',
		'importer'
	],
	#category : #'Fame-Tests'
}

{ #category : #accessing }
FMJSONParserTest class >> famix30mse [
	^ '[{
	"FM3":"FM3.Package",
	"id":1,
	"name":"FAMIX",
	"classes":[{
		"FM3":"FM3.Class",
		"id":2,
		"name":"Access",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 3},
		"properties":[{
			"FM3":"FM3.Property",
			"id":4,
			"name":"isWrite",
			"class": {"ref": 2},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "Boolean"}
			},{
			"FM3":"FM3.Property",
			"id":5,
			"name":"accessor",
			"class": {"ref": 2},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 6},
			"type": {"ref": 7}
			},{
			"FM3":"FM3.Property",
			"id":8,
			"name":"variable",
			"class": {"ref": 2},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 9},
			"type": {"ref": 10}
			},{
			"FM3":"FM3.Property",
			"id":11,
			"name":"isRead",
			"class": {"ref": 2},
			"container":false,
			"derived":true,
			"multivalued":false,
			"type": {"ref": "Boolean"}
			}]
		},{
		"FM3":"FM3.Class",
		"id":12,
		"name":"Parameter",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 10},
		"properties":[{
			"FM3":"FM3.Property",
			"id":13,
			"name":"parentBehaviouralEntity",
			"class": {"ref": 12},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 14},
			"type": {"ref": 7}
			}]
		},{
		"FM3":"FM3.Class",
		"id":10,
		"name":"StructuralEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 15},
		"properties":[{
			"FM3":"FM3.Property",
			"id":16,
			"name":"declaredType",
			"class": {"ref": 10},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": 17}
			},{
			"FM3":"FM3.Property",
			"id":9,
			"name":"incomingAccesses",
			"class": {"ref": 10},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 8},
			"type": {"ref": 2}
			}]
		},{
		"FM3":"FM3.Class",
		"id":18,
		"name":"ContainerEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 19},
		"properties":[{
			"FM3":"FM3.Property",
			"id":20,
			"name":"outgoingReferences",
			"class": {"ref": 18},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 21},
			"type": {"ref": 22}
			},{
			"FM3":"FM3.Property",
			"id":23,
			"name":"types",
			"class": {"ref": 18},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 24},
			"type": {"ref": 17}
			},{
			"FM3":"FM3.Property",
			"id":25,
			"name":"incomingReferences",
			"class": {"ref": 18},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 26},
			"type": {"ref": 22}
			}]
		},{
		"FM3":"FM3.Class",
		"id":15,
		"name":"LeafEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 19}
		},{
		"FM3":"FM3.Class",
		"id":3,
		"name":"Association",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 27},
		"properties":[{
			"FM3":"FM3.Property",
			"id":28,
			"name":"below",
			"class": {"ref": 3},
			"container":false,
			"derived":true,
			"multivalued":false,
			"opposite": {"ref": 29},
			"type": {"ref": 3}
			},{
			"FM3":"FM3.Property",
			"id":29,
			"name":"above",
			"class": {"ref": 3},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 28},
			"type": {"ref": 3}
			}]
		},{
		"FM3":"FM3.Class",
		"id":30,
		"name":"Attribute",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 10},
		"properties":[{
			"FM3":"FM3.Property",
			"id":31,
			"name":"parentClass",
			"class": {"ref": 30},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 32},
			"type": {"ref": 17}
			}]
		},{
		"FM3":"FM3.Class",
		"id":33,
		"name":"LocalVariable",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 10},
		"properties":[{
			"FM3":"FM3.Property",
			"id":34,
			"name":"parentBehaviouralEntity",
			"class": {"ref": 33},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 35},
			"type": {"ref": 7}
			}]
		},{
		"FM3":"FM3.Class",
		"id":36,
		"name":"Method",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 7},
		"properties":[{
			"FM3":"FM3.Property",
			"id":37,
			"name":"parentClass",
			"class": {"ref": 36},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 38},
			"type": {"ref": 17}
			}]
		},{
		"FM3":"FM3.Class",
		"id":39,
		"name":"Package",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 40},
		"properties":[{
			"FM3":"FM3.Property",
			"id":41,
			"name":"childNamedEntities",
			"class": {"ref": 39},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 42},
			"type": {"ref": 19}
			}]
		},{
		"FM3":"FM3.Class",
		"id":43,
		"name":"GlobalVariable",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 10},
		"properties":[{
			"FM3":"FM3.Property",
			"id":44,
			"name":"parentNamespace",
			"class": {"ref": 43},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 45},
			"type": {"ref": 40}
			}]
		},{
		"FM3":"FM3.Class",
		"id":27,
		"name":"Entity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": "Object"},
		"properties":[{
			"FM3":"FM3.Property",
			"id":46,
			"name":"sourceAnchor",
			"class": {"ref": 27},
			"container":false,
			"derived":false,
			"multivalued":true,
			"type": {"ref": "String"}
			}]
		},{
		"FM3":"FM3.Class",
		"id":17,
		"name":"Type",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 18},
		"properties":[{
			"FM3":"FM3.Property",
			"id":47,
			"name":"subInheritances",
			"class": {"ref": 17},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 48},
			"type": {"ref": 49}
			},{
			"FM3":"FM3.Property",
			"id":38,
			"name":"methods",
			"class": {"ref": 17},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 37},
			"type": {"ref": 36}
			},{
			"FM3":"FM3.Property",
			"id":24,
			"name":"container",
			"class": {"ref": 17},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 23},
			"type": {"ref": 18}
			},{
			"FM3":"FM3.Property",
			"id":50,
			"name":"superInheritances",
			"class": {"ref": 17},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 51},
			"type": {"ref": 49}
			},{
			"FM3":"FM3.Property",
			"id":32,
			"name":"attributes",
			"class": {"ref": 17},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 31},
			"type": {"ref": 30}
			}]
		},{
		"FM3":"FM3.Class",
		"id":22,
		"name":"Reference",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 3},
		"properties":[{
			"FM3":"FM3.Property",
			"id":26,
			"name":"to",
			"class": {"ref": 22},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 25},
			"type": {"ref": 18}
			},{
			"FM3":"FM3.Property",
			"id":21,
			"name":"from",
			"class": {"ref": 22},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 20},
			"type": {"ref": 18}
			}]
		},{
		"FM3":"FM3.Class",
		"id":40,
		"name":"ScopingEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 18},
		"properties":[{
			"FM3":"FM3.Property",
			"id":52,
			"name":"childNamespaces",
			"class": {"ref": 40},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 53},
			"type": {"ref": 40}
			},{
			"FM3":"FM3.Property",
			"id":53,
			"name":"parentNamespace",
			"class": {"ref": 40},
			"container":true,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 52},
			"type": {"ref": 40}
			},{
			"FM3":"FM3.Property",
			"id":45,
			"name":"globalVariables",
			"class": {"ref": 40},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 44},
			"type": {"ref": 43}
			}]
		},{
		"FM3":"FM3.Class",
		"id":54,
		"name":"Namespace",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 40}
		},{
		"FM3":"FM3.Class",
		"id":7,
		"name":"BehaviouralEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 18},
		"properties":[{
			"FM3":"FM3.Property",
			"id":55,
			"name":"outgoingInvocations",
			"class": {"ref": 7},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 56},
			"type": {"ref": 57}
			},{
			"FM3":"FM3.Property",
			"id":58,
			"name":"incomingInvocations",
			"class": {"ref": 7},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 59},
			"type": {"ref": 57}
			},{
			"FM3":"FM3.Property",
			"id":35,
			"name":"localVariables",
			"class": {"ref": 7},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 34},
			"type": {"ref": 33}
			},{
			"FM3":"FM3.Property",
			"id":14,
			"name":"parameters",
			"class": {"ref": 7},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 13},
			"type": {"ref": 12}
			},{
			"FM3":"FM3.Property",
			"id":6,
			"name":"outgoingAccesses",
			"class": {"ref": 7},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 5},
			"type": {"ref": 2}
			},{
			"FM3":"FM3.Property",
			"id":60,
			"name":"signature",
			"class": {"ref": 7},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "String"}
			}]
		},{
		"FM3":"FM3.Class",
		"id":19,
		"name":"NamedEntity",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 27},
		"properties":[{
			"FM3":"FM3.Property",
			"id":61,
			"name":"name",
			"class": {"ref": 19},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "String"}
			},{
			"FM3":"FM3.Property",
			"id":62,
			"name":"isStub",
			"class": {"ref": 19},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "Boolean"}
			},{
			"FM3":"FM3.Property",
			"id":63,
			"name":"receivingInvocations",
			"class": {"ref": 19},
			"container":false,
			"derived":true,
			"multivalued":true,
			"opposite": {"ref": 64},
			"type": {"ref": 57}
			},{
			"FM3":"FM3.Property",
			"id":65,
			"name":"modifiers",
			"class": {"ref": 19},
			"container":false,
			"derived":false,
			"multivalued":true,
			"type": {"ref": "String"}
			},{
			"FM3":"FM3.Property",
			"id":66,
			"name":"belongsTo",
			"class": {"ref": 19},
			"container":false,
			"derived":true,
			"multivalued":false,
			"type": {"ref": 18}
			},{
			"FM3":"FM3.Property",
			"id":42,
			"name":"packagedIn",
			"class": {"ref": 19},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 41},
			"type": {"ref": 39}
			}]
		},{
		"FM3":"FM3.Class",
		"id":67,
		"name":"Class",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 17},
		"properties":[{
			"FM3":"FM3.Property",
			"id":68,
			"name":"isAbstract",
			"class": {"ref": 67},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "Boolean"}
			}]
		},{
		"FM3":"FM3.Class",
		"id":49,
		"name":"Inheritance",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 3},
		"properties":[{
			"FM3":"FM3.Property",
			"id":48,
			"name":"superclass",
			"class": {"ref": 49},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 47},
			"type": {"ref": 17}
			},{
			"FM3":"FM3.Property",
			"id":51,
			"name":"subclass",
			"class": {"ref": 49},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 50},
			"type": {"ref": 17}
			}]
		},{
		"FM3":"FM3.Class",
		"id":57,
		"name":"Invocation",
		"abstract":false,
		"package": {"ref": 1},
		"superclass": {"ref": 3},
		"properties":[{
			"FM3":"FM3.Property",
			"id":56,
			"name":"sender",
			"class": {"ref": 57},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 55},
			"type": {"ref": 7}
			},{
			"FM3":"FM3.Property",
			"id":64,
			"name":"receiver",
			"class": {"ref": 57},
			"container":false,
			"derived":false,
			"multivalued":false,
			"opposite": {"ref": 63},
			"type": {"ref": 19}
			},{
			"FM3":"FM3.Property",
			"id":69,
			"name":"receiverSourceCode",
			"class": {"ref": 57},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "String"}
			},{
			"FM3":"FM3.Property",
			"id":70,
			"name":"signature",
			"class": {"ref": 57},
			"container":false,
			"derived":false,
			"multivalued":false,
			"type": {"ref": "String"}
			},{
			"FM3":"FM3.Property",
			"id":59,
			"name":"candidates",
			"class": {"ref": 57},
			"container":false,
			"derived":false,
			"multivalued":true,
			"opposite": {"ref": 58},
			"type": {"ref": 7}
			}]
		}]
	}
]'
]

{ #category : #running }
FMJSONParserTest >> setUp [

	super setUp.
	parser := FMJSONParser new.
	importer := FMDebugImporter new.
	parser importer: importer
]

{ #category : #tests }
FMJSONParserTest >> testBacktrack [
	| pos |
	parser fromString: 'abcdefg'.
	self assert: parser peek equals: $a.
	self assert: parser next equals: $b.
	pos := parser position.
	self assert: parser peek equals: $b.
	self assert: parser next equals: $c.
	self assert: parser next equals: $d.
	self assert: parser next equals: $e.
	parser backtrack: pos.
	self assert: parser peek equals: $b.
	self assert: parser next equals: $c.
	self assert: parser next equals: $d.
	self assert: parser next equals: $e
]

{ #category : #tests }
FMJSONParserTest >> testEmptyDocument [
	parser fromString: ''.
	parser Document.
	self assert: importer contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testEmptyExportString [

	parser fromString: ''.
	parser Document.
	self assert: importer exportJsonString equals: '[
]'
]

{ #category : #tests }
FMJSONParserTest >> testEntity [
	a := #(#(#beginEntity: 'Foo') #(#endEntity: 'Foo')).
	importer reset.
	parser fromString: '{"FM3":"Foo"}'.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '{ "FM3" : "Foo" }  '.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testEntityWithID [
	a := #(#(#beginEntity: 'Foo') #(#serial: 42) #(#endEntity: 'Foo')).
	importer reset.
	parser fromString: '{"FM3":"Foo","id":42}'.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '{  "FM3"   :   "Foo"   ,   "id"   :   42   }  '.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testEntityWithProperties [
	a := #(#(#beginEntity: 'Foo') #(#beginProperty: 'name') #(#primitive: 'test') #(#endProperty: 'name') #(#beginProperty: 'count') #(#primitive: 12) #(#endProperty: 'count') #(#endEntity: 'Foo')).
	importer reset.
	parser fromString: '{"FM3":"Foo","name":"test","count":12}'.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '{ "FM3" : "Foo" , "name" : "test" , "count" : 12 } '.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testEntityWithPropertiesAndID [
	a := #(#(#beginEntity: 'Foo') #(#serial: 42) #(#beginProperty: 'name') #(#primitive: 'test') #(#endProperty: 'name') #(#beginProperty: 'count') #(#primitive: 12) #(#endProperty: 'count') #(#endEntity: 'Foo')).
	importer reset.
	parser fromString: '{"FM3":"Foo","id":42,"name":"test","count":12}'.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '{ "FM3" : "Foo" , "id" : 42 , "name" : "test" , "count" : 12 } '.
	parser Entity.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testFamixModel [
	| metamodel names famixPackage accessClass accessorProperty behaviouralEntity outgoingAccesses |
	metamodel := FMMetaModel fromJSONString: self class famix30mse.
	names := metamodel elements collect: [ :each | each fullName ].
	self assert: names size equals: 70.
	self assert: (names includes: 'FAMIX.Access').
	self assert: (names includes: 'FAMIX.Method').
	self assert: (names includes: 'FAMIX.NamedEntity.belongsTo').
	self assert: (names includes: 'FAMIX.Class').
	self assert: (names includes: 'FAMIX').
	self assert: (names includes: 'FAMIX.Entity.sourceAnchor').
	self assert: (names includes: 'FAMIX.Access.accessor').
	self assert: (names includes: 'FAMIX.Type.methods').
	self assert: (names includes: 'FAMIX.Package.childNamedEntities').
	self assert: (names includes: 'FAMIX.Type.attributes').
	self assert: (names includes: 'FAMIX.Attribute.parentClass').
	self assert: (names includes: 'FAMIX.GlobalVariable').
	self assert: (names includes: 'FAMIX.ScopingEntity.parentNamespace').
	self assert: (names includes: 'FAMIX.Type').
	self assert: (names includes: 'FAMIX.Parameter').
	self assert: (names includes: 'FAMIX.Access.isRead').
	self assert: (names includes: 'FAMIX.Attribute').
	self assert: (names includes: 'FAMIX.ContainerEntity.incomingReferences').
	self assert: (names includes: 'FAMIX.Method.parentClass').
	self assert: (names includes: 'FAMIX.BehaviouralEntity').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.incomingInvocations').
	self assert: (names includes: 'FAMIX.StructuralEntity').
	self assert: (names includes: 'FAMIX.Access.isWrite').
	self assert: (names includes: 'FAMIX.Invocation.sender').
	self assert: (names includes: 'FAMIX.ScopingEntity.globalVariables').
	self assert: (names includes: 'FAMIX.ContainerEntity').
	self assert: (names includes: 'FAMIX.ScopingEntity').	"self assert: (names includes: 'FAMIX.Invocation.above')."
	self assert: (names includes: 'FAMIX.Association').
	self assert: (names includes: 'FAMIX.StructuralEntity.declaredType').
	self assert: (names includes: 'FAMIX.Invocation.receiver').
	self assert: (names includes: 'FAMIX.Package').
	self assert: (names includes: 'FAMIX.ScopingEntity.childNamespaces').
	self assert: (names includes: 'FAMIX.Entity').
	self assert: (names includes: 'FAMIX.Reference.from').
	self assert: (names includes: 'FAMIX.ContainerEntity.outgoingReferences').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.localVariables').
	self assert: (names includes: 'FAMIX.Invocation.candidates').
	self assert: (names includes: 'FAMIX.Invocation.receiverSourceCode').
	self assert: (names includes: 'FAMIX.NamedEntity.name').
	self assert: (names includes: 'FAMIX.NamedEntity.receivingInvocations').
	self assert: (names includes: 'FAMIX.StructuralEntity.incomingAccesses').
	self assert: (names includes: 'FAMIX.LeafEntity').
	self assert: (names includes: 'FAMIX.Class.isAbstract').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.signature').
	self assert: (names includes: 'FAMIX.Inheritance.subclass').
	self assert: (names includes: 'FAMIX.Reference').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.outgoingInvocations').
	self assert: (names includes: 'FAMIX.Access.variable').
	self assert: (names includes: 'FAMIX.LocalVariable.parentBehaviouralEntity').
	self assert: (names includes: 'FAMIX.LocalVariable').
	self assert: (names includes: 'FAMIX.BehaviouralEntity.outgoingAccesses').
	self assert: (names includes: 'FAMIX.Inheritance').
	self assert: (names includes: 'FAMIX.Parameter.parentBehaviouralEntity').	"... and tons more ... "
	famixPackage := metamodel packageNamed: 'FAMIX'.
	self assert: famixPackage isFM3Package.
	accessClass := famixPackage classNamed: 'Access'.
	self assert: accessClass isFM3Class.
	accessorProperty := accessClass propertyNamed: 'accessor'.
	self assert: accessorProperty isFM3Property.
	self assert: accessorProperty name equals: #accessor.
	self assert: accessorProperty opposite isNotNil.
	behaviouralEntity := famixPackage classNamed: 'BehaviouralEntity'.
	self assert: behaviouralEntity isFM3Class.
	outgoingAccesses := behaviouralEntity propertyNamed: 'outgoingAccesses'.
	self assert: outgoingAccesses isFM3Property.
	self assert: accessorProperty opposite equals: outgoingAccesses
]

{ #category : #tests }
FMJSONParserTest >> testFullName [
	parser fromString: '"FM3":"Foo"'.
	importer := parser tFULLNAME.
	self assert: importer equals: 'Foo'.
	self assert: parser atEnd.
	parser fromString: '"FM3" : "A" '.
	importer := parser tFULLNAME.
	self assert: importer equals: 'A'.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testFullName2 [
	parser fromString: '"FM3":"Foo.Bar"'.
	importer := parser tFULLNAME.
	self assert: importer equals: 'Foo.Bar'.
	self assert: parser atEnd.
	parser fromString: '"FM3" : "A.b" '.
	importer := parser tFULLNAME.
	self assert: importer equals: 'A.b'.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testFullName3 [
	parser fromString: '"FM3":"Foo.Bar.Qux"'.
	importer := parser tFULLNAME.
	self assert: importer equals: 'Foo.Bar.Qux'.
	self assert: parser atEnd.
	parser fromString: '"FM3" : "A.b.q" '.
	importer := parser tFULLNAME.
	self assert: importer equals: 'A.b.q'.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testImporter [
	self assert: parser importer equals: importer
]

{ #category : #tests }
FMJSONParserTest >> testMatchString [
	parser fromString: '"Lorem"'.
	importer := parser String.
	self assert: importer equals: 'Lorem'.
	self assert: parser atEnd.
	parser fromString: '"Eo"ipso"'.
	importer := parser String.
	self assert: importer equals: 'Eo'.
	self assert: parser peek equals: $i.
	parser fromString: '"Eo\"ipso"'.
	importer := parser String.
	self assert: importer equals: 'Eo"ipso'.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testMultiValueString [

	parser fromString: '["public"]'.
	parser MultiEntity.
	self assert: importer exportJsonString equals: '"public"'
]

{ #category : #tests }
FMJSONParserTest >> testMultiValueWithMultiString [

	parser fromString: '["public", "hello"]'.
	parser MultiEntity.
	self assert: importer exportJsonString equals: '"public""hello"'
]

{ #category : #tests }
FMJSONParserTest >> testNumber [
	parser fromString: '14'.
	importer := parser Number.
	self assert: importer equals: 14.
	self assert: parser atEnd.
	parser fromString: '-23x'.
	importer := parser Number.
	self assert: importer equals: -23.
	self assert: parser peek equals: $x.
	parser fromString: '1'.
	importer := parser Number.
	self assert: importer equals: 1.
	self assert: parser atEnd.
	parser fromString: '-1'.
	importer := parser Number.
	self assert: importer equals: -1.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testNumber2 [
	parser fromString: '12.91'.
	importer := parser Number.
	self assert: parser atEnd.
	self assert: importer equals: 12.91.
	parser fromString: '-47.11'.
	importer := parser Number.
	self assert: importer equals: -47.11.
	self assert: parser atEnd.
	parser fromString: '1.1'.
	importer := parser Number.
	self assert: importer equals: 1.1.
	self assert: parser atEnd.
	parser fromString: '-1.1'.
	importer := parser Number.
	self assert: importer equals: -1.1.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testNumber3 [
	parser fromString: '12.91e33'.
	importer := parser Number.
	self assert: parser atEnd.
	self assert: importer equals: 1.291e34.
	parser fromString: '-47.11e22'.
	importer := parser Number.
	self assert: importer equals: -4.711e23.
	self assert: parser atEnd.
	parser fromString: '-23.11e-15'.
	importer := parser Number.
	self assert: importer equals: -2.311e-14.
	self assert: parser atEnd.
	parser fromString: '1.1e2'.
	importer := parser Number.
	self assert: importer equals: 110.0.
	self assert: parser atEnd.
	parser fromString: '-1.1e2'.
	importer := parser Number.
	self assert: importer equals: -110.0.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testNumberTrailingDotFails [
	parser fromString: '12.'.
	self should: [ parser Number ] raise: Error
]

{ #category : #tests }
FMJSONParserTest >> testNumberTrailingLetterFails [
	parser fromString: '12.11e'.
	self should: [ parser Number ] raise: Error
]

{ #category : #tests }
FMJSONParserTest >> testProperty [
	a := #(#(#beginProperty: 'name') #(#primitive: true) #(#endProperty: 'name')).
	importer reset.
	parser fromString: '"name":true'.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '"name"  :  true  '.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testPropertyWithReferences [
	a := #(#(#beginProperty: 'name') #(#referenceNumber: 2) #(#endProperty: 'name')).
	importer reset.
	parser fromString: '"name":{"ref":2}'.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '"name"  :  {  "ref"  :  2  }  '.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testPropertyWithStrings2 [
	a := #(#(#beginProperty: 'name') #(#primitive: 'bar"ba"rossa') #(#endProperty: 'name')).
	importer reset.
	parser fromString: '"name":"bar\"ba\"rossa"'.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd.
	importer reset.
	parser fromString: '"name"  :   "bar\"ba\"rossa"  '.
	parser Property.
	self assert: importer contents equals: a.
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testSerial [
	parser fromString: '"id":42'.
	parser Serial.
	self assert: importer contents equals: #(#(#serial: 42)).
	self assert: parser atEnd.
	self setUp.
	parser fromString: '"id" :  42 '.
	parser Serial.
	self assert: importer contents equals: #(#(#serial: 42)).
	self assert: parser atEnd.
	self setUp
]

{ #category : #tests }
FMJSONParserTest >> testSimpleDocument [
	parser fromString: '[]'.
	parser Document.
	self assert: importer contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: parser atEnd.
	importer reset.
	parser fromString: '  [  ]   '.
	parser Document.
	self assert: importer contents equals: #(#(#beginDocument) #(#endDocument)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueFloat [
	importer reset.
	parser fromString: '3.14'.
	parser Value.
	self assert: importer contents equals: #(#(#primitive: 3.14)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueFloatError [
	importer reset.
	parser fromString: '3.14e$'.
	self should: [ parser Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMJSONParserTest >> testValueFloatError2 [
	importer reset.
	parser fromString: '1..2'.
	self should: [ parser Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMJSONParserTest >> testValueFloatWithExponent [
	importer reset.
	parser fromString: '1.291e3'.
	parser Value.
	self assert: importer contents equals: #(#(#primitive: 1291)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueNegativeNumber [
	importer reset.
	parser fromString: '-42'.
	parser Value.
	self assert: importer contents equals: #(#(#primitive: -42)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueNegativeNumberError [
	importer reset.
	parser fromString: '--42'.
	parser Value.
	self assertEmpty: importer contents.
	self assert: parser position equals: 1
]

{ #category : #tests }
FMJSONParserTest >> testValueNumber [
	importer reset.
	parser fromString: '13'.
	parser Value.
	self assert: importer contents equals: #(#(#primitive: 13)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueReference [
	importer reset.
	parser fromString: '{"ref": 24}'.
	parser Value.
	self assert: importer contents equals: #(#(#referenceNumber: 24)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueReferenceBigInteger [
	importer reset.
	parser fromString: '{"ref": 112233445566778899}'.
	parser Value.
	self assert: importer contents equals: #(#(#referenceNumber: 112233445566778899)).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueReferenceFullName [
	importer reset.
	parser fromString: '{"ref": "EG.Foo"}'.
	parser Value.
	self assert: importer contents equals: #(#(#referenceName: 'EG.Foo')).
	self assert: parser atEnd
]

{ #category : #tests }
FMJSONParserTest >> testValueReferenceName [
	importer reset.
	parser fromString: '{"ref": "Foo"}'.
	parser Value.
	self assert: importer contents equals: #(#(#referenceName: 'Foo')).
	self assert: parser atEnd
]
