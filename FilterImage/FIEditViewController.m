//
//  FIEditViewController.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/12/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FIEditViewController.h"


@interface FIEditViewController ()
{

    GPUImagePicture *sourcePicture;
}
@property (strong, nonatomic) IBOutlet UIButton *f1Button;
@end

@implementation FIEditViewController
@synthesize imageViewFrame;
@synthesize returnImage;
@synthesize filterScrollView;
@synthesize f1Button;
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
    delegate=(FIAppDelegate *)[[UIApplication  sharedApplication] delegate];
    self.imageViewFrame.image=delegate.gbReturnImage;
    
    
    //////////add button for blend effect///////////////
    NSMutableArray *effectArray=[[NSMutableArray alloc] init];
    [effectArray addObject:@"ADD"];
    [effectArray addObject:@"DIVIDE"];
    [effectArray addObject:@"MULTIPLY"];
    [effectArray addObject:@"OVERLAY"];
    [effectArray addObject:@"LIGHTEN"];
    [effectArray addObject:@"DARKEN"];
    [effectArray addObject:@"EXCLUSION"];
    [effectArray addObject:@"DIFFERENCE"];
    [effectArray addObject:@"SUBTRACT"];
    [effectArray addObject:@"HARD LIGHT"];
    [effectArray addObject:@"SOFT LIGHT"];
    [effectArray addObject:@"NORMAL"];
    
    [self createScrollButton:self.filterScrollView withData:effectArray];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////

}

-(void)createScrollButton:(UIScrollView *)scroll withData:(NSArray *)array{

    float x=scroll.frame.origin.x;
    NSString *deviceModel=[UIDevice currentDevice].model;
    CGRect frame=CGRectZero;
    
    for (int i=0; i<[array count]; i++) {
        
        NSString *title=[array objectAtIndex:i];
        //NSLog(@"name--%@",title);
        UIButton *scrollButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [scrollButton setBackgroundImage:[UIImage imageNamed:@"btn_title.png"] forState:UIControlStateNormal];
        [scrollButton.titleLabel setTextColor:[UIColor whiteColor]];
        [scrollButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        //[scrollButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -10, -25.0, 0.0)];
        [scrollButton setTitle:title forState:UIControlStateNormal];
        
        
        if ([deviceModel isEqualToString:@"iPad Simulator"]) {
            
            frame =CGRectMake(x+5, 25,150, 62);
            
        }
        else{
            frame=CGRectMake(x+5, 10, 150, 31);
        
        }
        [scrollButton setFrame:frame];
        
        [scrollButton addTarget:self action:@selector(scrollButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:scrollButton];
        x+=160;
        [scroll setContentSize:CGSizeMake(x, 40)];
    }

}
-(void)scrollButtonPress:(id)sender{

    UIButton *button=(UIButton *)sender;
    NSString *buttonTitle=button.titleLabel.text;
    
    //NSLog(@"image---%@",delegate.gbBlendImage);
    
    if (delegate.gbBlendImage!=nil) {
        
        if ([buttonTitle isEqualToString:@"ADD"]) {
            
            filter = [[GPUImageAddBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"DIVIDE"]) {
            
            filter = [[GPUImageDivideBlendFilter alloc] init];
        }
        if ([buttonTitle isEqualToString:@"MULTIPLY"]) {
            
            filter = [[GPUImageMultiplyBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"OVERLAY"]) {
            
            filter = [[GPUImageOverlayBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"LIGHTEN"]) {
            
            filter = [[GPUImageLightenBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"DARKEN"]) {
            
            filter = [[GPUImageDarkenBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"EXCLUSION"]) {
            
            filter = [[GPUImageExclusionBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"DIFFERENCE"]) {
            
            filter = [[GPUImageExclusionBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"SUBTRACT"]) {
            
            filter = [[GPUImageSubtractBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"HARD LIGHT"]) {
            
            filter = [[GPUImageHardLightBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"SOFT LIGHT"]) {
            
            filter = [[GPUImageSoftLightBlendFilter alloc] init];
            
        }
        if ([buttonTitle isEqualToString:@"NORMAL"]) {
            
            filter = [[GPUImageNormalBlendFilter alloc] init];
            
        }
        GPUImagePicture *source1;
        
        if ([delegate.gbBlendImage  isKindOfClass:[UIImage class]]) {
            
            NSLog(@"good image");
            source1=[[GPUImagePicture alloc] initWithImage:delegate.gbBlendImage];
        }
        else{
            
            NSLog(@"not valid image");
        }
        
        GPUImagePicture *source2=[[GPUImagePicture alloc] initWithImage:delegate.gbReturnImage];
        
        [source1 addTarget:filter];
        [source1 processImage];
        [source2 addTarget:filter];
        [source2 processImage];
        
        shareImage=[filter imageFromCurrentlyProcessedOutputWithOrientation:delegate.gbReturnImage.imageOrientation];
        [self.imageViewFrame setImage:[filter imageFromCurrentlyProcessedOutputWithOrientation:delegate.gbReturnImage.imageOrientation]];
        
    }
    else{
    
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"PhotoFX" message:@"Select one  effect" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
}

///////////*********code for applying blend on image selected *****************//////////


///////////*********end code for appling blend on image selected *****************//////////

/////////****************************image cropper****************************////////////////////////

- (IBAction)cropImage:(id)sender {
    SSPhotoCropperViewController *photoCropper =
    [[SSPhotoCropperViewController alloc] initWithPhoto:delegate.gbReturnImage
                                               delegate:self
                                                 uiMode:SSPCUIModePresentedAsModalViewController
                                        showsInfoButton:YES];
    [photoCropper setMinZoomScale:0.75f];
    [photoCropper setMaxZoomScale:1.50f];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:photoCropper];
    [self presentModalViewController:nc animated:YES];

}
- (IBAction)shareClicked:(id)sender {
    SLComposeViewController *mySLComposerSheet;
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
        {
           mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
           mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //Tell him with what social plattform to use it, e.g. facebook or twitter
            NSString *myStr=@"Testing";
            [mySLComposerSheet setInitialText:[NSString stringWithFormat:myStr,mySLComposerSheet.serviceType]]; //the message you want to post
            [mySLComposerSheet addImage:shareImage]; //an image you could post
            //for more instance methodes, go here:https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/SLComposeViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40012205
            [self presentViewController:mySLComposerSheet animated:YES completion:nil];
        }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
                case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
                case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
                default:
                break;
            } //check if everythink worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
}


#pragma -
#pragma SSPhotoCropperDelegate Methods

- (void) photoCropper:(SSPhotoCropperViewController *)photoCropper
         didCropPhoto:(UIImage *)photo
{
    self.returnImage = photo;
    self.imageViewFrame.image = photo;
    [photoCropper dismissModalViewControllerAnimated:YES];
}

- (void) photoCropperDidCancel:(SSPhotoCropperViewController *)photoCropper
{
    [photoCropper dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/////////****************************image cropper end****************************////////////////////////

- (void)viewDidUnload {
    [self setImageViewFrame:nil];
    [self setFilterScrollView:nil];
    [self setF1Button:nil];
    delegate.gbBlendImage=nil;
    [super viewDidUnload];
}
@end
