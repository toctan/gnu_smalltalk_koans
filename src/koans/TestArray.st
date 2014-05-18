Koan subclass: TestArray [
  <comment: 'A collection of array tests.'>

  testCreatingAnEmptyArray [
    | emptyArray |

    emptyArray := Array new.

    self expect: Array toEqual: emptyArray class.
    self expect: 0 toEqual: emptyArray size.
    self expect: true toEqual: emptyArray isEmpty.

    "Not sure why you would do this.  See the next koan."
  ]

  testCreatingAnArrayWithSpecifiedSize [
    | array |

    "Arrays are not dynamic, but fixed with the size specified."

    array := Array new: 4.

    self expect: 4 toEqual: array size.
    self expect: false toEqual: array isEmpty.

    "Array index starts at 1, not 0 like most languages."

    self expect: nil toEqual: (array at: 1).

    "Arrays can accept any kind of object."

    array
      at: 1 put: 'abc';
      at: 2 put: 10;
      at: 3 put: false;
      at: 4 put: $x.

    self expect: 'abc' toEqual: (array at: 1).
    self expect: 10 toEqual: (array at: 2).
    self expect: false toEqual: (array at: 3).
    self expect: $x toEqual: (array at: 4).
  ]

  testCreatingAnArrayWithUpToFiveInitialValues [
    | array |

    array := Array with: 2 with: 4 with: 6 with: 8 with: 10.

    self expect: #(2 4 6 8 10) toEqual: array.
    self expect: [ Array with: 1 with: 3 with: 5 with: 7 with: 9 with: 11 ] toRaise: MessageNotUnderstood.
  ]

  testConstantArraysAreImmutable [
    | array |

    array := #('a' 'b' 'c').

    self expect: [ array at: 1 put: 'd' ] toRaise: SystemExceptions.ReadOnlyObject.

    "#() only accepts literal values."
  ]

  testReplaceValueAtElement [
    | array |

    array := (Array new: 4) at: 1 put: 1; yourself.
    array at: 1 put: 2.

    self expect: 2 toEqual: (array at: 1).
  ]

  testCreatingAnArrayThatEvaluatesExpressions [
    | array |

    array := { 1-1 . 2 squared . 3+4 }.

    self expect: #(0 4 7) toEqual: array.

    array at: 1 put: 5.

    self expect: #(5 4 7) toEqual: array.
  ]

  testAccessingElements [
    | array |

    array := #(0 1 2 3).

    self expect: 0 toEqual: (array at: 1).
    self expect: 0 toEqual: array first.
    self expect: 1 toEqual: array second.
    self expect: 2 toEqual: array third.
    self expect: 3 toEqual: array fourth.
  ]

  testIncludesElement [
    | array |

    array := Array with: 1 with: 2 with: 3.

    self expect: true toEqual: (array includes: 2).
    self expect: false toEqual: (array includes: 4).
  ]

  testOccurrences [
    | array |

    array := #(1 2 2 3 4 4 2 6 8).

    self expect: 3 toEqual: (array occurrencesOf: 2).
  ]
]
