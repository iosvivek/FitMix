//
//  MyFitmixViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "MyFitmixViewController.h"

@interface MyFitmixViewController ()

@end

@implementation MyFitmixViewController
@synthesize MyfitmixViewControllerDelegate;
- (void)viewDidLoad
{
    [super viewDidLoad];
    lbl_total_work.layer.cornerRadius=38;
    lbl_total_work.clipsToBounds=YES;
    lbl_most_work.layer.cornerRadius=38;
    lbl_most_work.clipsToBounds=YES;
     lbl_work_moth.layer.cornerRadius=38;
    lbl_work_moth.clipsToBounds=YES;
    
    
     // Do any additional setup after loading the view from its nib.
}
- (IBAction)scanin_btn:(id)sender
{
    [MyfitmixViewControllerDelegate Checkin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
