//
//  NHSFEventDetailViewController.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 10/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFEventDetailViewController.h"

@interface NHSFEventDetailViewController ()

@end

@implementation NHSFEventDetailViewController

@synthesize eventNameLabel, eventDateLabel, eventTimeLabel, eventLocationLabel, currentEvent;

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
    
    //Load up the UI
    [self setLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark

-(void)getEvent:(id)eventObject
{
    currentEvent = eventObject;
    
}

//Method for setting label titles
-(void)setLabels
{
    eventNameLabel.text = currentEvent.eventName;
    eventDateLabel.text = currentEvent.eventDate;
    eventTimeLabel.text = currentEvent.eventTime;
    eventLocationLabel.text = currentEvent.eventLocation;
    
}

//This method will create a new MKPlacemark instance for the destination address, configure options for the map to request driving directions and then launch the map. As the map will be launched with a single map item, it will by default provide directions from the user's current location.

-(void)showMap
{
    //Creating an NSDictionary containing the AddressBook keys and values for the postcode
    NSDictionary *postcode = @{(NSString *)kABPersonAddressZIPKey: _postCode.text};
    
    //Creating an MKPlacemark instance using the postcode dictionary and the coordinates from the forward geocoding method.
    MKPlacemark *place = [[MKPlacemark alloc] initWithCoordinate:_coords addressDictionary:postcode];
    
    //A new MKMapItem object is created using the placemark
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
    
    //Now, another NSDictionary is created and configured to request driving directions
    NSDictionary *options = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
    
    //The map is finally launched
    [mapItem openInMapsWithLaunchOptions: options];
}


- (IBAction)getDirections:(id)sender {
    
    //Performing forward geocode translation of the address.
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    //Obtaining the postocde entered by the user (for the address) and storing it in the array postcodeString
    NSString *postcodeString = [NSString stringWithFormat:@"%@", _postCode.text];
    
    [geocoder geocodeAddressString:postcodeString completionHandler:^(NSArray *placemarks, NSError *error){
        
        if(error){
            NSLog(@"Geocode failed with error: %@", error);
            return;
        }
        
        if (placemarks && placemarks.count > 0)
        {
            CLPlacemark *placemark = placemarks[0];
            
            //Obtaining coordinates of the location
            CLLocation *location = placemark.location;
            _coords = location.coordinate;
            
            //If a successful translation takes place then launch the map
            [self showMap];
        }
    }];

}
@end
