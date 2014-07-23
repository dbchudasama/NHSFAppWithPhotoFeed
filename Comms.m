//
//  Comms.m
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 22/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "Comms.h"
#import "NSOperationQueue+SharedQueue.h"
#import "NHSFAppDelegate.h"

NSString * const N_ImageDownloaded = @"N_ImageDownloaded";
NSString * const N_ProfilePictureLoaded = @"N_ProfilePictureLoaded";
NSString * const N_CommentUploaded = @"N_CommentUploaded";
NSString * const N_ImageUploaded = @"N_ImageUploaded";


@implementation Comms

+ (void) login:(id<CommsDelegate>)delegate
{
	// Basic User information and your friends are part of the standard permissions
	// so there is no reason to ask for additional permissions
	[PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
		// Was login successful ?
		if (!user) {
			if (!error) {
				NSLog(@"The user cancelled the Facebook login.");
			} else {
				NSLog(@"An error occurred: %@", error.localizedDescription);
			}
			
			// Callback - login failed
			if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
				[delegate commsDidLogin:NO];
			}
		} else {
			if (user.isNew) {
				NSLog(@"User signed up and logged in through Facebook!");
			} else {
				NSLog(@"User logged in through Facebook!");
			}
			
			[FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
				if (!error) {
					NSDictionary<FBGraphUser> *me = (NSDictionary<FBGraphUser> *)result;
					// Store the Facebook Id
					[[PFUser currentUser] setObject:me.objectID forKey:@"fbId"];
					[[PFUser currentUser] saveInBackground];
					
					// Launch another thread to handle the download of the user's Facebook profile picture
					[[NSOperationQueue profilePictureOperationQueue] addOperationWithBlock:^ {
						// Build a profile picture URL from the user's Facebook user id
						NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", me.objectID];
						NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
						UIImage *profilePicture = [UIImage imageWithData:profilePictureData];
						
						// Set the profile picture into the user object
						if (profilePicture) [me setObject:profilePicture forKey:@"fbProfilePicture"];
						
						// Notify that the profile picture has been downloaded, using NSNotificationCenter
						[[NSNotificationCenter defaultCenter] postNotificationName:N_ProfilePictureLoaded object:nil];
					}];
					
					// Add the User to the list of friends in the DataStore
					[[DataStore instance].fbFriends setObject:me forKey:me.objectID];
				}
				
				// 1
				FBRequest *friendsRequest = [FBRequest requestForMyFriends];
				[friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
															  NSDictionary* result,
															  NSError *error) {
					// 2
					NSArray *friends = result[@"data"];
					for (NSDictionary<FBGraphUser>* friend in friends) {
						NSLog(@"Found a friend: %@", friend.name);
						
						// Launch another thread to handle the download of the friend's Facebook profile picture
						[[NSOperationQueue profilePictureOperationQueue] addOperationWithBlock:^ {
							// Build a profile picture URL from the friend's Facebook user id
							NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", friend.objectID];
							NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
							UIImage *profilePicture = [UIImage imageWithData:profilePictureData];
							
							// Set the profile picture into the user object
							if (profilePicture) [friend setObject:profilePicture forKey:@"fbProfilePicture"];
							
							// Notify that the profile picture has been downloaded, using NSNotificationCenter
							[[NSNotificationCenter defaultCenter] postNotificationName:N_ProfilePictureLoaded object:nil];
						}];
						
						// 3
						// Add the friend to the list of friends in the DataStore
						[[DataStore instance].fbFriends setObject:friend forKey:friend.objectID];
					}
					
					// 4
					// Callback - login successful
					if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
						[delegate commsDidLogin:YES];
					}
				}];
			}];
		}
	}];
}


