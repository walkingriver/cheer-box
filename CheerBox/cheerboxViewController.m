//
//  cheerboxViewController.m
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import "cheerboxViewController.h"
#import "Cheer.h"
#import "detailViewController.h"



@implementation cheerboxViewController
{
}


-(NSArray*)getVisibleCheersFromTable:(UITableView*)tableView {
    /// @description Determines which cheers list is visible.
   
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return _searchResults;
    } else {
        return _cheers;
    }
}

-(Cheer*)getSelectedCheerFromTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    /// @description Grabs the selected cheer from the appropriate list.
    Cheer *cheer = [[self getVisibleCheersFromTable:tableView] objectAtIndex:indexPath.row];
    return cheer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /// @description Called by the framework to retrieve the number of rows in the currently-visible list.
    return [self getVisibleCheersFromTable:tableView].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /// @description Called by the framework to render a specific cell.
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Get the selected Cheer
    Cheer* cheer = [self getSelectedCheerFromTableView:tableView
                                 cellForRowAtIndexPath:indexPath];
      
    // Now configure the cell
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld)", cheer.title, (long)cheer.order];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", cheer.title];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

-(void)sortCheers{
    NSArray *sortedArray;
    
    // rip through the array and change the order property of each element
    for (Cheer *cheer in _cheers) {
        [cheer reorder];
    }
    
    sortedArray = [_cheers sortedArrayUsingComparator:
                    // Who else thinks this looks a lot like a lambda expression???
                   ^NSComparisonResult(Cheer* obj1, Cheer* obj2) {
                       return obj1.order > obj2.order;
                   }
                ];
    
    _cheers = sortedArray;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.canDisplayBannerAds = YES;
    [self.tableView.tableFooterView addSubview:_adView];
    [self setupCheers];
    [self reloadCheers];
}

- (void)setupCheers
{
	// Do any additional setup after loading the view, typically from a nib.
    self.cheers = [Cheer getCheers];
}

-(IBAction)shufflePressed:(UIBarButtonItem *)sender
{
    NSLog(@"Shuffle pressed!");
    [self reloadCheers];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device Shaken!");
        [self reloadCheers];
    }
}

-(void)reloadCheers{
    
    // Initialize the search results with a capacity equal to the total cheers' array capacity
    self.searchResults = [NSMutableArray arrayWithCapacity:[self.cheers count]];
    
    [self sortCheers];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.searchResults removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title contains[c] %@",searchText];
    self.searchResults = [NSMutableArray arrayWithArray:[self.cheers filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Perform a segue to the row detail
    [self performSegueWithIdentifier:@"details" sender:tableView];
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"details"]){
        detailViewController *controller = [segue destinationViewController];
        
        Cheer *cheer=[self getSelectedCheerFromTableView:sender
                                   cellForRowAtIndexPath:[sender indexPathForSelectedRow]];

        controller.cheer = cheer;
    }
}

#pragma mark iAd Delegate Methods
-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"%@", [banner debugDescription]);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"%@", [banner debugDescription]);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
