//
//  NHSFEventDetailViewController.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 10/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

@interface NHSFEventDetailViewController : UIViewController
@property CLLocationCoordinate2D coords;

@property (strong, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *eventLocationLabel;
@property (strong, nonatomic) IBOutlet UITextField *postCode;


- (IBAction)getDirections:(id)sender;


@property (strong, nonatomic) Event *currentEvent;

#pragma mark Methods

-(void)getEvent:(id)eventObject;
-(void)setLabels;

@end
