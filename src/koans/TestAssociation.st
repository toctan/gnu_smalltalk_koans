Koan subclass: TestAssociation [
  <comment: 'A collection of association tests.'>

  testCreatingAssociationThreeDifferentWays [
    | association anotherAssociation andAnotherAssociation |

    association := #a -> 0.

    self expect: #a toEqual: association key.
    self expect: 0 toEqual: association value.

    anotherAssociation := Association new key: #b value: 1.

    self expect: #b toEqual: anotherAssociation key.
    self expect: 1 toEqual: anotherAssociation value.

    andAnotherAssociation := Association key: #c value: 2.

    self expect: #c toEqual: andAnotherAssociation key.
    self expect: 2 toEqual: andAnotherAssociation value.
  ]

  testAssociationKeysCanBeAnyObject [
    | association obj |

    association := 'a' -> 0.

    self expect: 'a' toEqual: association key.

    association := 0 -> 1.

    self expect: 0 toEqual: association key.

    association := true -> 2.

    self expect: true toEqual: association key.

    association := nil -> 3.

    self expect: nil toEqual: association key.

    association := $b -> 4.

    self expect: $b toEqual: association key.

    obj := Object new.

    association := obj -> 5.

    self expect: obj toEqual: association key.
  ]

  testComparingAssociations [
    | association anotherAssociation |

    association := Association key: #a value: 0.

    self expect: true toEqual: (association = (#a -> 0)).

    anotherAssociation := Association key: #b value: 1.

    self expect: false toEqual: (association = (#b -> 2)).
    self expect: false toEqual: (association = (#c -> 1)).
  ]

  testAssociationsActLikeSingletons [
    | association anotherAssociation |

    association := Association new key: #a value: 0.
    anotherAssociation := #a -> 0.

    self expect: true toEqual: (association = anotherAssociation).
  ]
]
