Koan subclass: TestBasic [
  <comment: 'A collection of introductory tests.'>

  testDeclarationAndAssignment [
    | declaration anotherDeclaration |
    "You must declare variables before using them."
    "Variables are separated by a single space."

    declaration _ 1.  "Squeak Smalltalk way to assign value"
    anotherDeclaration := 'string'.  "typical way to assign value
      (this will be used throughout the koans)"

    self expect: 1 toEqual: declaration.
    self expect: 'string' toEqual: anotherDeclaration.
  ]

  testEqualSignIsNotAnAssignmentOperator [
    | variableA variableB value |

    variableA := variableB := 1234.  "multiple assignments work"
    value := variableA = variableB.  "equal is not used for assignment"

    self expect: value toEqual: (variableA = variableB).

    "#== is a message that checks if identity is equal.  More about messages in the TestMessage koan."
  ]

  testMultipleStatementsInASingleLine [
    | variableA variableB variableC |

    "Multiple statements are separated by periods."
    variableA := 1. variableB := 2. variableC := 3.

    self expect: 1 toEqual: variableA.
    self expect: 2 toEqual: variableB.
    self expect: 3 toEqual: variableC.
  ]

  testInequality [
    self expect: true toEqual: ('hello' ~= 'world').

    "#~~ is a message that checks if identity is not equal.  More about messages in the TestMessage koan."
  ]

  testLogicalOr [
    | expression |

    expression := (3 > 4) | (5 < 6).

    self expect: true toEqual: expression.
  ]

  testLogicalAnd [
    | expression |

    expression := (2 > 1) & ('a' < 'b').

    self expect: true toEqual: expression.
  ]

  testNot [
    self expect: false toEqual: true not.
  ]
]