+ (void) uploadImage:(UIImage *)image withComment:(NSString *)comment forDelegate:(id<CommsDelegate>)delegate
{
    // 1
    NSData *imageData = UIImagePNGRepresentation(image);
	
    // 2
    PFFile *imageFile = [PFFile fileWithName:@"img" data:imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
			// 3
            PFObject *wallImageObject = [PFObject objectWithClassName:@"WallImage"];
            wallImageObject[@"image"] = imageFile;
            wallImageObject[@"userFBId"] = [[PFUser currentUser] objectForKey:@"fbId"];
            wallImageObject[@"user"] = [PFUser currentUser].username;
			
            [wallImageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
					// 4
					PFObject *wallImageCommentObject = [PFObject objectWithClassName:@"WallImageComment"];
					wallImageCommentObject[@"comment"] = comment;
					wallImageCommentObject[@"userFBId"] = [[PFUser currentUser] objectForKey:@"fbId"];
					wallImageCommentObject[@"user"] = [PFUser currentUser].username;
					wallImageCommentObject[@"imageObjectId"] = wallImageObject.objectId;
					
					[wallImageCommentObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
						// 5
						if ([delegate respondsToSelector:@selector(commsUploadImageComplete:)]) {
							[delegate commsUploadImageComplete:YES];
						}
					}];
                } else {
					// 6
					if ([delegate respondsToSelector:@selector(commsUploadImageComplete:)]) {
						[delegate commsUploadImageComplete:NO];
					}
                }
            }];
        } else {
			// 7
			if ([delegate respondsToSelector:@selector(commsUploadImageComplete:)]) {
				[delegate commsUploadImageComplete:NO];
			}
        }
    } progressBlock:^(int percentDone) {
		// 8
		if ([delegate respondsToSelector:@selector(commsUploadImageProgress:)]) {
			[delegate commsUploadImageProgress:percentDone];
		}
    }];
}


+ (void) getWallImagesSince:(NSDate *)lastUpdate forDelegate:(id<CommsDelegate>)delegate
{
	// 1
	// Get the complete list of friend ids
	NSArray *meAndMyFriends = [DataStore instance].fbFriends.allKeys;
	
	// 2
	// Create a PFQuery, Parse Query object
	PFQuery *imageQuery = [PFQuery queryWithClassName:@"WallImage"];
	[imageQuery orderByAscending:@"createdAt"];
	[imageQuery whereKey:@"updatedAt" greaterThan:lastUpdate];
	[imageQuery whereKey:@"userFBId" containedIn:meAndMyFriends];
	[imageQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		// 3
		__block NSDate *newLastUpdate = lastUpdate;
		
		if (error) {
			NSLog(@"Objects error: %@", error.localizedDescription);
		} else {
			// 4
			// Go through the returned PFObjects
			[objects enumerateObjectsUsingBlock:^(PFObject *wallImageObject, NSUInteger idx, BOOL *stop) {
				// 5
				// Get the Facebook User Id of the user that uploaded the image
				NSDictionary<FBGraphUser> *user = [[DataStore instance].fbFriends objectForKey:wallImageObject[@"userFBId"]];
				
				// 6
				// Construct a WallImage object
				WallImage *wallImage = [[WallImage alloc] init];
				wallImage.objectId = wallImageObject.objectId;
				wallImage.user = user;
				wallImage.createdDate = wallImageObject.updatedAt;
				
				[[NSOperationQueue pffileOperationQueue] addOperationWithBlock:^ {
					wallImage.image = [UIImage imageWithData:[(PFFile *)wallImageObject[@"image"] getData]];
					
					// Notify - Image Downloaded from Parse
					[[NSNotificationCenter defaultCenter] postNotificationName:N_ImageDownloaded object:nil];
				}];
				
				// 7
				// Update the last update timestamp with the most recent update
				if ([wallImageObject.updatedAt compare:newLastUpdate] == NSOrderedDescending) {
					newLastUpdate = wallImageObject.updatedAt;
				}
				
				// 8
				// Store the WallImage object in the DataStore collections
				[[DataStore instance].wallImages insertObject:wallImage atIndex:0];
				[[DataStore instance].wallImageMap setObject:wallImage forKey:wallImage.objectId];
			}];
		}
		
		// Callback
		if ([delegate respondsToSelector:@selector(commsDidGetNewWallImages:)]) {
			[delegate commsDidGetNewWallImages:newLastUpdate];
		}
	}];
}


