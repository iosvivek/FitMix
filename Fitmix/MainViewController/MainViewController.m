//
//  MainViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()
{
    HomeViewController *objhome;

}
@end

@implementation MainViewController
//@synthesize MaimviewControllerDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Arrimage = [[NSMutableArray alloc] initWithObjects:@"Slider_1.jpg", @"Slider_2.jpg", @"Slider_3.jpg",nil];
    [self ScrollImage];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -Scroll Image With Timer

- (void)ScrollImage
{
    
    objscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
   
    objscrollview.bounces=NO;
    [self.view addSubview:objscrollview];
    
    for (int i = 0; i <Arrimage.count; i++)
    {
        CGRect frame;
        frame.origin.x = objscrollview.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = objscrollview.frame.size;

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[Arrimage objectAtIndex:i]];
        
        [UIImageView beginAnimations:nil context:NULL];
        [UIImageView setAnimationDuration:.5];
         [objscrollview addSubview:imageView];
 
    }
   
        timer = [NSTimer scheduledTimerWithTimeInterval: 3 target: self selector: @selector(handleTimer) userInfo: nil repeats: YES];    
   // [self.view bringSubviewToFront:objscrollview];
    [self.view addSubview:signupbtn];
    [self.view addSubview:loginbtn];
    [self.view addSubview:Skipbtn];
    [self.view addSubview:objpagecontrol];

 }
- (void)handleTimer
{
   //[self.view addSubview:objpagecontrol];

    int page = objscrollview.contentOffset.x / 320;
   
    if ( page + 1 < [Arrimage count] )
    {
        page++;
        objpagecontrol.currentPage = page++;
    }
    else
    {
        page = 0;
        objpagecontrol.currentPage = page;
        
        
    }
        long lpage = objpagecontrol.currentPage;
    objscrollview.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
    [objscrollview setContentOffset:CGPointMake(320 * lpage, 0)];
}
- (IBAction)btnGeneralPressed:(UIButton *)sender
{
     if (sender.tag==1)
    {
        //Signup
        [self HomeView];
         objhome.str=@"Signup";
        
    }
    else if(sender.tag==2)
    {
        //Login
        [self HomeView];
        
        objhome.str=@"Login";
    }
    else if(sender.tag==3)
    {
        //Skip
        [self HomeView];
        objhome.str=@"Skip";
    }
    
}
-(void)HomeView
{
    objhome=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:objhome animated:YES];

}

 - (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = objscrollview.frame.size.width;
    int page = floor((objscrollview.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    objpagecontrol.currentPage = page;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
