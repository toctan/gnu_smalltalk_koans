Koan subclass: TestString [
  <comment: 'A collection of string tests.'>

  testStringsCanOnlyBeCreatedUsingSingleQuotes [
    | string |

    string := 'Hello World'.

    self expect: 'Hello World' toEqual: string.
  ]

  testUseSingleQuotesInStrings [
    | string |

    string := 'Bob''s Bakery'.

    self expect: 'Bob''s Bakery' toEqual: string.
    "No quote escaping or character escaping of any kind exist."
  ]

  testStringConcatenation [
    | string |

    string := 'Hello ', 'World'.

    self expect: 'Hello World' toEqual: string.

    "Concatenation does not quite work this way..."
    self expect: [ 'Hello ' + 'World' ] toRaise: MessageNotUnderstood.
  ]

  testStringConcatenationWillLeaveOriginalStringsUnmodified [
    | stringA stringB stringC |

    stringA := 'Good day, '.
    stringB := 'sir!'.
    stringC := stringA, stringB.

    self expect: 'Good day, ' toEqual: stringA.
    self expect: 'sir!' toEqual: stringB.
  ]

  testStringInterpolation [
    | string |

    string := '%1 is really cool'.

    self expect: 'Smalltalk is really cool' toEqual: (string % { 'Smalltalk' }).
  ]

  testSmalltalkExpressionMayBeInterpolated [
    | string |

    string := 'I am %1 years old'.

    self expect: 'I am 25 years old' toEqual: (string % { 5 squared }).
  ]

  testSubstring [
    | string |

    string := 'Smalltalk'.

    self expect: 'talk' toEqual: (string copyFrom: 6 to: 9).
  ]

  testItWillRaiseExceptionIfIndexIsOutOfBounds [
    | string |

    string := 'Smalltalk'.

    self expect: [ string copyFrom: 6 to: 10 ] toRaise: SystemExceptions.IndexOutOfRange
  ]

  testSingleCharacterFromString [
    | string |

    string := 'Smalltalk'.

    self expect: $S toEqual: (string at: 1).
    self expect: $t toEqual: (string at: 6).

    "Characters will be covered in another koan."
  ]

  testUniquenessOfStringObjects [
    | a b |

    a := 'a string'.
    b := 'a string'.

    self expect: true toEqual: (a = b).
    self expect: true toEqual: (a == b).
    self expect: true toEqual: (a hash = b hash).
  ]
]
