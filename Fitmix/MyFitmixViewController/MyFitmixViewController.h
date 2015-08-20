//
//  MyFitmixViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckinViewController.h"
@protocol MyfitmixViewControllerDelegate
-(void)Checkin;
@end

 @interface MyFitmixViewController : UIViewController
{
    
   
    IBOutlet UILabel *lbl_total_work;
    IBOutlet UILabel *lbl_work_moth;
    IBOutlet UILabel *lbl_most_work;
    
    
}

@property (nonatomic,strong) id MyfitmixViewControllerDelegate;

 @end
