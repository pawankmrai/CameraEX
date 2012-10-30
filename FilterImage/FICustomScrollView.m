//
//  FICustomScrollView.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/16/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FICustomScrollView.h"

@implementation FICustomScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint parentLocation = [self convertPoint:point toView:self.superview];
    CGRect responseRect = self.frame;
    responseRect.origin.x -= self.responseInsets.left;
    responseRect.origin.y -= self.responseInsets.top;
    responseRect.size.width += (self.responseInsets.left + self.responseInsets.right);
    responseRect.size.height += (self.responseInsets.top + self.responseInsets.bottom);
    return CGRectContainsPoint(responseRect, parentLocation);
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    CGPoint parentLocation = [self convertPoint:point toView:self.superview];
//    return [self.superview pointInside:parentLocation withEvent:event];
//}


@end
