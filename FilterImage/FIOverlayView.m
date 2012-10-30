//
//  FIOverlayView.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/23/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FIOverlayView.h"
#import "FIScanButton.h"

@implementation FIOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        
        // Load the image to show in the overlay:
        UIImage *overlayGraphic = [UIImage imageNamed:@"overlaygraphic.png"];
        UIImageView *overlayGraphicView = [[UIImageView alloc] initWithImage:overlayGraphic];
        overlayGraphicView.frame = CGRectMake(30, 100, 260, 200);
        [self addSubview:overlayGraphicView];
        
        
        UILabel *scanningLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 320, 200, 30)];
        scanningLabel.backgroundColor = [UIColor clearColor];
        scanningLabel.font = [UIFont fontWithName:@"Courier" size: 18.0];
        scanningLabel.textColor = [UIColor redColor];
        scanningLabel.text = @"Keep close to face";
        
        [self addSubview:scanningLabel];
        
        
//        FIScanButton *scanButton = [[FIScanButton alloc] initWithFrame:CGRectMake(130, 320, 60, 30)];
//        
//        // Add a target action for the button:
//        [scanButton addTarget:self action:@selector(scanButtonTaped) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:scanButton];
        
    }
    return self;
}
-(void)scanButtonTaped{

    UILabel *scanningLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 120, 30)];
    scanningLabel.backgroundColor = [UIColor clearColor];
    scanningLabel.font = [UIFont fontWithName:@"Courier" size: 18.0];
    scanningLabel.textColor = [UIColor redColor];
    scanningLabel.text = @"Scanning...";
    
    [self addSubview:scanningLabel];
    
    [self performSelector:@selector(clearLabel:) withObject:scanningLabel afterDelay:2];
    
}

-(void)clearLabel:(UILabel *)label{

    label.text=@"";
}

@end
