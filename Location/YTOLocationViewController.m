//
//  YTOLocationViewController.m
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import "YTOLocationViewController.h"
#import "YTODropPin.h"
#import <CoreLocation/CoreLocation.h>

@interface YTOLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator2;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end

@implementation YTOLocationViewController

CLLocationManager *lm;
MKCircle *circle;
YTODropPin *pin;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateLocation];
    
    _map.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (!lm) {
        [lm stopUpdatingLocation];
    }
}

- (IBAction)updateLocation
{
    if (!lm) {
        lm = [[CLLocationManager alloc] init];
    }

    if([CLLocationManager locationServicesEnabled]) {
        lm.delegate = self;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
        lm.distanceFilter = 100.0;
        [lm startUpdatingLocation];

        [_indicator1 startAnimating];
        [_indicator2 startAnimating];
    } else {
        lm = NULL;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    _latitude.text = [[NSString alloc] initWithFormat:@"%g", location.coordinate.latitude];
    _longitude.text = [[NSString alloc] initWithFormat:@"%g", location.coordinate.longitude];
    [lm stopUpdatingLocation];

    [_indicator1 stopAnimating];
    [_indicator2 stopAnimating];

    MKCoordinateRegion region = MKCoordinateRegionMake([location coordinate], MKCoordinateSpanMake(0.04, 0.04));
    [_map setCenterCoordinate:[location coordinate]];
    [_map setRegion:region];

    if (circle) {
        [_map removeOverlay:circle];
        [_map removeAnnotation:pin];
        circle = NULL;
        pin = NULL;
    }
    
    circle = [MKCircle circleWithCenterCoordinate:location.coordinate radius:100];
    pin = [[YTODropPin alloc] initWithLocationCoordinate:location.coordinate title:@"Current Location"];
    [_map addOverlay:circle];
    [_map addAnnotation:pin];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKCircleRenderer *circle = [[MKCircleRenderer alloc] initWithOverlay:overlay];
    circle.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    return circle;
}

@end
