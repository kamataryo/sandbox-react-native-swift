//
//  Counter.m
//  SandboxReactNativeSwift
//
//  Created by 鎌田遼 on 2019/01/22.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_REMAP_MODULE(RNCounter, Counter, RCTEventEmitter)
  RCT_EXTERN_METHOD(increment)
  RCT_EXTERN_METHOD(
    decrement: (RCTPromiseResolveBlock)resolve
    rejecter: (RCTPromiseRejectBlock)reject
  )
  RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
@end
