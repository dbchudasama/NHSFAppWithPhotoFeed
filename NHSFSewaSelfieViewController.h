//
//  NHSFSewaSelfieViewController.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 19/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface NHSFSewaSelfieViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cameraPressed:(id)sender;
- (IBAction)shareClicked:(id)sender;


//To be used when user hits share button
@property (strong, nonatomic) SLComposeViewController *slComposeViewController;

//Property to be used to load data across the two environments, i.e. from the app the Facebook
@property (strong, nonatomic) NSData *imageToShare;


@end
