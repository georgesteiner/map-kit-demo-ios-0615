//
//  ViewController.m
//  map-kit-demo-ios-0615
//
//  Created by Henry Chan on 6/22/15.
//  Copyright (c) 2015 Henry Chan. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h> // Need to import this to use MapKit functionality
#import "MapPin.h" // Need a custom class that conforms to the <MKAnnotation> protocol

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) MKUserLocation *userCurrentLocation;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // I'm responsible for MKMapViewDelegate methods!
    self.mapView.delegate = self;
    
    [self zoomToEiffelTower];
    
    [self zoomToCurrentUsersLocation];
}

- (void) zoomToEiffelTower {
    
    CLLocationCoordinate2D eiffelTowerCoordinates;
    eiffelTowerCoordinates.latitude = 48.8582;
    eiffelTowerCoordinates.longitude = 2.2945;
    
    MapPin *pin = [[MapPin alloc] initWithCoordinates:eiffelTowerCoordinates];
    
    [self.mapView addAnnotation:pin];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(eiffelTowerCoordinates, 800, 800);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
}


- (void) zoomToCurrentUsersLocation {
    [self.mapView setShowsUserLocation:YES];
}
// Location is updated on an interval
-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    // Setting our instance variable
    self.userCurrentLocation = userLocation;
    
}

// Setter of our userCurrentLocation
- (void) setUserCurrentLocation: (MKUserLocation *)newLocation {
 
    if (!_userCurrentLocation) {
        
        _userCurrentLocation = newLocation;
        
        CLLocationCoordinate2D userCoordinates = _userCurrentLocation.location.coordinate;
        
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userCoordinates, 800, 800);
        
        [self.mapView setRegion:viewRegion animated:YES];

    }
    
}




@end
