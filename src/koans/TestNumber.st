Koan subclass: TestNumber [
  <comment: 'A collection of number tests.'>

  testDifferentNumbers [
    self expect: true toEqual: 1 isInteger.
    self expect: true toEqual: 1.5 isFloat.
  ]

  testNumberParts [
    self expect: 2/3 toEqual: (2/3) fractionPart.
    self expect: 0.5 toEqual: 1.5 fractionPart.
  ]

  testSigns [
    self expect: 1 toEqual: 2 sign.
    self expect: -1 toEqual: -2 sign.
    self expect: 0 toEqual: 0 sign.
  ]

  testNegation [
    self expect: -2 toEqual: 2 negated.
    self expect: 5 toEqual: -5 negated.
  ]

  testRounding [
    self expect: 1 toEqual: 1.99 floor.
    self expect: 2 toEqual: 1.99 ceiling.
  ]

  testMinMaxOfTwoNumbers [
    self expect: 5 toEqual: (5 min: 10).
    self expect: 5 toEqual: (10 min: 5).
    self expect: 20 toEqual: (20 max: 15).
  ]

  testPositiveAndNegative [
    self expect: true toEqual: 5 positive.
    self expect: true toEqual: -5 negative.
    self expect: true toEqual: 5 strictlyPositive.
    self expect: false toEqual: 0 strictlyPositive.
  ]

  testEvenAndOdd [
    self expect: true toEqual: 2 even.
    self expect: true toEqual: 1 odd.
  ]
]
