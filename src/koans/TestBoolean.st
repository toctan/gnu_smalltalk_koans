Koan subclass: TestBoolean [
  <comment: 'A collection of boolean tests.'>

  truthValue: condition [
    condition ifTrue: [ ^#trueStuff ].
    condition ifFalse: [ ^#falseStuff ].
  ]

  testTrueIsTreatedAsTrue [
    self expect: #trueStuff toEqual: (self truthValue: true).
  ]

  testFalseIsTreatedAsFalse [
    self expect: #falseStuff toEqual: (self truthValue: false).
  ]

  testNilIsNotTreatedAsABoolean [
    self expect: [ self truthValue: nil ] toRaise: SystemExceptions.MustBeBoolean.
  ]

  testIfTrueAndIfFalseOnlyRespondsToBooleans [
    self expect: [ self truthValue: 1 ] toRaise: SystemExceptions.MustBeBoolean.
    self expect: [ self truthValue: 0 ] toRaise: SystemExceptions.MustBeBoolean.
    self expect: [ self truthValue: #() ] toRaise: SystemExceptions.MustBeBoolean.
    self expect: [ self truthValue: 'String' ] toRaise: SystemExceptions.MustBeBoolean.
    self expect: [ self truthValue: '' ] toRaise: SystemExceptions.MustBeBoolean.
  ]

  testAndShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: true toEqual: (x < 5 and: [ z := 1. y < 11 ]).
    self expect: 1 toEqual: z.

    z := 0.

    self expect: false toEqual: (x < 4 and: [ z := 1. y < 11 ]).
    self expect: 0 toEqual: z.

    "How is this different from '&'?"
  ]

  testOrShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: true toEqual: (x > 5 or: [ z := 1. y > 9]).
    self expect: 1 toEqual: z.

    z := 0.

    self expect: true toEqual: (x > 9 sqrt or: [ z := 1. y > 9]).
    self expect: 0 toEqual: z.
  ]

  testEqv [
    self expect: true toEqual: (true eqv: true).
    self expect: false toEqual: (true eqv: false).
    self expect: false toEqual: (false eqv: true).
    self expect: true toEqual: (false eqv: false).
  ]

  testXor [
    self expect: false toEqual: (true xor: true).
    self expect: true toEqual: (true xor: false).
    self expect: true toEqual: (false xor: true).
    self expect: false toEqual: (false xor: false).
  ]
]
