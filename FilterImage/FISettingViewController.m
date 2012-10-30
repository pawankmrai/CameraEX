//
//  FISettingViewController.m
//  FilterImage
//
//  Created by Sandeep Nasa on 10/22/12.
//  Copyright (c) 2012 Pawan Rai. All rights reserved.
//

#import "FISettingViewController.h"

@interface FISettingViewController ()

@end

@implementation FISettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backClicked:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 426) style:UITableViewStyleGrouped];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [self.view addSubview:myTableView];
}
////////////table view delegate and datasource methods////////////
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        
        return 2;
        
    }
    if (section==1) {
        
        return 2;
        
    }
    else {
        
        return 1;
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    NSString *title=nil;

    if (section==0) {
        
        return title=@"Sharing";
        
    }
    if (section==1) {
        
        return title=@"App Store";
        
    }
    else
        return title=@"About";
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    if ([indexPath section]==0) {
        
        if (indexPath.row==0) {
            
            cell.textLabel.text=@"Facebook";
        }
       if (indexPath.row==1) {
        
            cell.textLabel.text=@"Twitter";
        }
        
    }
    if([indexPath section]==1){

        if(indexPath.row==0){
        
            cell.textLabel.text=@"Like on App Store";
        
        }
        if(indexPath.row==1){
            
            cell.textLabel.text=@"More Apps";          }
            

      }
   if([indexPath section]==2){
       
       if(indexPath.row==0){
       
       
           cell.textLabel.text=@"Help/Support";
       }
       
     }
    
    return cell;
}


////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
