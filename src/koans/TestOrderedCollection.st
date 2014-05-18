Koan subclass: TestOrderedCollection [
  <comment: 'A collection of ordered collection tests.'>

  testActsLikeAnExpandableArray [
    | orderedCollection |

    orderedCollection := OrderedCollection new.
    orderedCollection
      add: 1;
      add: 2;
      add: 3.

    self expect: 1 toEqual: (orderedCollection at: 1).
    self expect: 2 toEqual: (orderedCollection at: 2).
    self expect: 3 toEqual: (orderedCollection at: 3).
  ]

  testCreatingAnOrderedCollectionWithUpToFiveInitialValues [
    | orderedCollection |

    orderedCollection := OrderedCollection with: $a with: $b with: $c with: $d with: $e.

    self expect: orderedCollection toEqual: #($a $b $c $d $e) asOrderedCollection.
    self expect: [ OrderedCollection with: 'a' with: 'b' with: 'c' with: 'd' with: 'e' with: 'f' ] toRaise: MessageNotUnderstood.

    "OrderedCollection belongs to the same hierarchy family as Array."
  ]

  testCreatingAnOrderedCollectionFromAnArray [
    | orderedCollection |

    orderedCollection := OrderedCollection new addAll: {5. 6. 7}; yourself.

    self expect: orderedCollection toEqual: #(5 6 7) asOrderedCollection.
  ]

  testAddElements [
    | orderedCollection |

    orderedCollection := OrderedCollection with: 1.

    self expect: #(1) asOrderedCollection toEqual: orderedCollection.

    orderedCollection addFirst: 2.

    self expect: #(2 1) asOrderedCollection toEqual: orderedCollection.

    orderedCollection addLast: 3.

    self expect: #(2 1 3) asOrderedCollection toEqual: orderedCollection.

    orderedCollection add: 4 afterIndex: 2.

    self expect: #(2 1 4 3) asOrderedCollection toEqual: orderedCollection.

    orderedCollection add: 5 beforeIndex: 2.

    self expect: #(2 5 1 4 3) asOrderedCollection toEqual: orderedCollection.
  ]

  testRemoveElements [
    | orderedCollection |

    orderedCollection := OrderedCollection with: 1 with: 2 with: 3 with: 4.
    orderedCollection removeFirst.

    self expect: #(2 3 4) asOrderedCollection toEqual: orderedCollection.

    orderedCollection removeLast.

    self expect: #(2 3) asOrderedCollection toEqual: orderedCollection.

    orderedCollection removeAtIndex: 1.

    self expect: #(3) asOrderedCollection toEqual: orderedCollection.
  ]

  testAccessingElements [
    | orderedCollection |

    orderedCollection := #(5 6 7 8) asOrderedCollection.

    self expect: 5 toEqual: (orderedCollection at: 1).
    self expect: 5 toEqual: orderedCollection first.
    self expect: 6 toEqual: orderedCollection second.
    self expect: 7 toEqual: orderedCollection third.
    self expect: 8 toEqual: orderedCollection fourth.
  ]

  testComparingOrderedCollections [
    | orderedCollection anotherOrderedCollection |

    orderedCollection := OrderedCollection with: 1 with: 2.
    anotherOrderedCollection := OrderedCollection with: 2 with: 1.

    self expect: false toEqual: (orderedCollection = anotherOrderedCollection).
  ]
]
