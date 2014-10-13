//
//  ViewController.m
//  Security
//
//  Created by Hayden Blauzvern on 10/10/14.
//  Copyright (c) 2014 Blauzvern Gilkinson Kutsko Valentine. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterModel.h"

@interface MasterViewController () {
    MasterModel* _model;
}

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [MasterModel alloc];
}

-(IBAction)startLevelButtonPressed:(id) selector
{
    NSLog(@"TextField contains: %@", self.textField.text);
    NSLog(@"MasterViewController: %@", [_model getLevelData:self.textField.text]);
    [self performSegueWithIdentifier:@"SegueToLevelView" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
