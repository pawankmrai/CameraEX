//
//  FICameraViewController.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/11/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FICameraViewController.h"
#import <CoreImage/CoreImage.h>
#import "FIOverlayView.h"

@interface FICameraViewController ()

@end

@implementation FICameraViewController
@synthesize cameraView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
        
     overlay = [[FIOverlayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH - 44)];
    
       
    // Set the image picker source:
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        NSLog(@"No camera!");
        UIAlertView *cameraAlert=[[UIAlertView alloc] initWithTitle:@"PhotoFX" message:@"No Camera" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
        [cameraAlert show];
    }
    else
    {
        // Create a new image picker instance:
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        // Hide the controls:
        picker.showsCameraControls = YES;
        picker.navigationBarHidden = YES;
        
        // Make camera view full screen:
        picker.wantsFullScreenLayout = YES;
        picker.cameraViewTransform = CGAffineTransformScale(picker.cameraViewTransform, CAMERA_TRANSFORM_X, CAMERA_TRANSFORM_Y);
        
        // Insert the overlay:
        picker.cameraOverlayView = overlay;
        
        // Show the picker:
        [self presentModalViewController:picker animated:YES];
    }
    
    
    
    [super viewDidAppear:YES];
}
- (void)imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    NSLog(@"image----%@",image);
    
    
    
    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
    
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSString *title=[alertView  buttonTitleAtIndex:0];
    if ([title isEqualToString:@"Cancel"]) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCameraView:nil];
    [super viewDidUnload];
}
@end
