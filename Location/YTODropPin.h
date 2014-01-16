//
//  YTODropPin.h
//  Location
//
//  Created by Yuto Takei on 1/16/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface YTODropPin : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *annotationTitle;
}

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, retain) NSString *annotationTitle;

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle;

- (NSString *)title;

@end
