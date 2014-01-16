//
//  YTODropPin.m
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import "YTODropPin.h"

@implementation YTODropPin

@synthesize coordinate;
@synthesize annotationTitle;

- (NSString *)title {
    return annotationTitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle {
    self.coordinate = _coordinate;
    self.annotationTitle = _annotationTitle;
    return self;
}

@end
