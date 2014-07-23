//
//  UIImage+Scaling.h
//  NHSF (UK)
//
//  Created by Divyesh B Chudasama on 22/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scaling)

- (UIImage *) imageScaledToSize:(CGSize)size;
- (UIImage *) imageScaledToFitSize:(CGSize)size;

@end
