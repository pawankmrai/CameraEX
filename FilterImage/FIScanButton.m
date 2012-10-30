//
//  FIScanButton.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/23/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FIScanButton.h"

@implementation FIScanButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Set button image:
        UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        buttonImage.image = [UIImage imageNamed:@"scanbutton.png"];
        
        [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside]; // for future use
        
        [self addSubview:buttonImage];
    }
    return self;
}

- (void)buttonPressed {
    // TODO: Could toggle a button state and/or image
    NSLog(@"pressed");
}

@end
