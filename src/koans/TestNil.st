Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    self expect: true toEqual: (nil isMemberOf: UndefinedObject).
  ]

  testNilIsTheSameInstance [
    self expect: nil toEqual: nil.

    "nil is a singleton instance."
  ]

  testUndefinedObjectInstancesAreNotTheSame [
    "expect:toBeLike: checks if objects belong to same class."

    self expect: nil toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    self expect: true toEqual: nil isNil.
  ]
]
