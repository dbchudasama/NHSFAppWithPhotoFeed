//
//  NHSFUploadImageViewController.m
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 22/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFUploadImageViewController.h"
#import "UIImage+Scaling.h"

@interface NHSFUploadImageViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate, CommsDelegate>
@property (nonatomic, strong) IBOutlet UILabel *lblChooseAnImage;
@property (nonatomic, strong) IBOutlet UIImageView *imgToUpload;
@property (nonatomic, strong) IBOutlet UIButton *btnPhotoAlbum;
@property (nonatomic, strong) IBOutlet UIButton *btnCamera;
@property (nonatomic, strong) IBOutlet UITextField *txtComment;
@property (nonatomic, strong) IBOutlet UIButton *btnUpload;
@property (nonatomic, strong) IBOutlet UIView *vProgressUpload;
@property (nonatomic, strong) IBOutlet UIProgressView *progressUpload;
@end


@implementation NHSFUploadImageViewController

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
    
    // Check which types of Image Picker Source are available
	// For example, in the simulator, we won't be able to take a new photo with the camera
	[_btnPhotoAlbum setEnabled:[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]];
	[_btnCamera setEnabled:[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]];
    
}


- (IBAction) chooseImageFromPhotoAlbum
{
	UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.navigationController presentModalViewController:imgPicker animated:YES];
}

- (IBAction) createImageWithCamera
{
	UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self.navigationController presentModalViewController:imgPicker animated:YES];
}

- (IBAction) uploadImage
{
	// Disable the Upload button to prevent multiple touches
	[_btnUpload setEnabled:NO];
    
	// Check that we have an image selected
	if (!_imgToUpload.image) {
		[[[UIAlertView alloc] initWithTitle:@"Upload Error"
									message:@"Please choose an image before uploading"
								   delegate:self
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];
		[_btnUpload setEnabled:YES];
		return;
	}
    
	// Check that we have a comment to go with the image
	if (_txtComment.text.length == 0) {
		[[[UIAlertView alloc] initWithTitle:@"Upload Error"
									message:@"Please provide a comment for the image before uploading"
								   delegate:self
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];
		[_btnUpload setEnabled:YES];
		return;
	}
	
	// Show progress
	[_vProgressUpload setHidden:NO];
	
	// Upload the image to Parse
	[Comms uploadImage:self.imgToUpload.image withComment:_txtComment.text forDelegate:self];
}


- (void) commsUploadImageComplete:(BOOL)success
{
	// Reset the UI
	[_vProgressUpload setHidden:YES];
	[_btnUpload setEnabled:YES];
	[_lblChooseAnImage setHidden:NO];
	[_imgToUpload setImage:nil];
	
	// Did the upload work ?
	if (success) {
		[self.navigationController popViewControllerAnimated:YES];
	} else {
		[[[UIAlertView alloc] initWithTitle:@"Upload Error"
									message:@"Error uploading image. Please try again."
								   delegate:nil
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];
	}
}

- (void) commsUploadImageProgress:(short)progress
{
	NSLog(@"Uploaded: %d%%", progress);
	[_progressUpload setProgress:(progress/100.0f)];
}



#pragma mark - UIImagePickerControllerDelegate

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	// We've chosen an image, so hide the hint text.
	[_lblChooseAnImage setHidden:YES];
    
	// Close the image picker
    [picker dismissModalViewControllerAnimated:YES];
	
	// We're going to Scale the Image to fit the image view.
	// This is just to keep traffic size down.
	UIImage *image = (UIImage *)info[UIImagePickerControllerOriginalImage];
	[_imgToUpload setImage:[image imageScaledToFitSize:_imgToUpload.frame.size]];
}


#pragma mark - UITextViewDelegate

// Hide the keyboard when we return from the comment field.
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

@end
