//
//  detailViewController.h
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/29/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cheer.h"

@interface detailViewController : UIViewController
@property Cheer* cheer;
@property (weak, nonatomic) IBOutlet UITextView *cheerDetails;

@end
