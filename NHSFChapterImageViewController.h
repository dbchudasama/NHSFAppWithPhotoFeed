//
//  NHSFChapterImageViewController.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHSFChapterObject.h"

@interface NHSFChapterImageViewController : UIViewController <UIScrollViewDelegate>//This will tell the NHSFChapterImageViewController to adopt the protocol and give access to all the UIScrollViewDelegate methods predefined by apple for the delegate. Once the methods are called we can then add our own funtionality

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

//Make a property of type UIView because it is a fundamental part of the View Controller
@property (strong, nonatomic) UIImageView *imageView;

//Creating a property of the chapterObject to be able to access the information inside the view controller it is being passed 
@property (strong, nonatomic) NHSFChapterObject *chapterObject;

@end
