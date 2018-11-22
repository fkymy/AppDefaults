//
//  AppDefaults.swift
//  AppDefaultsExample
//
//  Created by Yuske Fukuyama on 2018/11/22.
//  Copyright © 2018 Yuske Fukuyama. All rights reserved.
//

import Foundation

enum AppDefaults {
  
  static var uid: String? {
    get { return uidInfo.get() }
    set { uidInfo.set(newValue) }
  }
  
  static var displayName: String? {
    get { return displayNameInfo.get() }
    set { displayNameInfo.set(newValue) }
  }
  
  static var photoURL: String? {
    get { return photoURLInfo.get() }
    set { photoURLInfo.set(newValue) }
  }
  
  static var doYouLoveMe: Bool {
    get { return doYouLoveMeInfo.get() }
    set { doYouLoveMeInfo.set(newValue) }
  }
  
  private static var uidInfo = UserDefaultInfo<String?>(key: "uid", defaultValue: nil)
  
  private static var displayNameInfo = UserDefaultInfo<String?>(key: "displayName", defaultValue: nil)
  
  private static var photoURLInfo = UserDefaultInfo<String?>(key: "photoUrl", defaultValue: nil)
  
  private static var doYouLoveMeInfo = UserDefaultInfo(key: "doYouLoveMe", defaultValue: false)
}

private struct UserDefaultInfo<Value> {
  var key: String
  var defaultValue: Value
}

extension UserDefaultInfo {
  
  func get() -> Value {
    guard let valueUntyped = UserDefaults.standard.object(forKey: self.key) else {
      print("could not get object for key: \(self.key)")
      return self.defaultValue
    }
    guard let value = valueUntyped as? Value else {
      print("could not cast type: \(Value.self) for key: \(self.key)")
      return self.defaultValue
    }
    return value
  }
  
  func set(_ value: Value) {
    UserDefaults.standard.set(value, forKey: self.key)
    UserDefaults.standard.synchronize()
  }
}
