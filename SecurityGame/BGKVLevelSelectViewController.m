//
//  BGKVLevelSelectViewController.m
//  SecurityGame
//
//  Created by CS121 on 11/9/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVLevelSelectViewController.h"
#import "BGKVLevelContainer.h"

@interface BGKVLevelSelectViewController ()

@end

@implementation BGKVLevelSelectViewController

- (IBAction)goToLevelOfTag:(UIControl *)sender
{
    BGKVLevelContainer *container = [[BGKVLevelContainer alloc] init];
    [container loadView];
    [container goToLevel:sender.tag andPlayCutscene:NO];
    [self presentViewController:container
                       animated:YES
                     completion:^{
                         [container playCutscene];
                     }];
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
            storyboardName = [NSString stringWithFormat:@"Level%ldStoryboard", (long)level];
            break;
        }
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
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
