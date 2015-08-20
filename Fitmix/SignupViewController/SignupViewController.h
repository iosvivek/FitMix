//
//  SignupViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "XMLRPCConnection.h"
#import "XMLRPCConnectionDelegate.h"
#import "XMLRPCConnectionManager.h"
#import "XMLRPCRequest.h"
#import "XMLRPCResponse.h"

@protocol SignupViewControllerDelegate
-(void)signupview;
-(void)selectimg;
@end


@interface SignupViewController : UIViewController<XMLRPCConnectionDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{
    
    IBOutlet UIImageView *img_profile;
    
    IBOutlet UITextField *firstname_txt;
    
    IBOutlet UITextField *lastname_txt;
    
    IBOutlet UITextField *email_txt;
    
    IBOutlet UITextField *password_txt;
    
    IBOutlet UITextField *confim_pass_txt;
    
    IBOutlet UITextField *phone_txt;
    
    IBOutlet UITextField *dob_txt;
    
    IBOutlet UITextField *card_name_txt;
    
    IBOutlet UITextField *card_number_txt;
    
    IBOutlet UITextField *cvc_txt;
    IBOutlet UITextField *expiry_month_txt;
    
    IBOutlet UITextField *expiry_year_txt;
    
    IBOutlet UITextField *zip_code_txt;
    
    NSMutableDictionary *dict;
    IBOutlet UIView *containview;
}



- (IBAction)signup_btn:(UIButton *)sender;
- (IBAction)selectimg_btn:(UIButton *)sender;
@property (nonatomic,strong) id SignupViewControllerDelegate;
@end
