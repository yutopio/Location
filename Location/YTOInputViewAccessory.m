//
//  YTOInputViewAccessory.m
//  Location
//
//  Created by Yuto Takei on 6/13/14.
//  Copyright (c) 2014 Yuto Takei. All rights reserved.
//

#import "YTOInputViewAccessory.h"

@interface YTOInputViewAccessory ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation YTOInputViewAccessory

static YTOInputViewAccessory *instance;

+ (YTOInputViewAccessory *)sharedInstance {
    if (instance) {
        return instance;
    }

    return instance = [[NSBundle mainBundle] loadNibNamed:@"YTOInputViewAccessory" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    _backgroundView.layer.cornerRadius = 8;
}

- (IBAction)closeTouched:(id)sender {
    [_responder resignFirstResponder];
}

@end
