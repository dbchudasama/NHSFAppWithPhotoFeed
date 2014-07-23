//
//  DataStore.h
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 23/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WallImage : NSObject
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) id objectId;
@property (nonatomic, strong) NSDictionary<FBGraphUser> *user;
@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSMutableArray *comments;
@end

@interface WallImageComment : NSObject
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSDictionary<FBGraphUser> *user;
@property (nonatomic, strong) NSDate *createdDate;
@end


@interface DataStore : NSObject
@property (nonatomic, strong) NSMutableDictionary *fbFriends;
@property (nonatomic, strong) NSMutableArray *wallImages;
@property (nonatomic, strong) NSMutableDictionary *wallImageMap;

+ (DataStore *) instance;
- (void) reset;
@end
