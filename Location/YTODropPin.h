//
//  YTODropPin.h
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YTODropPin : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *annotationTitle;

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate
                           title:(NSString *)annotationTitle;

- (NSString *)title;

@end
