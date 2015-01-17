//
//  UIView+Helper.m
//  DropDownMenu
//
//  Created by Andrew Murdoch on 1/17/15.
//  Copyright (c) 2015 RAM4LLC. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

- (void)addBlurBackground:(UIBlurEffectStyle)style
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:style];
        
        UIVisualEffectView *visualEffectView;
        visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        visualEffectView.frame = self.bounds;
        visualEffectView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:visualEffectView];
        [self sendSubviewToBack:visualEffectView];
//        [self insertSubview:visualEffectView atIndex:0];

        self.backgroundColor = [UIColor clearColor];
    }
    else
    {
        UIToolbar *fakeToolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
        fakeToolbar.barStyle = UIBarStyleBlackTranslucent;
        [self insertSubview:fakeToolbar atIndex:0];
    }
}

@end
