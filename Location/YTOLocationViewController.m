//
//  YTOLocationViewController.m
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import "YTOLocationViewController.h"
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateLocation];
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
    CLLocation *newLocation = [locations lastObject];
    _latitude.text = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.latitude];
    _longitude.text = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.longitude];
    [lm stopUpdatingLocation];

    [_indicator1 stopAnimating];
    [_indicator2 stopAnimating];
    
    MKCoordinateRegion region = MKCoordinateRegionMake([newLocation coordinate], MKCoordinateSpanMake(0.4, 0.4));
    [_map setCenterCoordinate:[newLocation coordinate]];
    [_map setRegion:region];
}


@end
