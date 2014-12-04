//
//  BGKVHintView.h
//  SecurityGame
//
//  Created by Guest User on 12/2/14.
//  Copyright (c) 2014 BGKV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGKVSingleHintViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title andText:(NSString *)text;

@property (nonatomic) NSString *hintTitle;
@property (nonatomic) NSString *hintText;

@property (nonatomic) IBOutlet UILabel *hintTitleLabel;
@property (nonatomic) IBOutlet UITextView *hintTextTextView;

@end
