//
//  FICollectionViewController.h
//  FilterImage
//
//  Created by Sandeep Nasa on 10/19/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FIAppDelegate.h"

@interface FICollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
 
    FIAppDelegate *delegate;
}
@property (strong, nonatomic) NSMutableArray *blendImage;
@end
