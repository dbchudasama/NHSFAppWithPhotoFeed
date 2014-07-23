//
//  NSOperationQueue+SharedQueue.m
//  FBParse
//
//  Created by Divyesh B Chudasama on 23/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NSOperationQueue+SharedQueue.h"

@implementation NSOperationQueue (SharedQueue)

+ (NSOperationQueue *) pffileOperationQueue {
	static NSOperationQueue *pffileQueue = nil;
	if (pffileQueue == nil) {
		pffileQueue = [[NSOperationQueue alloc] init];
		[pffileQueue setName:@"com.divyeshbc.pffilequeue"];
	}
	return pffileQueue;
}

+ (NSOperationQueue *) profilePictureOperationQueue {
	static NSOperationQueue *profilePictureQueue = nil;
	if (profilePictureQueue == nil) {
		profilePictureQueue = [[NSOperationQueue alloc] init];
		[profilePictureQueue setName:@"com.divyeshbc.profilepicturequeue"];
	}
	return profilePictureQueue;
}

@end
