Koan subclass: TestDictionary [
  <comment: 'A collection of dictionary tests.'>

  testCreatingANewDictionary [
    | dictionary |

    dictionary := Dictionary new.

    self expect: true toEqual: dictionary isEmpty.
    self expect: 0 toEqual: dictionary size.
  ]

  testAddingKeysAndValuesUsingAssociations [
    | dictionary |

    dictionary := Dictionary new
                    add: #a   -> 1;
                    add: 'b'  -> 2;
                    add: 100  -> 3;
                    add: true -> 4;
                    add: nil  -> 5;
                    yourself.

    self expect: 1 toEqual: (dictionary at: #a).
    self expect: 2 toEqual: (dictionary at: 'b').
    self expect: 3 toEqual: (dictionary at: 100).
    self expect: 4 toEqual: (dictionary at: true).
    self expect: 5 toEqual: (dictionary at: nil).
  ]

  testAddingAssociationsUsingAtPut [
    | dictionary |

    dictionary := Dictionary new
                    at: #a put: 1;
                    at: #b put: 2;
                    yourself.

    self expect: 1 toEqual: (dictionary at: #a).
    self expect: 2 toEqual: (dictionary at: #b).
  ]

  testReplaceValueAtKey [
    | dictionary |

    dictionary := Dictionary new.

    dictionary at: #a put: 1.
    dictionary at: #a put: 2.

    self expect: 2 toEqual: (dictionary at: #a).
  ]

  testRetrievingCollectionOfKeysAndValues [
    | dictionary |

    dictionary := Dictionary new.

    self expect: #() asSet toEqual: dictionary keys.
    self expect: #() toEqual: dictionary values.

    dictionary add: #a -> 1.
    dictionary add: #b -> 2.
    dictionary add: #c -> 3.

    self expect: #(#a #b #c) asSet toEqual: dictionary keys.
    self expect: #(1 2 3) toEqual: dictionary values.
    self expect: Set toEqual: dictionary keys class.
    self expect: Array toEqual: dictionary values class.

    "Why do you think the classes are different?"
  ]

  testRemoveKey [
    | dictionary value |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 3;
                    yourself.

    value := dictionary removeKey: #a.

    self expect: 1 toEqual: value.
    self expect: #(#b) asSet toEqual: dictionary keys.

    self expect: [ dictionary removeKey: #c ] toRaise: SystemExceptions.NotFound.

    value := dictionary removeKey: #c ifAbsent: [0].

    self expect: 0 toEqual: value.
  ]

  testIncludesKey [
    | dictionary |

    dictionary := Dictionary new
                    add: #daft -> 5;
                    add: #duck -> 55;
                    yourself.

    self expect: true toEqual: (dictionary includesKey: #daft).
    self expect: false toEqual: (dictionary includesKey: #monk).
    self expect: false toEqual: (dictionary includesKey: 'daft').
  ]

  testIteratingKeys [
    | dictionary set |

    dictionary := Dictionary new
                    add: #a -> 2;
                    add: #c -> 4;
                    add: #e -> 6;
                    yourself.
    set := Set new.

    dictionary keysDo: [ :key |
      set add: key.
    ].

    self expect: dictionary keys toEqual: set.
  ]

  testIteratingAssociations [
    | dictionary array counter |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 2;
                    add: #c -> 3;
                    yourself.
    array := Array new: dictionary size.
    counter := 1.

    dictionary associationsDo: [ :association |
      array at: counter put: association.
      counter := counter + 1.
    ].
    array sort.

    self expect: {#a->1. #b->2. #c->3}  toEqual: array.
    "Be careful how you craft the array."
  ]

  testIteratingKeysAndValues [
    | dictionary set |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 2;
                    add: #c -> 3;
                    yourself.
    set := Set new.

    dictionary keysAndValuesDo: [ :key :value |
      set add: (key -> value).
    ].

    self expect: {#a->1. #b->2. #c->3}  asSet toEqual: set.
  ]

  testSmalltalkDictionary [
    self expect: SystemDictionary toEqual: Smalltalk class.
    self expect: true toEqual: (Smalltalk isKindOf: Dictionary).
  ]
]
