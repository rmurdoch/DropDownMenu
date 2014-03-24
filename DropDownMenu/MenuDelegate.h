//
//  MenuDelegate.h
//  DropDownMenu
//
//  Created by Andrew Murdoch on 3/24/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuDelegate <NSObject>

- (void)didSelectMenuItem:(NSString *)string;

@end
