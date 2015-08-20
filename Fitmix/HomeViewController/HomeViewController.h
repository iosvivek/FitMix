//
//  HomeViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustamCell.h"
 #import "LoginViewController.h"
#import "SignupViewController.h"
#import "MyFitmixViewController.h"
#import "ProfileViewController.h"
#import "LocationViewController.h"
#import "CouponsViewController.h"
#import "CustamCell.h"
 #import "MainViewController.h"
#import "CheckinViewController.h"

@interface HomeViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    NSArray *iconArr;
    NSArray *nameArr;
    
    NSArray *iconArr2;
    NSArray *nameArr2;
    
    IBOutlet UIView *saidview;

    IBOutlet UILabel *Title_lbl;
    IBOutlet UIView *containerView;
    IBOutlet UIView *homecontainerview;
    IBOutlet UIButton *login_btn;
    
    IBOutlet UIButton *subscribe_btn;
    int curantstetas;
    IBOutlet UITableView *menu_tebal;
   
      //MainViewController *objmain;
 }
@property(nonatomic,strong)NSString *str;

 @end
