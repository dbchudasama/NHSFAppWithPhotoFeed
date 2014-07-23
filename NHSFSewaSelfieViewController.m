//
//  NHSFSewaSelfieViewController.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 19/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFSewaSelfieViewController.h"
#import <Social/Social.h>

@interface NHSFSewaSelfieViewController ()

@end

@implementation NHSFSewaSelfieViewController
@synthesize imageView;
@synthesize textField;
@synthesize imageToShare;

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
    
    //Setting textField Delegate to self
    textField.delegate = self;
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

- (IBAction)cameraPressed:(id)sender {
    
    //Instantiating a UIAlertVIew with the title 'Upload a photo' with options to either 'Take a photo' using camera, or 'Choose Existing' from photo album or 'Dismiss' if not needed
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Upload A Photo" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Take A Photo", @"Choose Existing", nil];
    
    //Setting the style of the alert View. Here set to default
    alert.alertViewStyle = UIAlertViewStyleDefault;
    
    //Finally, show alert
    [alert show];
}

- (IBAction)shareClicked:(id)sender {
    
    //Firstly, getting the text from the text field and storing it in a temporary string variable tempString
    NSString *tempString = [NSString stringWithFormat:@"%@", textField.text];
    
    //If the SLComposeViewController is available, then complete the following action...
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        
        //Contiues the IF statment if a Facebook account has already been set up on the phone or will skip to error in the ELSE statement
        self.slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        //Adding the image to share on Facebook, by using the imageToShare NSData variable and then adding it to the slComposeViewController, which will build the image for us again
        [self.slComposeViewController addImage:[UIImage imageWithData:imageToShare]];
        
        //Option for caption, text
        [self.slComposeViewController setInitialText:tempString];
        
        //Present the view controller with some animation
        [self presentViewController:self.slComposeViewController animated:YES completion:NULL];
    }
    else {
        //If a Facebook account is not set up then an error will appear saying 'Configure a Facebook account in Settings'
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No Facebook account found" message:@"Configure a Facebook account in Settings" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        
        //Default alert view
        alert.alertViewStyle = UIAlertViewStyleDefault;
        
        //Show alert view
        [alert show];
    }
}

//This function will allow us to check which button is pressed (button index)
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1){
        
        //UIImagePickerController called imagePicker. This basically instantiates the UIImagePickerController.
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        
        //Setting the imagePicker delegate to self
        imagePicker.delegate = self;
        
        //Setting imagePicker to use the camera as it's source i.e. this corresponds to the 'Take a photo' button
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        //Get the image taken and present the view controller
        [self presentViewController:imagePicker animated:YES completion:NULL];
    }
    if (buttonIndex == 2){
        
        //Instantiating the image picker
        UIImagePickerController *imagePicker2 = [[UIImagePickerController alloc]init];
        
        //Setting its delegate to self
        imagePicker2.delegate = self;
        
        //Present view controller. NOT setting source as the photo gallery will automatically be accessed and opened
        [self presentViewController:imagePicker2 animated:YES completion:NULL];
        
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //Instantiating the image passed through the imagePicker
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Breaking the image down into JPEG format and storing it as a data into the variable imageToShare
    imageToShare = UIImageJPEGRepresentation(image, 1.0);
    
    //Setting the image in the image view
    [imageView setImage:image];
    
    //Dismissing the view controller i.e. either the photo view or album
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //When the user hits the background of the app, the keyboard will resign
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //When the user hits return, resign keyboard
    if (self.textField){
        [self.textField resignFirstResponder];
    }
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //When user taps on text field the keyboard will appear
    [UIView beginAnimations:nil context:NULL];
    
    //Setting the animation delegate to self
    [UIView setAnimationDelegate:self];
    
    //Setting the animation delegate to 0.2 seconds
    [UIView setAnimationDuration:0.2];
    
    //Setting animation state to true
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    //Setting animation to move upwards (-170.0) and setting rectangle frame
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 170.0), self.view.frame.size.width, self.view.frame.size.height);
    
    //Commit (execute) the animation
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //When user taps on text field the keyboard will appear
    [UIView beginAnimations:nil context:NULL];
    
    //Setting the animation delegate to self
    [UIView setAnimationDelegate:self];
    
    //Setting the animation delegate to 0.2 seconds
    [UIView setAnimationDuration:0.2];
    
    //Setting animation state to true
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    //Setting animation back to normal view (+170.0) and setting rectangle frame
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 170.0), self.view.frame.size.width, self.view.frame.size.height);
    
    //Commit (execute) the animation
    [UIView commitAnimations];
}

@end
