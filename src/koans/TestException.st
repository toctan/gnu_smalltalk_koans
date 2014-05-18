Koan subclass: TestException [
  <comment: 'A collection of exception tests.'>

  testHaltAndError [
    self expect: [ self halt ] toRaise: Halt.
    self expect: [ self error: 'Error' ] toRaise: Error.

    "All classes have halt and error messages."
  ]

  testSignal [
    self expect: [ Exception signal ] toRaise: Exception.
    self expect: [ Exception signal: 'Hello World' ] toRaise: Exception.
  ]

  testCatchingExceptionsWithOnDo [
    | result |

    result := [ nil ifTrue: [] ]
                on: SystemExceptions.MustBeBoolean
                do: [ :e | e return: true ].

    self expect: true toEqual: result.

    result := [ 'Hello' + ' World!' ]
                on: MessageNotUnderstood
                do: [ :e | e return: true ].

    self expect: true toEqual: result.
  ]
]
