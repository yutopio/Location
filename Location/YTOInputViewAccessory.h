//
//  YTOInputViewAccessory.h
//  Location
//
//  Created by Yuto Takei on 6/13/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTOInputViewAccessory : UIView

@property (weak, nonatomic) UIResponder *responder;

+ (YTOInputViewAccessory *)sharedInstance;

@end
