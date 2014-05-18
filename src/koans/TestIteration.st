Koan subclass: TestIteration [
  <comment: 'A collection of iteration tests.'>

  testWhileTrue [
    | x y |

    x := 4. y := 1.

    [ x > 0 ] whileTrue: [ x := x - 1. y := y * 2 ].

    self expect: 16 toEqual: y.
    self expect: 0 toEqual: x.
  ]

  testWhileFalse [
    | x y |

    x := 0. y := 1.

    [ x >= 4 ] whileFalse: [ x := x + 1. y := y * 2 ].

    self expect: 16 toEqual: y.
    self expect: 4 toEqual: x.
  ]

  testTimesRepeat [
    | x y |

    x := 4. y := 2.

    x timesRepeat: [ y := y * 2 ].

    self expect: 32 toEqual: y.
  ]
]
