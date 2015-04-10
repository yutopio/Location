//
//  YTODropPin.m
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import "YTODropPin.h"

@implementation YTODropPin

- (NSString *)title {
    return _annotationTitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate
                           title:(NSString *)annotationTitle {
    self.coordinate = coordinate;
    self.annotationTitle = annotationTitle;
    return self;
}

@end
