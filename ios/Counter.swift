//
//  Counter.swift
//  SandboxReactNativeSwift
//
//  Created by 鎌田遼 on 2019/01/22.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

@objc(Counter)
class Counter: RCTEventEmitter {
  
  @objc
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  override func constantsToExport() -> [AnyHashable: Any]! {
    return [
      "number": 123.9,
      "string": "foo",
      "boolean": true,
      "array": [1, 22.2, "33"],
      "object": ["a": 1, "b": 2],
      "initialCount": 0]
  }
  
  override func supportedEvents() -> [String]! {
    return ["onIncrement", "onDecrement"]
  }

  private var count = 0
  
  @objc
  func increment() {
    count += 1
    print("count is \(count)")
    
    sendEvent(withName: "onIncrement", body: ["count": count])
  }
  
  @objc
  func decrement(
    _ resolve: RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock
  ) -> Void {
    if (count == 0) {
      let error = NSError(domain: "", code: 200, userInfo: nil)
      reject("E_COUNT", "count cannnot be negative", error)
    } else {
      count -= 1
      resolve("count was decremented")
      
      sendEvent(withName: "onDecrement", body: ["count": count])
    }
  }
  
  @objc
  func getCount(_ callback:RCTResponseSenderBlock) {
    callback([count])
  }
  
}
