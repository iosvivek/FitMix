//
//  LoginViewController.h
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

@protocol LoginViewControllerDelegate
-(void)Myfitmix;
@end

@interface LoginViewController : UIViewController<XMLRPCConnectionDelegate>
{
    
    IBOutlet UITextField *email_txt;
    
    IBOutlet UITextField *password_txt;
}
 @property (nonatomic,strong) id LoginViewControllerDelegate;
@end
