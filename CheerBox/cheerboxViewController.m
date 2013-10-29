//
//  cheerboxViewController.m
//  CheerBox
//
//  Created by Callaghan, Michael D. on 10/28/13.
//  Copyright (c) 2013 Walking River Software. All rights reserved.
//

#import "cheerboxViewController.h"
#import "Cheer.h"

@interface cheerboxViewController ()

@end

@implementation cheerboxViewController
{
}
@synthesize cheers;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cheers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    // Grab the appropriate cheer
    Cheer *cheer = nil;
    cheer = [cheers objectAtIndex:indexPath.row];
    
    // Now configure the cell
    cell.textLabel.text = cheer.title;
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    cheers = [NSArray arrayWithObjects:
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

    // reload the table
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be
}
@end
