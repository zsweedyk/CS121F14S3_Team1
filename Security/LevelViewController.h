//
//  LevelViewController.h
//  Security
//
//  Created by Hayden Blauzvern on 10/12/14.
//  Copyright (c) 2014 Blauzvern Gilkinson Kutsko Valentine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LevelViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView* chair;
@property (nonatomic, weak) IBOutlet UIImageView* desk;
@property (nonatomic, weak) IBOutlet UIImageView* paper;
@property (nonatomic, weak) IBOutlet UIImageView* laptop;

-(IBAction)viewTapped: (UITapGestureRecognizer*) recognizer;

@end
