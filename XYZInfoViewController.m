//
//  XYZInfoViewController.m
//  Bills&Coins
//
//  Created by dwolf on 7/3/14.
//  Copyright (c) 2014 dwolf. All rights reserved.
//

#import "XYZInfoViewController.h"

@interface XYZInfoViewController ()

@end

@implementation XYZInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSMutableAttributedString *aboutmetext = [[NSMutableAttributedString alloc] initWithString:@"Thanks for downloading!\n\n\
I created Get Your Change to help out my brother who, like many of us, has no love of math. This handy app can help open up \
opportunities if you have a hard time counting out money or if you just want more practice.\n\n\n\n\nDisclaimer: There are \
lots of combinations of bills and coins for various amounts of money. To keep it simple, Get Your Change shows the answer \
that uses the largest denominations."];
    
    [aboutmetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"TrebuchetMS" size:17] range:NSMakeRange(0,[aboutmetext length])];
    [aboutmetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"TrebuchetMS" size:23] range:NSMakeRange(0, 23)];
    [aboutmetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"TrebuchetMS" size:14] range:NSMakeRange(240, [aboutmetext length]-240)];
    [aboutmetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"TrebuchetMS-Bold" size:19] range:NSMakeRange(35, 15)];
    [aboutmetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14] range:NSMakeRange(356, 15)];
    [aboutmetext addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:(34/255.f) green:(43/255.f) blue:(17/255.f) alpha:1.0] range:NSMakeRange(0,[aboutmetext length])];
    
    
    aboutme.textAlignment = NSTextAlignmentCenter;
    aboutme.attributedText = aboutmetext;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)rateApp:(id)sender
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
    {
        // iOS6.1 or earlier
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"www.google.com"]];
    } else
    {
        // iOS7 or later
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"www.apple.com"]];
    }
    
}

@end