+ (void) getWallImageCommentsSince:(NSDate *)lastUpdate forDelegate:(id<CommsDelegate>)delegate
{
	// Get all the Wall Image object Ids
	NSArray *wallImageObjectIds = [DataStore instance].wallImageMap.allKeys;
	
	// Execute the PFQuery to get the Wall Image Comments for all the Wall Images
	PFQuery *commentQuery = [PFQuery queryWithClassName:@"WallImageComment"];
	[commentQuery orderByAscending:@"createdAt"];
	[commentQuery whereKey:@"updatedAt" greaterThan:lastUpdate];
	[commentQuery whereKey:@"imageObjectId" containedIn:wallImageObjectIds];
	[commentQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		// In the callback, we will return the latest update timestamp with this request.
		// Default to the current last update.
		__block NSDate *newLastUpdate = lastUpdate;
		
		if (error) {
			NSLog(@"Objects error: %@", error.localizedDescription);
		} else {
			[objects enumerateObjectsUsingBlock:^(PFObject *wallImageCommentObject, NSUInteger idx, BOOL *stop) {
				// Look up the User's Facebook Graph User
				NSDictionary<FBGraphUser> *user = [[DataStore instance].fbFriends objectForKey:wallImageCommentObject[@"userFBId"]];
				
				// 1
				// Look up the Wall Image
				WallImage *wallImage = [[DataStore instance].wallImageMap objectForKey:wallImageCommentObject[@"imageObjectId"]];
				
				// Add the Comment to the Wall Image
				if (wallImage) {
					WallImageComment *wallImageComment = [[WallImageComment alloc] init];
					wallImageComment.user = user;
					wallImageComment.createdDate = wallImageCommentObject.updatedAt;
					wallImageComment.comment = wallImageCommentObject[@"comment"];
					if ([wallImageCommentObject.updatedAt compare:newLastUpdate] == NSOrderedDescending) {
						newLastUpdate = wallImageCommentObject.updatedAt;
					}
					
					//2
					[wallImage.comments addObject:wallImageComment];
				}
			}];
		}
		
		// Callback
		if ([delegate respondsToSelector:@selector(commsDidGetNewWallImageComments:)]) {
			[delegate commsDidGetNewWallImageComments:newLastUpdate];
		}
	}];
}


+ (void) addComment:(NSString *)comment toWallImage:(WallImage *)wallImage
{
	// Save the new Comment to the Wall Image
	PFObject *wallImageCommentObject = [PFObject objectWithClassName:@"WallImageComment"];
	wallImageCommentObject[@"comment"] = comment;
	wallImageCommentObject[@"userFBId"] = [[PFUser currentUser] objectForKey:@"fbId"];
	wallImageCommentObject[@"user"] = [PFUser currentUser].username;
	
	// Set the object id for the associated WallImage
	wallImageCommentObject[@"imageObjectId"] = wallImage.objectId;
	
	// Save the comment to Parse
	[wallImageCommentObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		// Notify that the Comment has been uploaded, using NSNotificationCenter
		[[NSNotificationCenter defaultCenter] postNotificationName:N_CommentUploaded object:nil];
	}];
}




+ (void) shareImage:(UIImage *)image
{
	// For the purposes of this project, we will use the iOS 6 integrated share dialog only.
	if (![FBDialogs canPresentOSIntegratedShareDialogWithSession:[FBSession activeSession]]) {
		NSLog(@"Facebook sharing requires a Facebook account be registered in the iPhone Settings.");
		return;
	}
	
	// Get the AppDelegate, so that we can get the root controller for the FBDialog
	NHSFAppDelegate *mainDelegate = (NHSFAppDelegate*)[[UIApplication sharedApplication] delegate];
	[FBDialogs presentOSIntegratedShareDialogModallyFrom:mainDelegate.window.rootViewController
											 initialText:@""
												   image:image
													 url:nil
												 handler:nil];
}

@end
