//
//  Event.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 10/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize eventID, eventName, eventDate, eventTime, eventLocation;

#pragma mark - Class method

-(id)initWithEventName: (NSString *)eName andEventDate: (NSString *)eDate andEventTime: (NSString *)eTime andEventLocation: (NSString *)eLocation andEventID: (NSString *)eID
{
    self = [super init];
    if (self)
    {
        eventName = eName;
        eventDate = eDate;
        eventTime = eTime;
        eventLocation = eLocation;
        eventID = eID;
    }
    
    return self;
}

@end
