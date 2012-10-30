//
//  FIAppDelegate.h
//  FilterImage
//
//  Created by Sandeep Nasa on 10/11/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FIAppDelegate : UIResponder <UIApplicationDelegate>
{

    UIImage *_gbBlendImage;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIImage *gbReturnImage;
@property (strong, nonatomic) UIImage *gbBlendImage;
@end
