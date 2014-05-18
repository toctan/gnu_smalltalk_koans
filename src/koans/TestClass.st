Object subclass: HelloWorld [
  <comment: 'This is a HelloWorld comment'>
  <category: 'This is a HelloWorld category'>

  Statement := $S.

  | instanceVariable |

  "Unlike other Smalltalks, method statements are inside brackets."

  awesome [
    ^true
  ]

  + string [
    ^'Hello ', string
  ]

  say: something [
    ^self class name asString, ' says ', something
  ]
]

HelloWorld subclass: SubHelloWorld [
  | instanceVariable2 instanceVariable3 |
]

SubHelloWorld subclass: SubSubHelloWorld []

Koan subclass: TestClass [
  <comment: 'A collection of class tests.'>

  "Class variables are defined the same as variable assignments."

  "superclass"
  "allInstances"
  "allSuperclasses"

  testName [
      self expect: #HelloWorld toEqual: HelloWorld name.
  ]

  testPragmas [
    "
    Pragmas define:
      class comment
      class category
      imported namespaces
      shape of indexed instance variables.
    "

    self expect: 'This is a HelloWorld comment' toEqual: HelloWorld comment.
    self expect: 'This is a HelloWorld category' toEqual: HelloWorld category.
  ]

  testInstanceVariableCollection [
    self expect: #(#instanceVariable) toEqual: HelloWorld instVarNames.
  ]

  testInstSize [
    self expect: 1 toEqual: HelloWorld instSize.
    self expect: 3 toEqual: SubHelloWorld instSize.
  ]

  testClassInstanceVariableCollection [
    self expect: #(#Statement) asSet toEqual: HelloWorld classVarNames asSet.
  ]

  testMessageCollection [
    self expect: #(#awesome #+ #say:) asSet toEqual: HelloWorld selectors asSet.
  ]

  testSourceCodeAt [
    "
    #sourceCodeAt: returns the source code of the specified message.
    For example: HelloWorld sourceCodeAt: #+ would return:

    '+ string [
      ^''Hello '', string
    ]'
    "
  ]

  testAllInstances [
    | helloWorld |

    helloWorld := HelloWorld new.

    self expect: {helloWorld} asSet toEqual: HelloWorld allInstances asSet.
  ]

  testSuperclass [
    self expect: Object toEqual: HelloWorld superclass.
  ]

  testAllSuperclasses [
    self expect: {Object. GNUSmalltalk.HelloWorld} asSet toEqual: SubHelloWorld allSuperclasses asSet.

    "Note: GNUSmalltalk is the namespace."
  ]

  testAllSubclasses [
    self expect: {GNUSmalltalk.SubSubHelloWorld. GNUSmalltalk.SubHelloWorld} asSet toEqual: HelloWorld allSubclasses asSet.
  ]
]
