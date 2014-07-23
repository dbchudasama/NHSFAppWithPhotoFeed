//
//  CampusTableViewController.m
//  NHSFApp
//
//  Created by DivyeshBC on 28/06/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "CampusTableViewController.h"
#import "NHSFAffiliatedChapterData.h"
#import "NHSFChapterObject.h"
#import "NHSFChapterImageViewController.h"
#import "NHSFChapterDataViewController.h"

@interface CampusTableViewController ()

@end

@implementation CampusTableViewController

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
    
    self.chapters = [[NSMutableArray alloc] init];
    
    //Adding OBJECTS to the array instead NSStrings.

    //Firstly creating a for loop so that we can iterate through all of the chapter and create NHSFChapterObjects from our data and then add that to our chapters array.
    
    //Using fast enumeration. New dictionary will iterate through already created dictionary of information
    for (NSMutableDictionary *chapterData in [NHSFAffiliatedChapterData allAffiliatedChapters])
    {
        //Each time it iterates it will create a variable *imageName of type NSString with a Key of type [Key_Name] and corresponding images following same naming convention. Make sure the image names are exactly the same as the chapter names defined in the dictionary. Dynamically creating NSSTring *imageName
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", chapterData[CHAPTER_NAME]];
        //Creates a new object of type objectType 'NHSFCHapterObject in this case' using our custom initialiser method and passing in NSMutableDictionary and also passing in an image UIImange will return an image BEFORE intitialiser takes place
        NHSFChapterObject *chapter = [[NHSFChapterObject alloc] initWithData:chapterData andImage:[UIImage imageNamed: imageName]];
        //Finally adding object to the array so that the table view can be updates accordingly
        [self.chapters addObject:chapter];
        
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Checks to see if the sendeer is actually a UITableView Cell
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        //Checks destinationViewController based on it's class and if it is correct
        if([segue.destinationViewController isKindOfClass:[NHSFChapterImageViewController class]])
        {
            //Allowing access to destinationViewController and it's properties just before segue occurs. The sender can then be used to find out what is being displayed on the UITableViewCell
            NHSFChapterImageViewController *nextViewController = segue.destinationViewController;
            
            //Give me back the indexPath for my cell and we know this because we are setting our argument for the indexPathForCell as 'sender'. Automatic access is gained to the property .tableview as this file is a TableViewController
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            
            //Indexing into array of objects with argument as the sender index cell. Gives back the object and stores in the variable pointer selectedObject
            NHSFChapterObject *selectedObject = [self.chapters objectAtIndex:path.row];
            
            //Setting the property of the object for the next view controller as the image for that cell
            nextViewController.chapterObject = selectedObject;
        }
    }

    //Once again using introspection to check if the trigger has been caused by NSIndexPath. Index Path because that is the argument in the method accessoryButton....below
    if([sender isKindOfClass:[NSIndexPath class]])
    {
        //Remaining explanations are ditto to above
        if([segue.destinationViewController isKindOfClass:[NHSFChapterDataViewController class]])
        {
            NHSFChapterDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            NHSFChapterObject *selectedObject = self.chapters[path.row];
            targetViewController.chapterObject = selectedObject;
        }
    }

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
    return [self.chapters count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    static NSString *CellIdentifier = @"CampusCell"; //Identifier for the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Accessing the Objects in the chapters array
    NHSFChapterObject *chapter = [self.chapters objectAtIndex:indexPath.row];
    
    //Updating cell so that the text label of the cell is the name of the object
    cell.textLabel.text = chapter.name;
    
    //Updating the cell subtitle so that it displays the chapter zone in orange
    cell.detailTextLabel.text = chapter.zone;
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    
    //TableView Cells come with a default property called image and imageViews also have a property image, so set the image cell image property to the chapterImage property for array chapters
    cell.imageView.image = chapter.chapterImage;

    
    return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"push to chapter detail page" sender:indexPath];
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
