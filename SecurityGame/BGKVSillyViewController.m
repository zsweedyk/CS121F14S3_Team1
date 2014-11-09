//
//  BGKVSillyViewController.m
//  SecurityGame
//
//  Created by Guest User on 11/6/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import "BGKVSillyViewController.h"
#import "BGKVLevelViewController.h"

@interface BGKVSillyViewController ()

@end

@implementation BGKVSillyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"Aloha!");
        //self.container.autoresizesSubviews = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"I'm alive!");
    [self performSegueWithIdentifier:@"InitialContentView" sender:nil];
    NSLog(@"Done performing segue!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveToNewController:(BGKVLevelViewController *) newController {
    NSLog(@"Moving to new controller!");
    BGKVLevelViewController *currentVC = self.currentVC;
    NSAssert(currentVC, @"Tried to switch views before having one");
    [currentVC willMoveToParentViewController:nil];
    [self resizeVCViewToContainer:newController];
    [self transitionFromViewController:currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil
                            completion:^(BOOL finished) {
                                [currentVC removeFromParentViewController];
                                currentVC.levelMaster = nil;
                                [newController didMoveToParentViewController:self];
                                newController.levelMaster = self;
                            }];
    
}

-(void)presentFirstController:(BGKVLevelViewController *) firstController {
    NSLog(@"And it is the first!");
    [self addChildViewController:firstController];
    [firstController didMoveToParentViewController:self];
    [self.container addSubview:firstController.view];
    [self resizeVCViewToContainer:firstController];
    
    UIViewController *vc=firstController;
    NSLog(@"%f:%f",firstController.view.frame.origin.x, firstController.view.frame.origin.y);
}

-(void)resizeVCViewToContainer:(UIViewController *)vc {
    CGRect currentFrame = vc.view.frame;
    currentFrame = CGRectMake(currentFrame.origin.y,currentFrame.origin.x,currentFrame.size.height,currentFrame.size.width);
    vc.view.frame = currentFrame;
    CGRect containerFrame = self.container.bounds;
    
    
    NSLog([self printRect:vc.view.frame]);
    

    
    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = self.container.bounds;
    
    // Create a path with the rectangle in it.
    CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
    
    // Set the path to the mask layer.
    maskLayer.path = path;
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    // Set the mask of the view.
    self.container.layer.mask = maskLayer;
    
    //vc.view.frame = self.container.bounds;
    
    NSLog(@"%@ %@",@"Container:",[self printRect:containerFrame]);
    NSLog([self printRect:vc.view.frame]);
    
    //vc.view.transform = [self transformFromRect:currentFrame toRect:containerFrame];
    vc.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                               (containerFrame.size.width/currentFrame.size.width),
                                               (containerFrame.size.height/currentFrame.size.height)
                                               );
    
    CGPoint LR = CGPointMake(1002, 747);
    CGPoint nLR = CGPointApplyAffineTransform(LR, vc.view.transform);
    NSLog(@"Lower right: (%f, %f) -> (%f, %f)", LR.x, LR.y, nLR.x, nLR.y);
    
    NSLog([self printRect:vc.view.frame]);
    
    /*CGAffineTransformScale(vc.view.transform,
                                               (containerFrame.size.width/currentFrame.size.width),
                                               (containerFrame.size.height/currentFrame.size.height)
                                               );*/
    vc.view.frame = CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height);
    
    NSLog([self printRect:vc.view.frame]);
}

- (NSString *) printRect:(CGRect)rect {
    return [NSString stringWithFormat:@"Rect: (%f, %f) + %f x %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height];
}

- (CGAffineTransform)transformFromRect:(CGRect)A toRect:(CGRect)B {
    CGFloat sx = CGRectGetWidth(B)/CGRectGetWidth(A);
    CGFloat sy = CGRectGetHeight(B)/CGRectGetHeight(A);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    NSLog(@"Blergh1: %@",[self printRect:CGRectApplyAffineTransform(A, transform)]);
    transform = CGAffineTransformTranslate(transform, -CGRectGetMidX(A), -CGRectGetMidY(A));
    NSLog(@"Blergh2: %@",[self printRect:CGRectApplyAffineTransform(A, transform)]);
    transform = CGAffineTransformScale(transform, sx, sy);
    NSLog(@"Blergh3: %@",[self printRect:CGRectApplyAffineTransform(A, transform)]);
    transform = CGAffineTransformTranslate(transform, CGRectGetWidth(A)/2, CGRectGetHeight(A)/2);
    NSLog(@"Blergh4: %@",[self printRect:CGRectApplyAffineTransform(A, transform)]);
    transform = CGAffineTransformTranslate(transform, B.origin.x, B.origin.y);
    NSLog(@"Blergh5: %@",[self printRect:CGRectApplyAffineTransform(A, transform)]);
    CGPoint LR = CGPointMake(1002, 747);
    CGPoint nLR = CGPointApplyAffineTransform(LR, transform);
    NSLog(@"Lower right: (%f, %f) -> (%f, %f)", LR.x, LR.y, nLR.x, nLR.y);
    return transform;
}



@end
