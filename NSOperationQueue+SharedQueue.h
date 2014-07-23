//
//  NSOperationQueue+SharedQueue.h
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 23/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (SharedQueue)

+ (NSOperationQueue *) pffileOperationQueue;
+ (NSOperationQueue *) profilePictureOperationQueue;

@end
