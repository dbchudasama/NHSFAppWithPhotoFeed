//
//  Event.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 10/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString *eventName;
@property (strong, nonatomic) NSString *eventID;
@property (strong, nonatomic) NSString *eventDate;
@property (strong, nonatomic) NSString *eventTime;
@property (strong, nonatomic) NSString *eventLocation;

#pragma mark - Class method
-(id)initWithEventName: (NSString *)eName andEventDate: (NSString *)eDate andEventTime: (NSString *)eTime andEventLocation: (NSString *)eLocation andEventID: (NSString *)eID;

@end
