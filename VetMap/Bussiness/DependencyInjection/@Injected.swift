//
//  @Injected.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation

@propertyWrapper struct Injected<Dependency> {
  var wrappedValue: Dependency
 
  init() {
    self.wrappedValue = Injection.shared.container.resolve(Dependency.self)!
  }
}
