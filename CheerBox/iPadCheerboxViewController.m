//
//  iPadCheerboxViewController.m
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/29/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import "iPadCheerboxViewController.h"

@interface iPadCheerboxViewController ()

@end

@implementation iPadCheerboxViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"clicked");
}

@end
