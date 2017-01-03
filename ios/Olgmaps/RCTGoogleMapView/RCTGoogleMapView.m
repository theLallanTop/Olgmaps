/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "RCTGoogleMapView.h"
#import "RCTConvert.h"
#import "RCTEventDispatcher.h"
#import "RCTLog.h"
#import "RCTUtils.h"
#import "SnapshotView.h"

@implementation RCTGoogleMapView

{
  NSArray *_markers;
  NSArray *_polylines;
  NSMutableArray *_markersInternal;
  GMSMutablePath *_path;
  CLLocationCoordinate2D position;
  GMSMarker * markersPoint;
  GMSPolyline *polyline;
  
}

+ (void)initialize
{
  [super initialize];
  [GMSServices provideAPIKey:@"AIzaSyAEZvTYXubO3blHqacuvucUGII4j51PE8g"];
}

- (instancetype)init
{
  if ((self = [super init])) {
  }
  _path = [[GMSMutablePath alloc]init];
  self.myLocationEnabled = YES;
  return self;
}


- (void)layoutSubviews
{
  [super layoutSubviews];
  CGRect mapFrame = self.frame;
  self.frame = CGRectZero;
  self.frame = mapFrame;
}

#pragma mark Accessors

- (void)setMarkers:(NSArray *) markers
{
  if (_markers != markers) {
    _markers = [markers copy];
    
    if(markers.count == 0)
    {
      [self foo];
      [self clear];
      polyline.map = nil;
      [_path removeAllCoordinates];
      markersPoint = nil;
      return;
    }
    
    NSDictionary *markerDictionary = markers[0];
    CLLocationDegrees loclat = ((NSNumber*)markerDictionary[@"lat"]).doubleValue;
    CLLocationDegrees loclng = ((NSNumber*)markerDictionary[@"lng"]).doubleValue;
    [self clear];
    markersPoint = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(loclat, loclng)];
    position = CLLocationCoordinate2DMake(loclat, loclng);
    markersPoint.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
    markersPoint.map = self;
    
    [_path addCoordinate:CLLocationCoordinate2DMake(loclat,loclng)];
    polyline = [GMSPolyline polylineWithPath:_path];
    polyline.map = self;
    polyline.strokeColor = [UIColor blueColor];
    polyline.strokeWidth = 5.5f;
    position = CLLocationCoordinate2DMake(loclat, loclng);
    
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
    bounds = [bounds includingCoordinate:position];
    GMSCameraUpdate *update = [GMSCameraUpdate fitBounds:bounds withPadding:30.0];
    // self.myLocationEnabled = YES;
    
    [self animateWithCameraUpdate:update];
    [self animateToZoom:14];
    
  }
}
- (void)foo
{
  //  [self animateToZoom:10];
  UIImage *screenShot = [self imageFromView:self];
  //UIImageWriteToSavedPhotosAlbum(screenShot, nil, nil, nil);
  NSString * str = [self encodeToBase64String:screenShot];
  //notification for pass image data
  //  [[NSNotificationCenter defaultCenter] postNotificationName:@"TestNotification" object:str];
}

- (NSString *)encodeToBase64String:(UIImage *)image {
  return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *)imageFromView:(UIView *) view
{
  if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
  {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [[UIScreen mainScreen] scale]);
  }
  else
  {
    UIGraphicsBeginImageContext(view.frame.size);
  }
  [view.layer renderInContext: UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

@end
