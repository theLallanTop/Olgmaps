/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "RCTGoogleMapViewManager.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "RCTGoogleMapView.h"
#import "UIView+React.h"


@implementation RCTGoogleMapViewManager

RCT_EXPORT_MODULE()

-(UIView *)view
{
  RCTGoogleMapView *map = [[RCTGoogleMapView alloc] init];
  
//  map.settings.scrollGestures = YES;
//  map.settings.zoomGestures = YES;
//  map.settings.indoorPicker = YES;
  
  return map;
}

RCT_EXPORT_VIEW_PROPERTY(markers, NSDictionaryArray);
RCT_EXPORT_VIEW_PROPERTY(showsUserLocation, BOOL)

@end
