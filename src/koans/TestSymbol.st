Koan subclass: TestSymbol [
  <comment: 'A collection of symbol tests.'>

  testSymbolsStartWithHash [
    | symbol |

    symbol := #smalltalk.

    self expect: true toEqual: (symbol isMemberOf: Symbol).
  ]

  testSymbolsInheritFromString [
    | symbol |

    symbol := #smalltalk.

    self expect: String toEqual: symbol class superclass.
  ]

  testSymbolsCanBeCompared [
    | symbol anotherSymbol andAnotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #ruby.
    andAnotherSymbol := #smalltalk.

    self expect: false toEqual: (symbol = anotherSymbol).
    self expect: true toEqual: (symbol = andAnotherSymbol).
  ]

  testIdenticalSymbolsAreASingleInternalObject [
    | symbol anotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #smalltalk.

    self expect: true toEqual: (symbol hash = anotherSymbol hash).
  ]

  testMethodNamesBecomeSymbols [
    | allSymbols |

    allSymbols := Symbol allInstances.

    self expect: true toEqual: (allSymbols includes: #testMethodNamesBecomeSymbols).
    "Why do you think we store all instances of Symbol before evaluating if it is included in allSymbols?"
  ]

  testStringToSymbolConversion [
    | string |

    string := 'smalltalk'.

    self expect: #smalltalk toEqual: string asSymbol.
  ]

  testSymbolConversionWhenStringContainsNonAlphaNumerics [
    | string |

    string := 'hello world!'.

    self expect: #'hello world!' toEqual: string asSymbol.
  ]

  testSymbolsHaveStringMethodsThroughInheritance [
    | symbol |

    "But with unexpected behavior..."

    symbol := #smalltalk.

    self expect: 'klatllams' toEqual: symbol reverse.
    self expect: 'smalltalk is fun!' toEqual: (symbol, ' is fun!').
    self expect: 9 toEqual: symbol size.
    self expect: $s toEqual: (symbol at: 1).
  ]
]
