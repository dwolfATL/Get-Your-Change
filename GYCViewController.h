//
//  XYZViewController.h
//  Bills&Coins
//
//  Created by dwolf on 6/22/14.
//  Copyright (c) 2014 dwolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZViewController : UIViewController <UITextFieldDelegate>
{
    
    IBOutlet UILabel *twenties;
    IBOutlet UILabel *tens;
    IBOutlet UILabel *fives;
    IBOutlet UILabel *ones;
    IBOutlet UILabel *quarters;
    IBOutlet UILabel *dimes;
    IBOutlet UILabel *nickels;
    IBOutlet UILabel *pennies;
        
    IBOutlet UILabel *dismissmessage;
    
    IBOutlet UIButton *clearbutton;
    
    IBOutlet UIImageView *twentiespng;
    IBOutlet UIImageView *tenspng;
    IBOutlet UIImageView *fivespng;
    IBOutlet UIImageView *onespng;
    IBOutlet UIImageView *quarterspng;
    IBOutlet UIImageView *dimespng;
    IBOutlet UIImageView *nickelspng;
    IBOutlet UIImageView *penniespng;
    
    IBOutlet UITextField *amountTextField;
    
    
}

- (IBAction) infoButton:(id)sender;
- (IBAction) clearButton:(id)sender;

- (void) fadelabelin:(UILabel *)label fadeimagein:(UIImageView *)imageview;
- (void) fadelabelout:(UILabel *)label fadeimageout:(UIImageView *)imageview;
- (void) fadebuttonin:(UIButton *)button;
- (void) fadebuttonout:(UIButton *)button;

@end
