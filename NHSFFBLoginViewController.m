//
//  NHSFFBLoginViewController.m
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 22/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFFBLoginViewController.h"
#import "Comms.h"

@interface NHSFFBLoginViewController () <CommsDelegate>
@property (nonatomic, strong) IBOutlet UIButton *btnLogin;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityLogin;

@end

@implementation NHSFFBLoginViewController

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
    
    
	// Ensure the User is Logged out when loading this View Controller
	// Going forward, we would check the state of the current user and bypass the Login Screen
	// but here, the Login screen is an important part of the tutorial
	[PFUser logOut];
}

// Outlet for FBLogin button
- (IBAction) loginPressed:(id)sender
{
	// Disable the Login button to prevent multiple touches
	[_btnLogin setEnabled:NO];
	
	// Show an activity indicator
	[_activityLogin startAnimating];
	
	// Do the login
	[Comms login:self];
}


- (void) commsDidLogin:(BOOL)loggedIn {
	// Re-enable the Login button
	[_btnLogin setEnabled:YES];
	
	// Stop the activity indicator
	[_activityLogin stopAnimating];
	
	// Did we login successfully ?
	if (loggedIn) {
		// Seque to the Image Wall
		[self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
	} else {
		// Show error alert
		[[[UIAlertView alloc] initWithTitle:@"Login Failed"
									message:@"Facebook Login failed. Please try again"
								   delegate:nil
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];
	}
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
