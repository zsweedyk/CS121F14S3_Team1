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

@end
