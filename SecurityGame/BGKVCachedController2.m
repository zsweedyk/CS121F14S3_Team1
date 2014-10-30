//
//  BGKVCachedController2.m
//  SecurityGame
//
//  Created by HMC Guest on 10/30/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVCachedController2.h"

@interface BGKVCachedController2 ()

@end

@implementation BGKVCachedController2

UIViewController *A, *B;

- (CGRect)frameForContentController {
    return CGRectMake(0,0,100,100);
}
- (CGRect)newViewStartFrame {
    return CGRectMake(100, 0, 100, 100);
}
- (CGRect)oldViewEndFrame {
    return CGRectMake(-100, 0, 100, 100);
}

- (void) displayContentController: (UIViewController *) content {
    [self addChildViewController:content];
    content.view.frame = [self frameForContentController];
    [self.view addSubview:self.currentClientView];
    [content didMoveToParentViewController:self];
}

- (void) hideContentController: (UIViewController*) content
{
    [content willMoveToParentViewController:nil];  // 1
    [content.view removeFromSuperview];            // 2
    [content removeFromParentViewController];      // 3
}

- (void) cycleFromViewController: (UIViewController*) oldC
                toViewController: (UIViewController*) newC
{
    [oldC willMoveToParentViewController:nil];                        // 1
    [self addChildViewController:newC];
    
    newC.view.frame = [self newViewStartFrame];                       // 2
    CGRect endFrame = [self oldViewEndFrame];
    
    [self transitionFromViewController: oldC toViewController: newC   // 3
                              duration: 0.25 options:0
                            animations:^{
                                newC.view.frame = oldC.view.frame;                       // 4
                                oldC.view.frame = endFrame;
                            }
                            completion:^(BOOL finished) {
                                [oldC removeFromParentViewController];                   // 5
                                [newC didMoveToParentViewController:self];
                            }];
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
    A = [[UIViewController alloc] init];
    B = [[UIViewController alloc] init];
    
    UIButton* button_a = [[UIButton alloc] initWithFrame:CGRectMake(50, 50,20, 20)];
    [button_a addTarget:self
               action:@selector(firstThing:)
     forControlEvents:UIControlEventTouchUpInside];
    [button_a setTitle:@"Cycle to B" forState:UIControlStateNormal];
    [A.view addSubview:button_a];
    
    UIButton* button_b = [[UIButton alloc] initWithFrame:CGRectMake(50, 50,20, 20)];
    [button_b addTarget:self
                 action:@selector(secondThing:)
       forControlEvents:UIControlEventTouchUpInside];
    [button_b setTitle:@"Cycle to A" forState:UIControlStateNormal];
    [A.view addSubview:button_b];
    
    [self displayContentController:A];
}

- (void)firstThing:(UIButton *)sender {
    [self cycleFromViewController:A toViewController:B];
}
- (void)secondThing:(UIButton *)sender {
    [self cycleFromViewController:B toViewController:A];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
