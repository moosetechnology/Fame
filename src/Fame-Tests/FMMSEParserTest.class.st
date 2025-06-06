Class {
	#name : #FMMSEParserTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'importer',
		'tokens'
	],
	#category : #'Fame-Tests'
}

{ #category : #accessing }
FMMSEParserTest class >> famix30mse [
	^ '((FM3.Package
		(id: 8)
		(name ''Famix'')
		(classes 
			(FM3.Class 
				(id: 1)
				(name ''Access'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 51)
						(name ''isWrite'')
						(type (ref: Boolean)))
					(FM3.Property 
						(id: 44)
						(name ''accessor'')
						(opposite (ref: 18))
						(type (ref: 19)))
					(FM3.Property 
						(id: 6)
						(name ''variable'')
						(opposite (ref: 27))
						(type (ref: 29)))
					(FM3.Property 
						(id: 22)
						(name ''isRead'')
						(derived true)
						(type (ref: Boolean)))))
			(FM3.Class 
				(id: 28)
				(name ''Parameter'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 62)
						(name ''parentBehaviouralEntity'')
                        (container true)
						(opposite (ref: 61))
						(type (ref: 19)))))
			(FM3.Class 
				(id: 29)
				(name ''StructuralEntity'')
				(superclass (ref: 45))
				(properties 
					(FM3.Property 
						(id: 30)
						(name ''declaredType'')
						(type (ref: 66)))
					(FM3.Property 
						(id: 27)
						(name ''incomingAccesses'')
						(derived true)
						(multivalued true)
						(opposite (ref: 6))
						(type (ref: 1)))))
			(FM3.Class 
				(id: 63)
				(name ''ContainerEntity'')
				(superclass (ref: 70))
				(properties 
					(FM3.Property 
						(id: 3)
						(name ''outgoingReferences'')
						(derived true)
						(multivalued true)
						(opposite (ref: 5))
						(type (ref: 50)))
					(FM3.Property 
						(id: 38)
						(name ''types'')
						(derived true)
						(multivalued true)
						(opposite (ref: 56))
						(type (ref: 66)))
					(FM3.Property 
						(id: 43)
						(name ''incomingReferences'')
						(derived true)
						(multivalued true)
						(opposite (ref: 9))
						(type (ref: 50)))))
			(FM3.Class 
				(id: 45)
				(name ''LeafEntity'')
				(superclass (ref: 70)))
			(FM3.Class 
				(id: 10)
				(name ''Association'')
				(superclass (ref: 33))
				(properties
					(FM3.Property 
						(id: 57)
						(name ''below'')
						(derived true)
						(opposite (ref: 35))
						(type (ref: 10)))
					(FM3.Property 
						(id: 35)
						(name ''above'')
						(opposite (ref: 57))
						(type (ref: 10))))
			)
			(FM3.Class 
				(id: 11)
				(name ''Attribute'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 31)
						(name ''parentClass'')
                        (container true)
						(opposite (ref: 47))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 32)
				(name ''LocalVariable'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 4)
						(name ''parentBehaviouralEntity'')
                        (container true)
						(opposite (ref: 39))
						(type (ref: 19)))))
			(FM3.Class 
				(id: 14)
				(name ''Method'')
				(superclass (ref: 19))
				(properties 
					(FM3.Property 
						(id: 20)
						(name ''parentClass'')
                        (container true)
						(opposite (ref: 60))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 13)
				(name ''Package'')
				(superclass (ref: 67))
				(properties 
					(FM3.Property 
						(id: 2)
						(name ''childNamedEntities'')
						(derived true)
						(multivalued true)
						(opposite (ref: 24))
						(type (ref: 70)))))
			(FM3.Class 
				(id: 15)
				(name ''GlobalVariable'')
				(superclass (ref: 29))
				(properties 
					(FM3.Property 
						(id: 12)
						(name ''parentNamespace'')
                        (container true)
						(opposite (ref: 59))
						(type (ref: 67)))))
			(FM3.Class 
				(id: 33)
				(name ''Entity'')
				(properties 
					(FM3.Property 
						(id: 64)
						(name ''sourceAnchor'')
						(multivalued true)
						(type (ref: String)))))
			(FM3.Class 
				(id: 66)
				(name ''Type'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 68)
						(name ''subInheritances'')
						(derived true)
						(multivalued true)
						(opposite (ref: 16))
						(type (ref: 23)))
					(FM3.Property 
						(id: 60)
						(name ''methods'')
						(derived true)
						(multivalued true)
						(opposite (ref: 20))
						(type (ref: 14)))
					(FM3.Property 
						(id: 56)
						(name ''container'')
                        (container true)
						(opposite (ref: 38))
						(type (ref: 63)))
					(FM3.Property 
						(id: 26)
						(name ''superInheritances'')
						(derived true)
						(multivalued true)
						(opposite (ref: 55))
						(type (ref: 23)))
					(FM3.Property 
						(id: 47)
						(name ''attributes'')
						(derived true)
						(multivalued true)
						(opposite (ref: 31))
						(type (ref: 11)))))
			(FM3.Class 
				(id: 50)
				(name ''Reference'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 9)
						(name ''to'')
						(opposite (ref: 43))
						(type (ref: 63)))
					(FM3.Property 
						(id: 5)
						(name ''from'')
						(opposite (ref: 3))
						(type (ref: 63)))))
			(FM3.Class 
				(id: 67)
				(name ''ScopingEntity'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 7)
						(name ''childNamespaces'')
						(derived true)
						(multivalued true)
						(opposite (ref: 40))
						(type (ref: 67)))
					(FM3.Property 
						(id: 40)
						(name ''parentNamespace'')
                        (container true)
						(opposite (ref: 7))
						(type (ref: 67)))
					(FM3.Property 
						(id: 59)
						(name ''globalVariables'')
						(derived true)
						(multivalued true)
						(opposite (ref: 12))
						(type (ref: 15)))))
			(FM3.Class 
				(id: 17)
				(name ''Namespace'')
				(superclass (ref: 67)))
			(FM3.Class 
				(id: 19)
				(name ''BehaviouralEntity'')
				(superclass (ref: 63))
				(properties 
					(FM3.Property 
						(id: 58)
						(name ''outgoingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 65))
						(type (ref: 71)))
					(FM3.Property 
						(id: 25)
						(name ''incomingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 42))
						(type (ref: 71)))						
					(FM3.Property 
						(id: 39)
						(name ''localVariables'')
						(derived true)
						(multivalued true)
						(opposite (ref: 4))
						(type (ref: 32)))
					(FM3.Property 
						(id: 61)
						(name ''parameters'')
						(derived true)
						(multivalued true)
						(opposite (ref: 62))
						(type (ref: 28)))
					(FM3.Property 
						(id: 18)
						(name ''outgoingAccesses'')
						(derived true)
						(multivalued true)
						(opposite (ref: 44))
						(type (ref: 1)))
					(FM3.Property 
						(id: 72)
						(name ''signature'')
						(type (ref: String)))))
			(FM3.Class 
				(id: 70)
				(name ''NamedEntity'')
				(superclass (ref: 33))
				(properties 
					(FM3.Property 
						(id: 69)
						(name ''name'')
						(type (ref: String)))
					(FM3.Property 
						(id: 46)
						(name ''isStub'')
						(type (ref: Boolean)))
					(FM3.Property 
						(id: 54)
						(name ''receivingInvocations'')
						(derived true)
						(multivalued true)
						(opposite (ref: 34))
						(type (ref: 71)))
					(FM3.Property 
						(id: 52)
						(name ''modifiers'')
						(multivalued true)
						(type (ref: String)))
					(FM3.Property 
						(id: 49)
						(name ''belongsTo'')
						(derived true)
						(type (ref: 63)))
					(FM3.Property 
						(id: 24)
						(name ''packagedIn'')
						(opposite (ref: 2))
						(type (ref: 13)))))
			(FM3.Class 
				(id: 21)
				(name ''Class'')
				(superclass (ref: 66))
				(properties 
					(FM3.Property 
						(id: 48)
						(name ''isAbstract'')
						(type (ref: Boolean)))))
			(FM3.Class 
				(id: 23)
				(name ''Inheritance'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 16)
						(name ''superclass'')
						(opposite (ref: 68))
						(type (ref: 66)))
					(FM3.Property 
						(id: 55)
						(name ''subclass'')
						(opposite (ref: 26))
						(type (ref: 66)))))
			(FM3.Class 
				(id: 71)
				(name ''Invocation'')
				(superclass (ref: 10))
				(properties 
					(FM3.Property 
						(id: 65)
						(name ''sender'')
						(opposite (ref: 58))
						(type (ref: 19)))
					(FM3.Property 
						(id: 34)
						(name ''receiver'')
						(opposite (ref: 54))
						(type (ref: 70)))
					(FM3.Property 
						(id: 53)
						(name ''receiverSourceCode'')
						(type (ref: String)))
					(FM3.Property 
						(id: 36)
						(name ''signature'')
						(type (ref: String)))
					(FM3.Property 
						(id: 42)
						(name ''candidates'')
						(multivalued true)
						(opposite (ref: 25))
						(type (ref: 19))))))))


