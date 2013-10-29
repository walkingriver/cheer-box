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
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld)", cheer.title, (long)cheer.order];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)setupCheers
{
	// Do any additional setup after loading the view, typically from a nib.
    self.cheers = nil;
    
    self.cheers = [NSArray arrayWithObjects:
                   [Cheer cheerOfTitle:@"Almost" description:@"With hands far apart, bring them rapidly together but miss just before meeting each other."],
                   [Cheer cheerOfTitle:@"Archery" description:@"Shoot arrow and shout \"BULLS EYE.\""],
                   [Cheer cheerOfTitle:@"Avon Lady Cheer" description:@"\"Dinnnnng! Donnnng!\""],
                   [Cheer cheerOfTitle:@"Baseball Cheer" description:@"\"Back, Back, Back, It's out of here! Homerun!\""],
                   [Cheer cheerOfTitle:@"Bee Cheer" description:@"\"Bzzzzzzzz, Bzzzzzzz, OUCH!\""],
                   [Cheer cheerOfTitle:@"Beehive Cheer" description:@"Buzz gets louder or softer when leader's hand is high or low."],
                   [Cheer cheerOfTitle:@"Bear Cheer" description:@"\"Grrrrrr!\""],
                   [Cheer cheerOfTitle:@"Big Hand" description:@"Leader says, \"let's give them a big hand\" everybody holds up one hand, palm out."],
                   [Cheer cheerOfTitle:@"Blastoff" description:@"\"10 9 8 7 6 5 4 3 2 1 BLASTOFF!\""],
                   [Cheer cheerOfTitle:@"Canned Cheer" description:@"Leader opens and closes imaginary can, to start and stop cheering."],
                   [Cheer cheerOfTitle:@"Canned Laughter" description:@"Leader opens and closes imaginary can, to start and stop laughter."],
                   [Cheer cheerOfTitle:@"Cat cheer" description:@"\"MeeeeOOOOW!!!\""],
                   [Cheer cheerOfTitle:@"Clam" description:@"Fold hands together, interlocking fingers. Make noise by pressing palms together."],
                   [Cheer cheerOfTitle:@"Class A" description:@"Clap in this rhythm: 1-2-3-4, 1-2, 1-2, 1-2-3-4, 1-2, 1-2, 1-2-3-4...(pause)..One big clap."],
                   [Cheer cheerOfTitle:@"Cow Cheer" description:@"\"MOOOOO!!!\""],
                   [Cheer cheerOfTitle:@"Cowboy Cheer" description:@"Twirl lasso. Yell: \"Yeeee Haaaw!!!\""],
                   [Cheer cheerOfTitle:@"Coyote Cheer" description:@"\"\"YIP, YIP, YIPEEEE!!!!!\"!!!\""],
                   [Cheer cheerOfTitle:@"Doctor's Cheer" description:@"Open up, tongs out, everyone say \"Aaaaaah!\""],
                   [Cheer cheerOfTitle:@"Dog Cheer" description:@"\"Woof, woof, woof!\""],
                   [Cheer cheerOfTitle:@"Drum Roll" description:@"Pat knees soft then loud, then one last pat."],
                   [Cheer cheerOfTitle:@"Duck Call" description:@"Make a duck call by making a circle with thumb & index finger. Blow like a trumpet."],
                   [Cheer cheerOfTitle:@"Easy Duck Call" description:@"Make a duck call as above but instead yell, \"Here duck! Here duck!\""],
                   [Cheer cheerOfTitle:@"Dynamite" description:@"Light fuse, \"Sssssssssssssss, BOOM!\""],
                   [Cheer cheerOfTitle:@"Eskimo" description:@"Hold your shoulders, shiver, say \"Brrrr.\""],
                   [Cheer cheerOfTitle:@"Ferris Wheel" description:@"Like Round of Applause but also say \"Ooooh\" on the way up, \"Aaaah\" on the way down."],
                   [Cheer cheerOfTitle:@"Fireworks Cheer" description:@"Look up at the ceiling and say \"OOOOOH!\" \"AHHHHH!\""],
                   [Cheer cheerOfTitle:@"Food Cheer" description:@"\"Yuuuummm!\""],
                   [Cheer cheerOfTitle:@"Football" description:@"Signal a touchdown and yell \"Touchdown!\""],
                   [Cheer cheerOfTitle:@"Fred Flintstone Cheer" description:@"\"Yabba-dabba-doo\"."],
                   [Cheer cheerOfTitle:@"Frog Cheer" description:@"Crouch down. Jump Up.\"Ribbit! Ribbit!\""],
                   [Cheer cheerOfTitle:@"Ghost, fast" description:@"\"Boo!\""],
                   [Cheer cheerOfTitle:@"Ghost, scary" description:@"Stand, hands up: \"Whooooooooo.\""],
                   [Cheer cheerOfTitle:@"Good Turn" description:@"Stand, clap as you turn in one full circle."],
                   [Cheer cheerOfTitle:@"Homerun cheer" description:@"\"Back…Back…Back…HOMERUN!"],
                   [Cheer cheerOfTitle:@"Ice cube cheer" description:@"\"COOOOOOOOOL!\""],
                   [Cheer cheerOfTitle:@"Jet flying" description:@"\"ZOOOOOM\""],
                   [Cheer cheerOfTitle:@"Jet flying backwards" description:@"\"MOOOOOZ!\""],
                   [Cheer cheerOfTitle:@"Ketchup Bottle Cheer" description:@"Hold bottle in one hand and slap with other hand to get ketchup out."],
                   [Cheer cheerOfTitle:@"Magician's Cheer" description:@"\"Taaa Daaa!\""],
                   [Cheer cheerOfTitle:@"Mosquito Cheer" description:@"Slap face, neck, shoulders, etc."],
                   [Cheer cheerOfTitle:@"One hand cheer" description:@"Leader: \"What is the sound of one hand clapping?\" Everyone claps one hand."],
                   [Cheer cheerOfTitle:@"Photographer's cheer" description:@"Pretend to take their picture. \"Everyone smile. Say Cheeese!\""],
                   [Cheer cheerOfTitle:@"Pig Cheer" description:@"Suueeee, Pig! Pig! Pig!"],
                   [Cheer cheerOfTitle:@"Politician's Cheer" description:@"Pat yourself on the back."],
                   [Cheer cheerOfTitle:@"Popcorn Cheer" description:@"\"Pop! . . . Pop! . . Pop! Pop! Pop! Pop! Pop! Pop! Pop! Pop! Pop!\""],
                   [Cheer cheerOfTitle:@"Relay Clap" description:@"First person claps second person's hand and then relay it on through all of the Cubs."],
                   [Cheer cheerOfTitle:@"Roller Coaster Cheer" description:@"Hold onto bar, tip back, say \"Click,click, click, click, click, WHEEEEEE!\""],
                   [Cheer cheerOfTitle:@"Round of Applause" description:@"While clapping hands, move them around in a circle in front of you."],
                   [Cheer cheerOfTitle:@"Seal of Approval" description:@"Put your arms straight out together. Clap flippers and say \"Ort, Ort, Ort\""],
                   [Cheer cheerOfTitle:@"Silent Yell" description:@"Everyone stands and open their mouths and screams without making any sound."],
                   [Cheer cheerOfTitle:@"Six Shooter Cheer" description:@"Point imaginary gun in air and say \"BANG!\" six times."],
                   [Cheer cheerOfTitle:@"Supersonic Cheer" description:@"Wave arms; pretend to cheer. Sit down wait a moment, then make sounds."],
                   [Cheer cheerOfTitle:@"Surgeon's Cheer" description:@"Right Side of room: \"Scalpel!\" Left Side: \"Sponge!\" Back: \"Oops!\" Go faster & faster."],
                   [Cheer cheerOfTitle:@"Theater Cheer" description:@"\"Bravo! Bravo! Bravo!\""],
                   [Cheer cheerOfTitle:@"Thunderstorm Cheer" description:@"Pat knees soft them loud, then yell \"Booom\""],
                   [Cheer cheerOfTitle:@"Tiger call" description:@"Quietly: \"Here, kitty, kitty, kitty.\" \"Here, kitty, kitty, kitty.\""],
                   [Cheer cheerOfTitle:@"Tony the Tiger cheer" description:@"\"They're Greeeeeat!\""],
                   [Cheer cheerOfTitle:@"Water Sprinkler" description:@"Move outstretched arm in a circle: \"Choo, Choo, Choo, etc.\" Swing back \"Whee!\""],
                   [Cheer cheerOfTitle:@"Watermelon" description:@"Hold a big slice in both hands, suck up from one end to the other, spit out the seeds."],
                   [Cheer cheerOfTitle:@"Wave" description:@"As done at sports, stand, raise hand and cheer then sit as a wave around the room."],
                   [Cheer cheerOfTitle:@"Wave of applause" description:@"Lie Wave but clap on your turn."],
                   [Cheer cheerOfTitle:@"Wolf Cheer" description:@"Wolf howl: \"Wooooooooooooooooooo!\""], nil];
    
    [self sortCheers];
}

-(void)sortCheers{
    NSArray *sortedArray;
    
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

    [self setupCheers];
    
    // Initialize the search results with a capacity equal to the total cheers' array capacity
    self.searchResults = [NSMutableArray arrayWithCapacity:[self.cheers count]];
    
    // reload the table
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
//        
//        
//        if (sender == self.searchDisplayController.searchResultsTableView) {
//            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
//            cheer = [_searchResults objectAtIndex:[indexPath row]];
//        } else {
//            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//            cheer= [_cheers objectAtIndex:[indexPath row]];
//        }

        controller.cheer = cheer;
    }
}
@end
