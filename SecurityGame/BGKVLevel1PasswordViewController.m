//
//  BGKVLevel1PasswordViewController.m
//  SecurityGame
//
//  Created by Guest User on 10/21/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevel1PasswordViewController.h"

@interface BGKVLevel1PasswordViewController ()

@end

@implementation BGKVLevel1PasswordViewController

- (IBAction)checkPassword:(UITextField *)sender {
    NSString * password = @"frog";
    NSString * guess = sender.text;
    
    if ([guess isEqualToString:password]) {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"You guessed right!"
                               message:@"Good for you, you little shit."
                               delegate:nil
                               cancelButtonTitle:@"Fuck off" otherButtonTitles:nil];
        [alert show];
    } else {
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"You guessed WRONG!"
                               message:@"Hahaha, why are you even alive!"
                               delegate:nil
                               cancelButtonTitle:@"Okay..." otherButtonTitles:nil];
        sender.text = @"";
        [alert show];
    }
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