'
]

{ #category : #accessing }
FMMSEParserTest class >> sampleMetaMse [
	^ '("Meta-model of above file"
   (FM3.Package
       (name ''LIB'')
       (classes
           (FM3.Class
               (name ''Library'')
               (properties
                   (FM3.Property
                       (name ''librarian'')
                       (type (ref: 2)))
                   (FM3.Property
                       (name ''books'')
                       (multivalued true)
                       (type (ref: 1)))))
           (FM3.Class (id: 1)
               (name ''Book'')
               (properties
                   (FM3.Property
                       (name ''title'')
                       (type (ref: String)))
                   (FM3.Property (id: 100)
                       (name ''authors'')
                       (multivalued true)
                       (type (ref: 2)))))
           (FM3.Class (id: 2)
               (name ''Person'')
               (properties
                   (FM3.Property
				(opposite (ref: 100))
				(name ''books'')
                       (multivalued true)
                       (type (ref: 1)))
                   (FM3.Property
                       (name ''name'')
                       (type (ref: String))))))))'
]

{ #category : #accessing }
FMMSEParserTest class >> sampleMse [
	^ '("Sample MSE file"
   (LIB.Library
       (librarian
           (LIB.Person
               (name ''Adrian Kuhn'')))
       (books
           (LIB.Book
               (title ''Design Patterns'')
               (authors (ref: 1) (ref: 2) (ref: 3) (ref: 4)))
           (LIB.Book
               (title ''Eclipse: Principles, Patterns, and Plug-Ins'')
               (authors (ref: 1) (ref: 5)))
           (LIB.Book
               (title ''Smalltalk Best Practice Patterns'')
               (authors (ref: 5)))))
   (LIB.Person (id: 1)
       (name ''Erich Gamma''))
   (LIB.Person (id: 2)
       (name ''Richard Helm''))
   (LIB.Person(id: 3)
       (name ''Ralph Johnson''))
   (LIB.Person(id: 4)
       (name ''John Vlissides''))
   (LIB.Person(id: 5)
       (name ''Kent Beck'')))'
]

