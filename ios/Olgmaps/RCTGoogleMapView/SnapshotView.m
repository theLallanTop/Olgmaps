//
//  SnapshotView.m
//  Kotac
//
//  Created by Manjeet on 10/27/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SnapshotView.h"
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
@implementation SnapshotView

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (id)init {
  self = [super init];
  
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
  }
  return self;
}


- (void) receiveTestNotification:(NSNotification *) notification
{
  if ([[notification name] isEqualToString:@"TestNotification"])
    NSLog (@"Successfully received the test notification! %@",notification);
    NSString *eventName = [NSString stringWithFormat:@"data:data:image/jpeg;base64,%@",[notification object]];
    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:@{@"name": eventName}];
}

- (void) dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
