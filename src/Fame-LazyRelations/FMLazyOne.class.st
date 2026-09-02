Class {
	#name : 'FMLazyOne',
	#superclass : 'FMLazyValue',
	#category : 'Fame-LazyRelations',
	#package : 'Fame-LazyRelations'
}

{ #category : 'accessing' }
FMLazyOne >> materializeFor: anObject slot: aSlot [

    | holder value |
	
    holder := FMLazyOneHolder new.

    loader
        value: holder
        value: anObject.

    value := holder value.

    aSlot
        writeMaterialized: value
        to: anObject.

    value ifNotNil: [
        aSlot
            addAssociationFrom: anObject
            to: value ].

    ^ value
]