{ #category : #tests }
FMMSEParserTest >> famix30mseNames [

	^ { 'Famix.Invocation.sender'. 'Famix.Parameter.parentBehaviouralEntity'.
	  'Famix.ContainerEntity.incomingReferences'.
	  'Famix.Class'. 'Famix.ScopingEntity.parentNamespace'.
	  'Famix.Inheritance.superclass'. 'Famix.Type.methods'.
	  'Famix.StructuralEntity.incomingAccesses'.
	  'Famix.Invocation.receiverSourceCode'.
	  'Famix.Association.below'. 'Famix.Reference'. 'Famix.Type.container'.
	  'Famix.ScopingEntity.globalVariables'.
	  'Famix.StructuralEntity'. 'Famix.Invocation.candidates'.
	  'Famix.LocalVariable.parentBehaviouralEntity'.
	  'Famix.LocalVariable'. 'Famix.ContainerEntity'.
	  'Famix.Type.superInheritances'. 'Famix.Association.above'.
	  'Famix.ContainerEntity.outgoingReferences'.
	  'Famix.Reference.from'. 'Famix.Type.attributes'.
	  'Famix.Class.isAbstract'. 'Famix'. 'Famix.Entity'. 'Famix.Inheritance.subclass'.
	  'Famix.BehaviouralEntity.outgoingAccesses'.
	  'Famix.LeafEntity'. 'Famix.StructuralEntity.declaredType'.
	  'Famix.Reference.to'. 'Famix.Type'. 'Famix.ScopingEntity'.
	  'Famix.BehaviouralEntity.parameters'.
	  'Famix.Association'. 'Famix.Namespace'. 'Famix.BehaviouralEntity.localVariables'.
	  'Famix.BehaviouralEntity'. 'Famix.Access.accessor'.
	  'Famix.Attribute.parentClass'. 'Famix.Method'. 'Famix.ScopingEntity.childNamespaces'.
	  'Famix.NamedEntity.name'. 'Famix.NamedEntity.isStub'.
	  'Famix.NamedEntity.modifiers'. 'Famix.NamedEntity'.
	  'Famix.Inheritance'. 'Famix.NamedEntity.packagedIn'.
	  'Famix.Invocation.signature'. 'Famix.Invocation'. 'Famix.Access'.
	  'Famix.GlobalVariable.parentNamespace'.
	  'Famix.Access.isWrite'. 'Famix.Entity.sourceAnchor'.
	  'Famix.Type.subInheritances'. 'Famix.Parameter'. 'Famix.BehaviouralEntity.incomingInvocations'.
	  'Famix.NamedEntity.receivingInvocations'.
	  'Famix.Invocation.receiver'. 'Famix.ContainerEntity.types'.
	  'Famix.Package.childNamedEntities'.
	  'Famix.Method.parentClass'. 'Famix.Access.isRead'.
	  'Famix.Access.variable'. 'Famix.NamedEntity.belongsTo'.
	  'Famix.Package'. 'Famix.Attribute'. 'Famix.BehaviouralEntity.signature'.
	  'Famix.BehaviouralEntity.outgoingInvocations'.
	  'Famix.GlobalVariable' }
]

{ #category : #tests }
FMMSEParserTest >> numbersToParseAndRealValues [

	^ Dictionary
		  newFromKeys:
			  { '14'. '1'. '-1'. '12.91'. '-47.11'. '1.1'. '-1.1'. '12.91e33'.
			  '-47.11e22'. '-23.11e-15'. '1.1e2'. '-1.1e2' }
		  andValues:
			  { 14. 1. -1. 12.91. -47.11. 1.1. -1.1. 1.291e34. -4.711e23.
			  -2.311e-14. 110.0. -110.0 }
]

{ #category : #running }
FMMSEParserTest >> setUp [

	super setUp.

	parser := FMMSEParser new.
	importer := FMDebugImporter new.
	parser importer: importer
]

{ #category : #tests }
FMMSEParserTest >> testBacktrack [

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
FMMSEParserTest >> testEmptyDocument [

	parser fromString: ''.
	parser Document.

	self
		assert: importer contents
		equals: #( #( #beginDocument ) #( #endDocument ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEmptyExportString [

	parser fromString: ''.
	parser Document.
	self assert: importer exportMSEString equals: '()'
]

{ #category : #tests }
FMMSEParserTest >> testEntity [

	tokens := #( #( #beginEntity: 'Foo' ) #( #endEntity: 'Foo' ) ).

	parser fromString: '(Foo)'.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.
	importer reset.

	parser fromString: '(  Foo  )  '.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithID [

	tokens := #( #( #beginEntity: 'Foo' ) #( #serial: 42 ) #( #endEntity:
	           'Foo' ) ).

	parser fromString: '(Foo(id:42))'.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.
	importer reset.

	parser fromString: '(  Foo  (  id:  42  )  )  '.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithPropertys [

	tokens := #( #( #beginEntity: 'Foo' ) #( #beginProperty: 'name' )
	        #( #endProperty: 'name' ) #( #beginProperty: 'count' )
	        #( #endProperty: 'count' ) #( #endEntity: 'Foo' ) ).

	parser fromString: '(Foo(name)(count))'.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  Foo  (  name  )  (  count  )  )  '.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testEntityWithPropertysAndID [

	tokens := #( #( #beginEntity: 'Foo' ) #( #serial: 42 )
	             #( #beginProperty: 'name' ) #( #endProperty:
	                'name' ) #( #beginProperty: 'count' )
	             #( #endProperty: 'count' ) #( #endEntity: 'Foo' ) ).

	parser fromString: '(Foo(id:42)(name)(count))'.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.
	importer reset.

	parser fromString:
		'(  Foo  (  id:  42  )  (  name  )  (  count  )  )  '.
	parser Entity.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFamixModel [

	| metamodel famixPackage accessClass accessorProperty behaviouralEntity outgoingAccesses |

	metamodel := FMMetaModel fromString: self class famix30mse.

	self
		assertCollection:
		(metamodel elements collect: [ :each | each fullName ])
		hasSameElements: self famix30mseNames.

	famixPackage := metamodel packageNamed: 'Famix'.
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
FMMSEParserTest >> testFullDocument [

	parser fromString: self class famix30mse.
	parser Document.
	self assert: importer contents first equals: #( #beginDocument ).
	self assert: importer contents size > 200. " = many"
	self assert: importer contents last equals: #( #endDocument ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName [

	| parsedName |

	parser fromString: 'Foo'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'Foo'.
	self assert: parser atEnd.

	parser fromString: 'A'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'A'.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName2 [

	| parsedName |

	parser fromString: 'Foo.Bar'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'Foo.Bar'.
	self assert: parser atEnd.

	parser fromString: 'A.b'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'A.b'.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullName3 [

	| parsedName |

	parser fromString: 'Foo.Bar.Qux'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'Foo.Bar.Qux'.
	self assert: parser atEnd.

	parser fromString: 'A.b.q'.
	parsedName := parser tFULLNAME.
	self assert: parsedName equals: 'A.b.q'.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testFullNameDotDotFails [

	parser fromString: 'Foo..Bar'.
	self should: [ parser tFULLNAME ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testFullNameTrailingDotFails [

	parser fromString: 'Foo.'.
	self should: [ parser tFULLNAME ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testImporter [

	self assert: parser importer equals: importer
]

{ #category : #tests }
FMMSEParserTest >> testMatchString [

	| parsedString |

	parser fromString: '''Lorem'''.
	parsedString := parser String.
	self assert: parsedString equals: 'Lorem'.
	self assert: parser atEnd.

	parser fromString: '''Eo''ipso'''.
	parsedString := parser String.
	self assert: parsedString equals: 'Eo'.
	self assert: parser peek equals: $i.

	parser fromString: '''Eo''''ipso'''.
	parsedString := parser String.
	self assert: parsedString equals: 'Eo''ipso'.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testNumber [

	self numbersToParseAndRealValues keysAndValuesDo: [ :string :value |
		| parsedNumber |

		parser fromString: string.
		parsedNumber := parser Number.
		self assert: parsedNumber equals: value.
		self assert: parser atEnd ]
]

{ #category : #tests }
FMMSEParserTest >> testNumberTrailingDotFails [

	parser fromString: '12.'.
	self should: [ parser Number ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testNumberTrailingLetterFails [

	parser fromString: '12.11e'.
	self should: [ parser Number ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testNumberWithTrailingX [

	| parsedNumber |

	parser fromString: '-23x'.
	parsedNumber := parser Number.

	self assert: parsedNumber equals: -23.
	self assert: parser peek equals: $x
]

{ #category : #tests }
FMMSEParserTest >> testProperty [

	tokens := #( #( #beginProperty: 'name' ) #( #endProperty:
	                'name' ) ).

	parser fromString: '(name)'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name  )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyNameWithUnderscore [

	tokens := #( #( #beginProperty: 'name_with_underscore' )
	             #( #endProperty: 'name_with_underscore' ) ).

	parser fromString: '(name_with_underscore)'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name_with_underscore  )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithBoolean [

	tokens := #( #( #beginProperty: 'name' ) #( #primitive: true )
	             #( #primitive: false ) #( #endProperty: 'name' ) ).

	parser fromString: '(name true false)'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name   true   false  )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithEntitys [

	tokens := #( #( #beginProperty: 'name' ) #( #beginEntity:
	                'Foo' ) #( #endEntity: 'Foo' ) #( #beginEntity:
	                'Bar' ) #( #endEntity: 'Bar' ) #( #endProperty:
	                'name' ) ).

	parser fromString: '(name(Foo)(Bar))'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name  (  Foo  )  (  Bar  )     )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithNumbers [

	tokens := #( #( #beginProperty: 'name' ) #( #primitive: 1 )
	             #( #primitive: 2 ) #( #primitive: 3 ) #( #endProperty:
	                'name' ) ).

	parser fromString: '(name 1 2 3)'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name    1    2    3  )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithReferences [

	tokens := #( #( #beginProperty: 'name' ) #( #referenceNumber:
	                2 ) #( #referenceNumber: 3 ) #( #endProperty:
	                'name' ) ).

	parser fromString: '(name(ref:2)(ref:3))'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name  (  ref:  2  )  (  ref:  3  )     )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithStrings [

	tokens := #( #( #beginProperty: 'name' ) #( #primitive: 'bar' )
	             #( #primitive: 'ba' ) #( #primitive: 'rossa' )
	             #( #endProperty: 'name' ) ).

	parser fromString: '(name ''bar'' ''ba'' ''rossa'')'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name  ''bar''      ''ba''      ''rossa'')  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testPropertyWithStrings2 [

	tokens := #( #( #beginProperty: 'name' ) #( #primitive: 'bar''ba''rossa' )
	             #( #endProperty: 'name' ) ).

	parser fromString: '(name ''bar''''ba''''rossa'')'.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  name  ''bar''''ba''''rossa''     )  '.
	parser Property.
	self assert: importer contents equals: tokens.
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testSerial [

	parser fromString: '(id:42)'.

	parser Serial.
	self assert: importer contents equals: #( #( #serial: 42 ) ).
	self assert: parser atEnd.

	importer reset.
	parser fromString: '(  id:  42  )'.
	parser Serial.
	self assert: importer contents equals: #( #( #serial: 42 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testSimpleDocument [

	parser fromString: '()'.
	parser Document.
	self
		assert: importer contents
		equals: #( #( #beginDocument ) #( #endDocument ) ).
	self assert: parser atEnd.

	importer reset.
	parser fromString: '  (  )  '.
	parser Document.
	self
		assert: importer contents
		equals: #( #( #beginDocument ) #( #endDocument ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueFloat [

	parser fromString: '3.14'.
	parser Value.
	self assert: importer contents equals: #( #( #primitive: 3.14 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatError [

	parser fromString: '3.14e$'.
	self should: [ parser Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatError2 [

	parser fromString: '1..2'.
	self should: [ parser Value ] raise: FMSyntaxError
]

{ #category : #tests }
FMMSEParserTest >> testValueFloatWithExponent [

	parser fromString: '1.291e3'.
	parser Value.
	self assert: importer contents equals: #( #( #primitive: 1291 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueNegativeNumber [

	parser fromString: '-42'.
	parser Value.
	self assert: importer contents equals: #( #( #primitive: -42 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueNegativeNumberError [

	parser fromString: '--42'.
	parser Value.
	self assertEmpty: importer contents.
	self assert: parser position equals: 1
]

{ #category : #tests }
FMMSEParserTest >> testValueNumber [

	parser fromString: '13'.
	parser Value.
	self assert: importer contents equals: #( #( #primitive: 13 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReference [

	parser fromString: '(ref: 24)'.
	parser Value.
	self assert: importer contents equals: #( #( #referenceNumber:
	      24 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceBigInteger [

	parser fromString: '(ref: 112233445566778899)'.
	parser Value.
	self
		assert: importer contents
		equals: #( #( #referenceNumber: 112233445566778899 ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceFullName [

	parser fromString: '(ref: EG.Foo)'.
	parser Value.
	self
		assert: importer contents
		equals: #( #( #referenceName: 'EG.Foo' ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceName [

	parser fromString: '(ref: Foo)'.
	parser Value.
	self
		assert: importer contents
		equals: #( #( #referenceName: 'Foo' ) ).
	self assert: parser atEnd
]

{ #category : #tests }
FMMSEParserTest >> testValueReferenceStringError [

	parser fromString: '(ref: ''String'')'.
	self should: [ parser Value ] raise: FMSyntaxError
]
