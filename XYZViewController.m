//
//  XYZViewController.m
//  Bills&Coins
//
//  Created by dwolf on 6/22/14.
//  Copyright (c) 2014 dwolf. All rights reserved.
//

#import "XYZViewController.h"
#import "XYZInfoViewController.h"

@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Configure user input field as a delegate for editing events
    amountTextField.delegate = self;
    [amountTextField addTarget:self action:@selector(textViewDidChange:) forControlEvents:UIControlEventAllEditingEvents];
    
  //  [amountTextField becomeFirstResponder];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [amountTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    // Ensure user can't remove the dollar sign via the cut command
    NSString *currencyvalidate = [amountTextField.text stringByReplacingCharactersInRange:range withString:string];
    if (![currencyvalidate hasPrefix:[[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol]])
    {
        return NO;
    }
    
    // Limit the maximum length of the user input at 7 characters (up to $999.99)
    NSUInteger newLength = [amountTextField.text length] + [string length] - range.length;
    return newLength <= 7;
    
}


- (void)textViewDidChange:(UITextField *)textField
{
    
    
    
    // Remove the currency symbol from the field text for calculations
    NSString *removecurrency = [amountTextField.text substringFromIndex:1];
    
    // Ensure consistent decimal formatting. Start by removing the decimal from the field text.
    NSString *stringWithDecimal = [removecurrency stringByReplacingOccurrencesOfString:@"." withString:@""];
    // Divide by 100
    double number = [stringWithDecimal intValue] * 0.01;
    // Add decimal back in
    stringWithDecimal = [NSString stringWithFormat:@"%.2lf", number];
    // Create variable for currency symbol
    NSString *currencySymbol = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
    // Set the text field text based on the new format
    amountTextField.text = [NSString stringWithFormat:@"%@%@", currencySymbol, stringWithDecimal];
    
    // Clear button should only show when dollar amount is non-zero
    if ([amountTextField.text isEqualToString:@"$0.00"]){
        [self fadebuttonout:clearbutton];
    } else {
        [self fadebuttonin:clearbutton];
    }
    
    // Create NSDecimalNumber for the amount from the UI
    NSDecimalNumber *amountdecimal = [NSDecimalNumber decimalNumberWithString:stringWithDecimal];
    
    // Set up NSDecimalNumbers for the various types of currency calculations
    NSDecimalNumber *xtwenty = [NSDecimalNumber decimalNumberWithString:@"20"];
    NSDecimalNumber *xten = [NSDecimalNumber decimalNumberWithString:@"10"];
    NSDecimalNumber *xfive = [NSDecimalNumber decimalNumberWithString:@"5"];
    NSDecimalNumber *xone = [NSDecimalNumber decimalNumberWithString:@"1"];
    NSDecimalNumber *xquarter = [NSDecimalNumber decimalNumberWithString:@"0.25"];
    NSDecimalNumber *xdime = [NSDecimalNumber decimalNumberWithString:@"0.10"];
    NSDecimalNumber *xnickel = [NSDecimalNumber decimalNumberWithString:@"0.05"];
    NSDecimalNumber *xpenny = [NSDecimalNumber decimalNumberWithString:@"0.01"];
    
    // Initialize the counts at zero
    int twentiescount = 0;
    int tenscount = 0;
    int fivescount = 0;
    int onescount = 0;
    int quarterscount = 0;
    int dimescount = 0;
    int nickelscount = 0;
    int penniescount = 0;
    
    // Set up a  variable for the do while loop calculations
    NSDecimalNumber *differencedecimal = amountdecimal;
    
    // Do While loops to count the number of each type of currency
    while (([differencedecimal compare:xtwenty] == NSOrderedDescending) || ([differencedecimal compare:xtwenty]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xtwenty];
        twentiescount++;
    }
    while (([differencedecimal compare:xten] == NSOrderedDescending) || ([differencedecimal compare:xten]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xten];
        tenscount++;
    }
    while (([differencedecimal compare:xfive] == NSOrderedDescending) || ([differencedecimal compare:xfive]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xfive];
        fivescount++;
    }
    while (([differencedecimal compare:xone] == NSOrderedDescending) || ([differencedecimal compare:xone]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xone];
        onescount++;
    }
    while (([differencedecimal compare:xquarter] == NSOrderedDescending) || ([differencedecimal compare:xquarter]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xquarter];
        quarterscount++;
    }
    while (([differencedecimal compare:xdime] == NSOrderedDescending) || ([differencedecimal compare:xdime]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xdime];
        dimescount++;
    }
    while (([differencedecimal compare:xnickel] == NSOrderedDescending) || ([differencedecimal compare:xnickel]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xnickel];
        nickelscount++;
    }
    while (([differencedecimal compare:xpenny] == NSOrderedDescending) || ([differencedecimal compare:xpenny]) == NSOrderedSame)
    {
        differencedecimal = [differencedecimal decimalNumberBySubtracting:xpenny];
        penniescount++;
    }
    
    //Hide and unhide the labels and images depending if there is a value
    if (twentiescount == 0) {
        [self fadelabelout:twenties fadeimageout:twentiespng];
    } else {
        [self fadelabelin:twenties fadeimagein:twentiespng];
    }
    if (tenscount == 0) {
        [self fadelabelout:tens fadeimageout:tenspng];
    } else {
        [self fadelabelin:tens fadeimagein:tenspng];
    }
    if (fivescount == 0) {
        [self fadelabelout:fives fadeimageout:fivespng];
    } else {
        [self fadelabelin:fives fadeimagein:fivespng];
    }
    if (onescount == 0) {
        [self fadelabelout:ones fadeimageout:onespng];
    } else {
        [self fadelabelin:ones fadeimagein:onespng];
    }
    if (quarterscount == 0) {
        [self fadelabelout:quarters fadeimageout:quarterspng];
    } else {
        [self fadelabelin:quarters fadeimagein:quarterspng];
    }
    if (dimescount == 0) {
        [self fadelabelout:dimes fadeimageout:dimespng];
    } else {
        [self fadelabelin:dimes fadeimagein:dimespng];
    }
    if (nickelscount == 0) {
        [self fadelabelout:nickels fadeimageout:nickelspng];
    } else {
        [self fadelabelin:nickels fadeimagein:nickelspng];
    }
    if (penniescount == 0) {
        [self fadelabelout:pennies fadeimageout:penniespng];
    } else {
        [self fadelabelin:pennies fadeimagein:penniespng];
    }
    
    // Set the label text
    twenties.text = [NSString stringWithFormat:@"%d", twentiescount];
    tens.text = [NSString stringWithFormat:@"%d", tenscount];
    fives.text = [NSString stringWithFormat:@"%d", fivescount];
    ones.text = [NSString stringWithFormat:@"%d", onescount];
    quarters.text = [NSString stringWithFormat:@"%d", quarterscount];
    dimes.text = [NSString stringWithFormat:@"%d", dimescount];
    nickels.text = [NSString stringWithFormat:@"%d", nickelscount];
    pennies.text = [NSString stringWithFormat:@"%d", penniescount];
    
    
    
}

