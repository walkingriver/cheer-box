//
//  cheerboxViewController.h
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cheerboxViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *cheers;
@end
