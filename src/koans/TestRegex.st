Koan subclass: TestRegex [
  <comment: 'A collection of regular expression tests.'>

  "Regular expression was added to GNU Smalltalk and
   was not originally part of the ANSI Smalltalk implementation."

  testSearchRegex [
    | string |

    "In most cases, regexes are defined as ordinary strings."

    string := 'This is a sample string'.

    self expect: true toEqual: (string searchRegex: 'str') matched.
  ]

  testUsingPerlSyntax [
    | string |

    string := '1234567890 ABCDEFGHI'.

    self expect: true toEqual: (string =~ '456') matched.
  ]

  testUsingTilde [
    | string |

    "This achieves the same results as the previous two koans."

    string := 'Hello World'.

    self expect: true toEqual: (string ~ 'o W').
  ]

  testIfMatchedBlock [
    | string |

    string := 'See spot run'.

    self expect: 'match!' toEqual: ((string =~ 'ee') ifMatched: ['match!']).
    self expect: nil toEqual: ((string =~ 'ran') ifMatched: ['match?']).
  ]

  testControlCaseSensitivityWithInlineModifier [
    | string |

    string := 'The world of Smalltalk'.

    self expect: false toEqual: (string ~ 'SmallTalk').
    self expect: true toEqual: (string ~ '(?i)SmallTalk').
  ]

  testQuestionMark [
    | string |

    string := 'Question mark means optional'.

    self expect: true toEqual: (string ~ 'ma?').
    self expect: true toEqual: (string ~ 'mi?').
  ]

  testPlus [
    | string |

    string := 'Plus means one or more'.

    self expect: true toEqual: (string ~ 'or+').
    self expect: true toEqual: (string ~ 'on+').
  ]

  testAsterisk [
    | string |

    string := 'Asterisk means zero or more'.

    self expect: true toEqual: (string ~ 'or*').
    self expect: true toEqual: (string ~ 'b*').
  ]

  testLeftMostMatchWins [
    | string |

    string := 'bccddd bx'.

    self expect: 'b' toEqual: (string =~ 'bx*') match
  ]

  testCharacterClasses [
    | array |

    array := #('dam' 'jam' 'pam' 'ram' 'sam').

    self expect: #('pam' 'ram' 'sam') toEqual: (array select: [:word | (word =~ '[prs]am') matched]).
  ]

  testDigits [
    | string |

    string := 'Smalltalk development began as early as 1969'.

    self expect: true toEqual: (string ~ '[0123456789]+').
    self expect: true toEqual: (string ~ '\d+').

    "Which one is easier to type?"
  ]

  testDigitRange [
    | string |

    string := 'Smalltalk-80'.

    self expect: true toEqual: (string ~ '[0-9]+').
  ]

  testWhitespaces [
    | string |

    string := 'Smalltalk-80 Version 2'.

    self expect: true toEqual: (string ~ '\s+').
  ]

  testWords [
    | string |

    string := 'GNU Smalltalk closely follows Smalltalk_80 language'.

    self expect: true toEqual: (string ~ '[a-zA-Z0-9_]+').
    self expect: true toEqual: (string ~ '\w+').
  ]

  testPeriod [
    | string |

    "Used to represent any non-newline character."

    string := 'abc', Character nl asString, '123'.

    self expect: 'abc' toEqual: (string =~ 'a.+') match.
  ]

  testNegation [
    | string |

    string := 'Smalltalk-80'.

    self expect: 'Smalltalk-' toEqual: (string =~ '[^0-9]+') match.
  ]

  testCharacterClassNegation [
    | stringOne stringTwo stringThree |

    stringOne := 'Smalltalk-71'.
    stringTwo := 'Smalltalk-72', Character tab asString, Character space asString, Character nl asString.
    stringThree := 'Smalltalk-76 introduced the IDE'.

    self expect: 'Smalltalk-' toEqual: (stringOne =~ '\D+') match.
    self expect: 'Smalltalk-72' toEqual: (stringTwo =~ '\S+') match.
    self expect: '-' toEqual: (stringThree =~ '\W+') match.
  ]

  testStartOfString [
    | string |

    string := 'Alan Kay'.

    self expect: 'Alan' toEqual: (string =~ '\AAlan') match.
    self expect: false toEqual: (string =~ '\AKay') matched.
  ]

  testEndOfString [
    | string |

    string := 'Alan Kay'.

    self expect: false toEqual: (string =~ 'Alan\z') matched.
    self expect: 'Kay' toEqual: (string =~ 'Kay\z') match.
  ]

  testStartOfLine [
    | string |

    string := 'Alan Kay'.

    self expect: 'Alan' toEqual: (string =~ '^\w+') match.
  ]

  testEndOfLine [
    | string |

    string := 'Alan Kay'.

    self expect: 'Kay' toEqual: (string =~ '\w+$') match.
  ]

  testWordBoundary [
    | string |

    string := 'xerox parc'.

    self expect: 'parc' toEqual: (string =~ '\bpar.') match.
  ]

  testGroupingWithParentheses [
    | string |

    string := 'LOLOLOLOL'.

    self expect: 'LOLOLOLO' toEqual: (string =~ '(LO)+') match.
  ]

  testParenthesesAlsoCaptureMatchedContentByNumber [
    | string matches |

    string := 'Adele Goldberg'.
    matches := string =~ '(\w+) (\w+)'.

    self expect: 'Adele' toEqual: (matches at: 1).
    self expect: 'Goldberg' toEqual: (matches at: 2).
  ]

  testPipeCharacter [
    | regex |

    regex := '(Alan|Dan|Ted) Kay'.

    self expect: true toEqual: ('Dan Kay' ~ regex).
    self expect: true toEqual: ('Ted Kay' ~ regex).
    self expect: true toEqual: ('Alan Kay' ~ regex).
  ]

  testAllOccurrencesOfRegex [
    | string |

    string := 'one two-three'.

    self expect: #('one' 'two' 'three') toEqual: (string allOccurrencesOfRegex: '(\w+)') asArray.
  ]

  testReplacingRegex [
    | string |

    string := 'Hello, World!'.

    self expect: 'Hello, Universe!' toEqual: (string replacingRegex: 'World' with: 'Universe').
  ]

  testReplacingAllRegex [
    | string |

    string := 'she sells seashells by the seashore'.

    self expect: 'sea sea sea by the sea' toEqual: (string replacingAllRegex: '(s\w*)' with: 'sea').
  ]

  testMatchingRegexResults [
    | string |

    string := 'Hello, World!'.

    self expect: true toEqual: ((string =~ '\w+') isMemberOf: Kernel.MatchingRegexResults).
  ]

  testFailedMatchRegexResults [
    | string |

    string := 'Hello, World!'.

    self expect: true toEqual: ((string =~ '\d+') isMemberOf: Kernel.FailedMatchRegexResults).
  ]
]
