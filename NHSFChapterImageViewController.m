//
//  NHSFChapterImageViewController.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFChapterImageViewController.h"

@interface NHSFChapterImageViewController ()

@end

@implementation NHSFChapterImageViewController

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
    
    //Initialising the view controller
    self.imageView = [[UIImageView alloc] initWithImage:self.chapterObject.chapterImage];
    
    //Setting the content size of the scrollView to be the content size of the imageView i.e. the image
    self.scrollView.contentSize = self.imageView.frame.size;
    
    //The imageView now needs to be set up on the top of the scrollView. This will allow me to create a subview of the scrollView
    [self.scrollView addSubview:self.imageView];
    
    //Setting the view controller as the UIScrollView delegate hence upon pinching the viewForZoomingInScrolView method can be called
    self.scrollView.delegate = self;
    
    //Declaring maximum zoom scale
    self.scrollView.maximumZoomScale = 2.0;
    
    //Declaring minimum zoom scale
    self.scrollView.minimumZoomScale = 0.5;
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

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView; //This method requires a return type of UIView so just returning the imageVIew for the image. This will enable zoom in and out of the image in scroll view
}

//This method will make sure the document takes up the full screen in both orientations
- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.scrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

@end
