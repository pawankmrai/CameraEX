//
//  FIEditViewController.h
//  FilterImage
//
//  Created by Sandeep Nasa on 10/12/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FIAppDelegate.h"
#import "SSPhotoCropperViewController.h"
#import "GPUImage.h"
#import <Social/Social.h>
typedef enum {

    GPUIMAGE_ADD,
    GPUIMAGE_DIVIDE,
    GPUIMAGE_MULTIPLY,
    GPUIMAGE_OVERLAY,
    GPUIMAGE_LIGHTEN,
    GPUIMAGE_DARKEN,
    GPUIMAGE_COLORBURN,
    GPUIMAGE_COLORDODGE,
    GPUIMAGE_SCREENBLEND,
    GPUIMAGE_DIFFERENCEBLEND,
	GPUIMAGE_SUBTRACTBLEND,
    GPUIMAGE_EXCLUSIONBLEND,
    GPUIMAGE_HARDLIGHTBLEND,
    GPUIMAGE_SOFTLIGHTBLEND,
    GPUIMAGE_NORMALBLEND,

}GPUImageShowcaseFilterType;

@interface FIEditViewController : UIViewController<SSPhotoCropperDelegate>
{
   
    GPUImageShowcaseFilterType filterType;
    GPUImageOutput<GPUImageInput> *filter;
    UIImage *returnImage;
    FIAppDelegate *delegate;
    UIImage *inputImage;
    UIImage *shareImage;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *imageViewFrame;
@property (strong, nonatomic) UIImage *returnImage;
@property (strong, nonatomic) IBOutlet UIScrollView *filterScrollView;
@end
