//
//  BGKVLoadScreenViewController.m
//  SecurityGame
//
//  Created by Hayden Blauzvern on 11/10/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLoadScreenViewController.h"

@interface BGKVLoadScreenViewController ()

@end

@implementation BGKVLoadScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextLevelButton.hidden = YES;
    self.spinner.hidesWhenStopped = YES;
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    
    // Used from https://agilewarrior.wordpress.com/2012/04/03/how-to-display-uiactivityindicatorview-spinner-for-long-running-operations/
    // how we stop refresh from freezing the main UI thread
    dispatch_queue_t downloadQueue = dispatch_queue_create("spinningwheel", NULL);
    dispatch_async(downloadQueue, ^{
        
        // do our long running process here
        [NSThread sleepForTimeInterval:1];
        
        // do any UI stuff on the main UI thread
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            self.nextLevelButton.hidden = NO;
        });
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
