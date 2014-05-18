Koan subclass: TestSortedCollection [
  <comment: 'A collection of sorted collection tests.'>

  testDefaultSortCriteria [
    | sortedCollection |

    sortedCollection := SortedCollection new.
    sortedCollection
      add: 4;
      add: 3;
      add: 2.

    self expect: 2 toEqual: (sortedCollection at: 1).
    self expect: 3 toEqual: (sortedCollection at: 2).
    self expect: 4 toEqual: (sortedCollection at: 3).
  ]

  testSpecifySortCriteria [
    | sortedCollection |

    sortedCollection := SortedCollection sortBlock: [ :a :b | a > b ].
    sortedCollection
      add: 2;
      add: 1;
      add: 3;
      add: 4.

    self expect: (#(4 3 2 1) asSortedCollection: [ :a :b | a > b ]) toEqual: sortedCollection.

    "Hint: Array objects can transform into SortedCollection objects"
  ]

  testComparingSortedCollections [
    | sortedCollection anotherSortedCollection |

    sortedCollection := SortedCollection with: 1 with: 2.
    anotherSortedCollection := SortedCollection with: 2 with: 1.

    self expect: true toEqual: (sortedCollection = anotherSortedCollection).

    anotherSortedCollection sortBlock: [ :a :b | a > b ].

    self expect: false toEqual: (sortedCollection = anotherSortedCollection).
  ]
]