- (void) fadelabelin:(UILabel *)label fadeimagein:(UIImageView *)imageview
{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.75];
    [label setAlpha:1];
    [imageview setAlpha:1];
    [UIImageView commitAnimations];
    
}

- (void) fadelabelout:(UILabel *)label fadeimageout:(UIImageView *)imageview
{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.75];
    [label setAlpha:0];
    [imageview setAlpha:0];
    [UIImageView commitAnimations];
    
}

- (void) fadebuttonin:(UIButton *)button
{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.75];
    [button setAlpha:0.5];
    [UIImageView commitAnimations];
    
}

- (void) fadebuttonout:(UIButton *)button
{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.01];
    [button setAlpha:0];
    [UIImageView commitAnimations];
    
}


- (IBAction) infoButton:(id)sender
{
    
    XYZInfoViewController *info = [[XYZInfoViewController alloc] initWithNibName:nil bundle:nil];
    
    info.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:info animated:YES completion:NULL];
    
}

- (IBAction) clearButton:(id)sender
{
    
    amountTextField.text = @"$0.00";
    
    twenties.text = @"";
    tens.text = @"";
    fives.text = @"";
    ones.text = @"";
    quarters.text = @"";
    dimes.text = @"";
    nickels.text = @"";
    pennies.text = @"";
    
    [self fadebuttonout:clearbutton];
    [self fadelabelout:twenties fadeimageout:twentiespng];
    [self fadelabelout:tens fadeimageout:tenspng];
    [self fadelabelout:fives fadeimageout:fivespng];
    [self fadelabelout:ones fadeimageout:onespng];
    [self fadelabelout:quarters fadeimageout:quarterspng];
    [self fadelabelout:dimes fadeimageout:dimespng];
    [self fadelabelout:nickels fadeimageout:nickelspng];
    [self fadelabelout:pennies fadeimageout:penniespng];
    
}


@end
