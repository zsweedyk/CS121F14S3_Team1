//
//  BGKVLevel11PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel11PasswordViewController.h"

@implementation BGKVLevel11PasswordViewController

- (IBAction) submitPressed:(id)sender
{
    self.informationField.hidden = YES;
    self.submitButton.hidden = YES;
    
    self.postSubmitInfo.hidden = NO;
    self.continueButton.hidden = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self performSegueWithIdentifier:@"SegueToLoadScreen" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


@end
