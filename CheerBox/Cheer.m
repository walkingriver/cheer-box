//
//  Cheer.m
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import "Cheer.h"

@implementation Cheer
@synthesize title;
@synthesize description;

+(id)cheerOfTitle:(NSString *)title
     description:(NSString *)description
{
    Cheer *newCheer = [[self alloc]init];
    newCheer.title = title;
    newCheer.description = description;
    newCheer.order = arc4random();
    return newCheer;
}
@end
