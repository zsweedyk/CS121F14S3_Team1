//
//  BGKVLevelSelectViewController.m
//  SecurityGame
//
//  Created by CS121 on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelSelectViewController.h"

@interface BGKVLevelSelectViewController ()

@end

@implementation BGKVLevelSelectViewController

- (IBAction)goToLevelOfTag:(UIControl *)sender
{
    [self presentViewController:[BGKVLevelSelectViewController initialVCForLevel:sender.tag]
                       animated:YES
                     completion:nil];
}

+ (UIViewController *)initialVCForLevel:(NSInteger)level
{
    NSString *storyboardName;
    
    switch (level) {
        case 0: {
            storyboardName = @"TutorialLevelStoryboard";
            break;
        }
            
        default: {
            storyboardName = [NSString stringWithFormat:@"Level%dStoryboard", level];
            break;
        }
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateInitialViewController];
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
