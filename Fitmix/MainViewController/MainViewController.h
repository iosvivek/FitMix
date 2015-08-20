//
//  MainViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

//@protocol MainviewController <NSObject>
//-(void)Loginview;
//@end
@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *objscrollview;
    
    IBOutlet UIPageControl *objpagecontrol;
    
    NSMutableArray *Arrimage;
    NSTimer *timer;

    IBOutlet UIButton *signupbtn;
    IBOutlet UIButton *loginbtn;
    IBOutlet UIButton *Skipbtn;
}
//@property(nonatomic,strong) id MaimviewControllerDelegate;

 @end
