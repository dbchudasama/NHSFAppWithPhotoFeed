//
//  EventsTableViewController.m
//  NHSFApp
//
//  Created by DivyeshBC on 28/06/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "EventsTableViewController.h"
#import "Event.h"
#import "NHSFEventDetailViewController.h"

#define getURLData @"http://dbchudasama.webfactional.com/jsonscript.php"


@interface EventsTableViewController ()

@end

@implementation EventsTableViewController

@synthesize jsonArray, eventsArray;

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
    
    //Set the title of the VC
    //self.title = @"NHSF National Events";
    
    //Load data
    [self retrieveData];
    
//    //Initialising our Main Menu Options Array
//    self.eventsMenuOptions = [[NSMutableArray alloc] init];
//    
//    //Creating Array Objects to match Table View cell
//    NSString *NationalEvents = @"National Events";
//    NSString *ImportantDates = @"Important Dates";
//   
//    
//    
//    //Now adding the above objects to the Array mainMenuOptions
//    [self.eventsMenuOptions addObject:NationalEvents];
//    [self.eventsMenuOptions addObject:ImportantDates];
//
    
    
    
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
    return [self.eventsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Event *eventObject;
    
    //Grab the current object in indexPath and set it to evetn object
    eventObject = [eventsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = eventObject.eventName;
    
    //Accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"pushDetailView"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //Get the object for the selected row
        Event *object = [eventsArray objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getEvent:object];
    }

}


#pragma mark - Class Method

//Method to retrieve data from database
-(void)retrieveData
{
    //Passing in the URL of the database
    NSURL *url = [NSURL URLWithString:getURLData];
    
    //Creating object of the database data
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up the events array
    eventsArray = [[NSMutableArray alloc ] init];
    
    //Loop through the jsonArray
    for (int i=0; i < jsonArray.count; i++) {
        
        //Create the event object
        NSString *eID = [[jsonArray objectAtIndex:i] objectForKey:@"id"];
        NSString *eName = [[jsonArray objectAtIndex:i] objectForKey:@"eventName"];
        NSString *eDate = [[jsonArray objectAtIndex:i] objectForKey:@"eventDate"];
        NSString *eTime = [[jsonArray objectAtIndex:i] objectForKey:@"eventTime"];
        NSString *eLocation = [[jsonArray objectAtIndex:i] objectForKey:@"eventLocation"];
        
        //Now, add the evetns object to our events array
        [eventsArray addObject:[[Event alloc] initWithEventName:eName andEventDate:eDate andEventTime:eTime andEventLocation:eLocation andEventID:eID]];
    }
    
    //Reload the table data
    [self.tableView reloadData];
}



@end
