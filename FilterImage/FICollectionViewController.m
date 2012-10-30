//
//  FICollectionViewController.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/19/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FICollectionViewController.h"
#import "FICustomCell.h"

@interface FICollectionViewController ()

@end

@implementation FICollectionViewController
@synthesize blendImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    blendImage=[[NSMutableArray alloc] init];
    [blendImage addObject:[UIImage imageNamed:@"1.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"2.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"3.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"4.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"5.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"6.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"couple-sunset.jpg"]];
    [blendImage addObject:[UIImage imageNamed:@"border.png"]];
    
    //////delegate set
    delegate=(FIAppDelegate *)[[UIApplication sharedApplication] delegate];
    
}
///////delegate and datasource methods
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [blendImage count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FICustomCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
//    UIImage *image;
//    int row = [indexPath row];
//    
//    image = blendImage[row];
    
    myCell.imageView.image = [blendImage objectAtIndex:indexPath.row];
    
    return myCell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    UIImage *image=[blendImage objectAtIndex:[indexPath row]];
   // NSLog(@"image---%@",(UIImage *)[blendImage objectAtIndex:[indexPath row]]);
    
    if ([image  isKindOfClass:[UIImage class]]) {
        
        delegate.gbBlendImage=(UIImage *)[blendImage objectAtIndex:[indexPath row]];
    }
    else{
    
        NSLog(@"not valid");
    }

    
    delegate.gbBlendImage=(UIImage *)[blendImage objectAtIndex:[indexPath row]];
        
        [self dismissModalViewControllerAnimated:YES];    
    
}
- (IBAction)doneClicked:(id)sender {
    
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
