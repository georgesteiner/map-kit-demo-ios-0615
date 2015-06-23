//
//  MyPin.m
//  map-kit-demo-ios-0615
//
//  Created by Henry Chan on 6/22/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "MapPin.h"

@implementation MapPin

- (id)initWithCoordinates:(CLLocationCoordinate2D)location {
    self = [super init];
    if (self != nil) {
        _coordinate = location;
        
    }
    return self;
}

@end
