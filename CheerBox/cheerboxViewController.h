//
//  cheerboxViewController.h
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface cheerboxViewController : UIViewController <UITableViewDelegate,
    UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate, ADBannerViewDelegate>

@property (strong, nonatomic) NSArray *cheers;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property IBOutlet UISearchBar *searchBar;
- (IBAction)shufflePressed:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet ADBannerView *adView;

@end
