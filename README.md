# Olgmaps
This is an example of google maps SDK integration for react-native project.

# Framework
 - Download google map framework from https://developers.google.com/maps/documentation/ios-sdk/start and generate key
   
- AVFoundation.framework
- CoreData.framework
- CoreLocation.framework
- CoreText.framework
- GLKit.framework
- ImageIO.framework
- libc++.tbd
- libicucore.tbd
- libz.tbd 
- OpenGLES.framework
- QuartzCore.framework
- SystemConfiguration.framework

# Installation
- `npm install -g react-native`
- clone this repo
- `npm install`
- open `Olgmaps.xcodeproj`
- provide your google api key - in `Olgmaps/iOS/RCTGoogleMapView/RCTGoogleMapView.m` line 27
(the project will not compile unless you remove line 26 which says "Provide your GMS API key")
- run
