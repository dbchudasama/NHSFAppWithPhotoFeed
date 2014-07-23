//
//  NHSFATrulySelflessBeingViewController.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 20/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFATrulySelflessBeingViewController.h"

@interface NHSFATrulySelflessBeingViewController ()

@end

@implementation NHSFATrulySelflessBeingViewController

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
    
    //Setting up url that loads for the relevant google drive folder to be displayed. This can then be used to view the google drive folder in a Web View display
    NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/watch?v=aZCmE4esCzI&list=PL9xw-8HRkwNx76bdH0GBgQ5AiJaFqNxId&index=9"];
    
    //Making a URL request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //Loading the URL
    [_webView loadRequest:request];
    
    //Allowing for Zoom in the Web View displaying the Google Drive folder
    [_webView setScalesPageToFit: YES];

    //Fitting content to size of screen
    _webView.contentMode = UIViewContentModeScaleAspectFit;
    _webView.scalesPageToFit = YES;
    
    //Will auto rotate if screen is turned
    _webView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
}

//Controls the rotation from portrait to landscape so that the document turns accordingly to the direction of the screen
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait){
        [_webView stringByEvaluatingJavaScriptFromString:@"rotate(0)"];
    }
    
    else {
        [_webView stringByEvaluatingJavaScriptFromString:@"rotate(1)"];
    }
}

//This method will make sure the document takes up the full screen in both orientations
- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.webView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
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
