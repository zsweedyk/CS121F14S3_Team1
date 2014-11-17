//
//  BGKVLevel12PasswordViewController.m
//  SecurityGame
//
//  Created by Sarah Gilkinson on 11/16/14
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel12PasswordViewController.h"

@implementation BGKVLevel12PasswordViewController

- (void) showHttp:(BOOL)show
{
    self.httpInformationField.hidden = !show;
    self.returnButton.hidden = !show;
}

- (void) showHttps:(BOOL)show
{
    self.httpsInformationField.hidden = !show;
    self.continueButton.hidden = !show;
}

- (void) showMain:(BOOL)show
{
    self.informationField.hidden = !show;
    self.httpButton.hidden = !show;
    self.httpsButton.hidden = !show;
}

- (IBAction)showHttpOption:(id)sender
{
    [self showHttp:YES];
    [self showHttps:NO];
    [self showMain:NO];
    
}

- (IBAction)showHttpsOption:(id)sender
{
    [self showHttp:NO];
    [self showHttps:YES];
    [self showMain:NO];
}

- (IBAction)resetScreen:(id) sender
{
    [self showHttp:NO];
    [self showHttps:NO];
    [self showMain:YES];
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
