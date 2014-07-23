//
//  EventsTableViewController.h
//  NHSFApp
//
//  Created by DivyeshBC on 28/06/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsTableViewController : UITableViewController

//@property (strong, nonatomic) NSMutableArray *eventsMenuOptions;

@property (strong, nonatomic) NSMutableArray *jsonArray;
@property (strong, nonatomic) NSMutableArray *eventsArray;


#pragma mark - Class Method
-(void)retrieveData;

@end
