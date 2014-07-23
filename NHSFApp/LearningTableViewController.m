//
//  LearningTableViewController.m
//  NHSFApp
//
//  Created by DivyeshBC on 28/06/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "LearningTableViewController.h"

@interface LearningTableViewController ()

@end

@implementation LearningTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    //Initialising our Main Menu Options Array
//    self.learningMenuOptions = [[NSMutableArray alloc] init];
//    
//    //Creating Array Objects to match Table View cell
//    NSString *PrayersSection = @"Prayers Section";
//    NSString *MustKnowMantras = @"Must Know Mantra's";
//    NSString *MustWatchVideos = @"Must Watch Videos";
//    NSString *MustRead = @"Must Read";
//    NSString *PostersAndQuotes = @"Posters & Quotes";
//    NSString *Festivals = @"Festivals";
//    NSString *FreshersPack = @"Freshers Pack";
//    
//    
//    
//    //Now adding the above objects to the Array mainMenuOptions
//    [self.learningMenuOptions addObject:PrayersSection];
//    [self.learningMenuOptions addObject:MustKnowMantras];
//    [self.learningMenuOptions addObject:MustWatchVideos];
//    [self.learningMenuOptions addObject:MustRead];
//    [self.learningMenuOptions addObject:PostersAndQuotes];
//    [self.learningMenuOptions addObject:Festivals];
//    [self.learningMenuOptions addObject:FreshersPack];
    
   

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 8;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"LearningCell"; //Identifier for the cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    cell.textLabel.text = [self.learningMenuOptions objectAtIndex:indexPath.row];
//    //The above will return back the rows in integers whilst accessing the row property. In this
//    //case, we can index into our array of objects and get an object back from the array and set
//    //this equal to our text label
//    
//    return cell;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
