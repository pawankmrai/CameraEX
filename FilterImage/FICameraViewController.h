//
//  FICameraViewController.h
//  FilterImage
//
//  Created by Sandeep Nasa on 10/11/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "FIOverlayView.h"

//transform value for full screen
#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.24299  /////FOR IOS 4.0X

//iphone screen dimention
#define SCREEN_WIDTH 320
#define SCREEN_HEIGTH 480


@interface FICameraViewController : UIViewController<GPUImageVideoCameraDelegate,UIAlertViewDelegate, UIImagePickerControllerDelegate>
{

    GPUImageOutput<GPUImageInput> *filter;
    FIOverlayView *overlay;
}
@property (strong, nonatomic) IBOutlet UIImageView *cameraView;
@end
