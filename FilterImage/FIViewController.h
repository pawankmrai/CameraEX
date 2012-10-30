//
//  FIViewController.h
//  FilterImage
//
//  Created by Sandeep Nasa on 10/11/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FIAppDelegate.h"
#import "iCarousel.h"

@interface FIViewController : UIViewController<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,iCarouselDataSource,iCarouselDelegate, UIScrollViewDelegate,UIPopoverControllerDelegate>
{

    FIAppDelegate *delegate;
    NSMutableArray *groups;
    ALAssetsLibrary *assetsLibrary;

}
@property (strong, nonatomic) UIPopoverController* popover;

@property (strong, nonatomic) IBOutlet UIImageView *basketTop;
@property (strong, nonatomic) IBOutlet UIImageView *basketBottom;
@property (strong, nonatomic) IBOutlet UIImageView *napkinTop;
@property (strong, nonatomic) IBOutlet UIImageView *napkinBottom;
@property (strong, nonatomic) IBOutlet UIImageView *filterFrameView;
@property (strong, nonatomic) IBOutlet UIScrollView *fiScrollView;
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@end
