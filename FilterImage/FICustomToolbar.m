//
//  FICustomToolbar.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/25/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FICustomToolbar.h"

@implementation FICustomToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithTitle:@"Camera" style:UIBarButtonItemStylePlain target:self  action:nil];
        UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithTitle:@"Photo Edit" style:UIBarButtonItemStylePlain target:self  action:nil];
        UIBarButtonItem *item3=[[UIBarButtonItem alloc] initWithTitle:@"Album" style:UIBarButtonItemStylePlain target:self  action:nil];
        [self setItems:[NSArray arrayWithObjects:item1,item2,item3, nil] animated:YES];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
