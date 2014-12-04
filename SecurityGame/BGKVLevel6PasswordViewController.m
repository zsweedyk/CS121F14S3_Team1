//
//  BGKVLevel3PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel6PasswordViewController.h"

@interface BGKVLevel6PasswordViewController () <UITextFieldDelegate>

@end

@implementation BGKVLevel6PasswordViewController

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
 //   self.passwordField.delegate = self;
}

@end
