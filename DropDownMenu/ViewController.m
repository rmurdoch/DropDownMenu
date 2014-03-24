//
//  ViewController.m
//  DropDownMenu
//
//  Created by Andrew Murdoch on 3/24/14.
//  Copyright (c) 2014 RAM4LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    IBOutlet UIView *containerView;
    IBOutlet UIImageView *menuImage;
    IBOutlet UILabel *label;
    BOOL menuShowing;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	for (UIViewController *controller in self.childViewControllers)
    {
        if ([controller isKindOfClass:[MenuTableViewController class]])
        {
            ((MenuTableViewController *)controller).menuDelegate = self;
            break;
        }
    }
    [self setBlurredView];
}

- (void)setBlurredView
{
    UIToolbar *fakeToolbar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    fakeToolbar.barStyle = UIBarStyleBlackTranslucent;
    [containerView insertSubview:fakeToolbar atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Action taken to show menu
- (IBAction)moreSelected:(id)sender
{
    if (menuShowing)
    {
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = containerView.frame;
             frame.origin.y = -frame.size.height;
             [containerView setFrame:frame];
             
             menuImage.transform = CGAffineTransformMakeRotation(M_PI*2);
         }completion:^(BOOL finished)
         {
             containerView.hidden = YES;
             menuShowing = NO;
         }];
    }
    
    else
    {
         containerView.hidden = NO;
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = containerView.frame;
             frame.origin.y = 64;
             [containerView setFrame:frame];
             
             menuImage.transform = CGAffineTransformMakeRotation(-3.141593);
         } completion:^(BOOL finished)
         {
             menuShowing = YES;
         }];
    }
}

//Deleagte action when a row is selected
- (void)didSelectMenuItem:(NSString *)string
{
    [label setText:string];
    [self moreSelected:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (menuShowing)
        [self moreSelected:nil];
}


@end
