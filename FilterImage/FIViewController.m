//
//  FIViewController.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/11/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FIViewController.h"
#import "FIEditViewController.h"
#import "FXImageView.h"

@interface FIViewController ()

@end

@implementation FIViewController
@synthesize basketTop;
@synthesize basketBottom;
@synthesize napkinTop;
@synthesize napkinBottom;
@synthesize filterFrameView;
@synthesize fiScrollView;
@synthesize carousel;
@synthesize segmentControl;
@synthesize popover;
///*************************************  carousel effect  ******************************************************************////

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
   // NSLog(@"groups")
    return [groups count];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    NSString *deviceModel=[UIDevice currentDevice].model;
    
    CGRect frame=CGRectZero;
    
    
    if (view == nil)
    {
        
        if ([deviceModel isEqualToString:@"iPad Simulator"]) {
            
            frame=CGRectMake(0, 0, 450.0f, 450.0f);
            
        }
        else{
        
            frame=CGRectMake(0, 0, 250.0f, 250.0f);
        }
            
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:frame] ;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        view = imageView;
    }
    
//    if (view==nil) {
//        
//        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250.0f, 250.0f)];
//        
//        view=imageView;
//    }
//    ((UIImageView *)view).image=(UIImage *)[groups objectAtIndex:index];

    
    ALAsset *asset = [groups objectAtIndex:index];
    
    //((FXImageView *)view).image=[UIImage imageWithCGImage:[asset thumbnail]];
    
    //show placeholder
    ((FXImageView *)view).image = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
   
    //[(FXImageView *)view setImageWithContentsOfURL:url];
//    if (index==[groups count]-1) {
//        [self getImagesFromAlbum];
//    }
    
    return view;
}
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    NSString *deviceModel=[UIDevice currentDevice].model;
    
    if ([deviceModel isEqualToString:@"iPad Simulator"]) {
        
        return 470.0f;
        
    }
    else{
        
        return 250.0f;
    }
    
}
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 0;
}
- (void)carousel:(iCarousel *)carousel1 didSelectItemAtIndex:(NSInteger)index{

   // NSLog(@"image---%@",(UIImage *)[groups objectAtIndex:index]);
   
    
    if (index==carousel1.currentItemIndex) {
        
       // NSLog(@"i am selected");
        
        ALAsset *asset = [groups objectAtIndex:index];
        delegate.gbReturnImage=[UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
        [self performSegueWithIdentifier:@"filterEditor" sender:carousel];
    }
}

///************************************* end carousel effect  ******************************************************************////

- (void)viewDidLoad
{
    [super viewDidLoad];

    carousel.type=iCarouselTypeCoverFlow2;
    carousel.centerItemWhenSelected=YES;
    
	// Do any additional setup after loading the view, typically from a nib.
    ////set delegate here
    delegate=(FIAppDelegate *)[[UIApplication  sharedApplication] delegate];
    
    ///animate the basket
    CGRect basketTopFrame = basketTop.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = basketBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0f];
    [UIView setAnimationDelay:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    basketTop.frame = basketTopFrame;
    basketBottom.frame = basketBottomFrame;
    
    ////animatate background
    CGRect napkinTopFrame = napkinTop.frame;
    napkinTopFrame.origin.y = -napkinTopFrame.size.height;
    CGRect napkinBottomFrame = napkinBottom.frame;
    napkinBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.7
                          delay:1.0f
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         napkinTop.frame = napkinTopFrame;
                         napkinBottom.frame = napkinBottomFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                     }];
    
    [UIView commitAnimations];
        
    ///////call for assets library ////////////////
    [self getImagesFromAlbum];  
    
}
-(void)getImagesFromAlbum{

    
    ///assest library code
    if (!assetsLibrary) {
        assetsLibrary = [[ALAssetsLibrary alloc] init];
    }
    if (!groups) {
        groups = [[NSMutableArray alloc] init];
    }
    else {
        [groups removeAllObjects];
    }
   // NSString *photoURL=nil;
    
    /// enumeration
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
                                 usingBlock:^(ALAssetsGroup *group, BOOL *stop)
     {
         
         [group enumerateAssetsUsingBlock:^(ALAsset *assest, NSUInteger index, BOOL *stop)
          {
              
              if (assest) {
                  
                  //UIImage *image=[UIImage imageWithCGImage:[assest thumbnail]];
                  //UIImage *image=[UIImage imageWithCGImage:[[assest defaultRepresentation] fullResolutionImage]];
                  [groups addObject:assest];
                 // NSLog(@"loading");
              }
          }
          
          ];
         
         [self.carousel reloadData];
     }
     
    failureBlock:^(NSError *error)
     {
         //NSLog(@"Error---%@",[error description]);
         NSString *errorMessage = nil;
         switch ([error code]) {
             case ALAssetsLibraryAccessUserDeniedError:
             case ALAssetsLibraryAccessGloballyDeniedError:
                 errorMessage = @"The user has declined access to it.";
                 break;
             default:
                 errorMessage = @"Reason unknown.";
                 break;
         }
         UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error"
                                                       message:errorMessage
                                                      delegate:self
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil, nil];
         [alert show];
         
     }
     ];

}

- (IBAction)filterStillImage:(id)sender {
    
    if([sender tag]==1){
    
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            
            NSLog(@"No camera!");
            UIAlertView *cameraAlert=[[UIAlertView alloc] initWithTitle:@"Filter Image" message:@"No Camera" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [cameraAlert show];
        }
        else
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            //picker.allowsImageEditing = YES;
            picker.sourceType = (sender) ? UIImagePickerControllerSourceTypeCamera :
            UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [self presentModalViewController: picker animated:YES];
        }
    }
    else {
    
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController *picker= [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentModalViewController:picker animated:YES];
        }
    
    }
}

- (void) imagePickerController: (UIImagePickerController*) picker
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    UIImage *inputImage=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    
    delegate.gbReturnImage=inputImage;
    
    [picker dismissModalViewControllerAnimated:YES];
    
    
    [self performSegueWithIdentifier:@"filterEditor" sender:picker];

}
- (IBAction)segmentControlChange:(id)sender {
    
    if ([sender selectedSegmentIndex]==0) {
        
        [self performSegueWithIdentifier:@"liveCamera" sender:sender];
    }
    else if ([sender selectedSegmentIndex]==2){
    
        if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            
            NSLog(@"No library!");
            UIAlertView *libAlert=[[UIAlertView alloc] initWithTitle:@"Filter Image" message:@"No Library" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [libAlert show];
        }
        else{
            
            UIImagePickerController *picker= [[UIImagePickerController alloc]init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            
            NSString *deviceModel=[UIDevice currentDevice].model;
            if ([deviceModel isEqualToString:@"iPad Simulator"]) {
                          
                CGPoint touchPoint=[sender locationInView:sender];
    
                popover = [[UIPopoverController alloc] initWithContentViewController: picker];
                popover.delegate = self;
                [popover presentPopoverFromRect:CGRectMake(touchPoint.x, touchPoint.y, 1, 1) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
                
            }
            else{
            
                [self presentModalViewController:picker animated:YES];
            
            }
            
        }
    
    }
    
}
- (IBAction)filterLiveImage:(id)sender {
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBasketTop:nil];
    [self setBasketBottom:nil];
    [self setNapkinTop:nil];
    [self setNapkinBottom:nil];
    [self setFilterFrameView:nil];
    [self setFiScrollView:nil];
    [self setCarousel:nil];
    [self setSegmentControl:nil];
    [super viewDidUnload];
}
@end
