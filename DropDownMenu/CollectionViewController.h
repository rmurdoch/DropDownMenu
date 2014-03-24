//
//  CollectionViewController.h
//  DropDownMenu
//
//  Created by Andrew Murdoch on 3/24/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuDelegate.h"

@interface CollectionViewController : UICollectionViewController

@property (nonatomic, weak) id<MenuDelegate> menuDelegate;

@end
