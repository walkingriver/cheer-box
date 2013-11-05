//
//  Cheer.h
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cheer : NSObject
{
    NSString *title;
    NSString *description;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic) NSInteger order;

+(NSArray*) getCheers;

+ (id)cheerOfTitle:(NSString*)title
      description:(NSString*)description;

-(void)reorder;
@end
