Koan subclass: TestCharacter [
  <comment: 'A collection of character tests.'>

  testCharactersCanBeCompared [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $B.

    self expect: true toEqual: (character < anotherCharacter).
    self expect: $B toEqual: (character max: anotherCharacter).
  ]

  testCharacterAsciiValue [
    | character anotherCharacter andAnotherCharacter |

    character := $s.
    anotherCharacter := $1.
    andAnotherCharacter := $$.

    self expect: 115 toEqual: character asciiValue.
    self expect: 49 toEqual: anotherCharacter asciiValue.
    self expect: 36 toEqual: andAnotherCharacter asciiValue.
  ]

  testUnprintableCharacters [
    | character anotherCharacter |

    "Smalltalk provides messages for 'unprintable' characters."

    character := Character tab.
    anotherCharacter := Character backspace.

    self expect: true toEqual: (character = (Character value: 9)).
    "Imma let you finish, but 'Unprintable' characters can actually be printed."
    self expect: true toEqual: (anotherCharacter = ($<8>)).
  ]

  testDigitAndLetter [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $9.

    self expect: true toEqual: character isLetter.
    self expect: true toEqual: anotherCharacter isDigit.
    self expect: true toEqual: character isAlphaNumeric.
  ]

  testLetterCase [
    | character anotherCharacter |

    character := $C.
    anotherCharacter := $x.

    self expect: true toEqual: character isUppercase.
    self expect: true toEqual: anotherCharacter isLowercase.
  ]

  testLetterCaseConversion [
    | character anotherCharacter |

    character := $a.
    anotherCharacter := $X.

    self expect: $A toEqual: character asUppercase.
    self expect: $x toEqual: anotherCharacter asLowercase.
  ]

  testWhitespace [
    | character anotherCharacter |

    character := Character space.
    anotherCharacter := Character tab.

    self expect: true toEqual: character isSeparator.
    self expect: true toEqual: anotherCharacter isSeparator.
  ]

  testPunctuation [
    | character anotherCharacter andAnotherCharacter |

    character := $'.
    anotherCharacter := $?.
    andAnotherCharacter := $#.

    self expect: false toEqual: character isPunctuation.
    self expect: true toEqual: anotherCharacter isPunctuation.
    self expect: false toEqual: andAnotherCharacter isPunctuation.
  ]

  testRepeatingCharacters [
    | character |

    character := $J.

    self expect: 'JJJJJ' toEqual: (character * 5).
  ]

  testIdenticalCharactersAreASingleInternalObject [
    | character anotherCharacter |

    character := $K.
    anotherCharacter := $K.

    self expect: true toEqual: (character hash = anotherCharacter hash).
  ]
]
