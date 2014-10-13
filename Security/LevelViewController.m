//
//  LevelViewController.m
//  Security
//
//  Created by Hayden Blauzvern on 10/12/14.
//  Copyright (c) 2014 Blauzvern Gilkinson Kutsko Valentine. All rights reserved.
//

#import "LevelViewController.h"
#import "LevelModel.h"

@interface LevelViewController () {
    LevelModel* _model;
}

@end

@implementation LevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [LevelModel alloc];
    
    NSMutableArray* views = [[NSMutableArray alloc] init];
    [views addObject:self.chair];
    [views addObject:self.laptop];
    [views addObject:self.desk];
    [views addObject:self.paper];
    
    for (UIImageView* view in views) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap.numberOfTapsRequired = 1;
        [view addGestureRecognizer:tap];
    }
}

-(void)viewTapped: (UITapGestureRecognizer*) recognizer
{
    NSString* tappedItem = @"";
    switch (recognizer.view.tag) {
        case 0:
            tappedItem = @"Desk";
            break;
        case 1:
            tappedItem = @"Paper";
            break;
        case 2:
            tappedItem = @"Chair";
            break;
        case 3:
            tappedItem = @"Laptop";
            break;
    }
    NSLog(@"The tapped item is: %@", tappedItem);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
