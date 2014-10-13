//
//  MasterModel.m
//  Security
//
//  Created by Hayden Blauzvern on 10/10/14.
//  Copyright (c) 2014 Blauzvern Gilkinson Kutsko Valentine. All rights reserved.
//

#import "MasterModel.h"

@implementation MasterModel

- (NSString*) getLevelData: (NSString*) level
{
    NSLog(@"I am the MasterModel, passing up the data");
    return [@"Got current data for level " stringByAppendingString:level];
}

@end
