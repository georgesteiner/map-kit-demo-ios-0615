//
//  MyPin.h
//  map-kit-demo-ios-0615
//
//  Created by Henry Chan on 6/22/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MapPin : NSObject<MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location;

@end
