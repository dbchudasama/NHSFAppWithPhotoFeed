//
//  NHSFChapterDataViewController.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 07/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHSFChapterObject.h"

@interface NHSFChapterDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NHSFChapterObject *chapterObject;

@end
