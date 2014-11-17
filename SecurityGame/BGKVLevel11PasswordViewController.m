//
//  BGKVLevel11PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel11PasswordViewController.h"

@implementation BGKVLevel11PasswordViewController

- (IBAction) submitPressed
{
    self.informationField.hidden = YES;
    self.postSubmitInfo.hidden = NO;
    self.submitButton.hidden = YES;
    self.continueButton.hidden = NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}

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
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
