//
//  LoginViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize LoginViewControllerDelegate;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)Login_btn:(id)sender
{
    [LoginViewControllerDelegate Myfitmix];
//    NSURL *URL = [NSURL URLWithString: @"http://stellarbee.com/fitmix/index.php/xmlrpc_server"];
//    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    
   // NSArray *arrREF=[NSArray arrayWithObjects:email_txt.text,password_txt.text,nil];
   
    
//    NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:@"photo.png"]);
//    NSString *imageString = [imageData base64EncodedStringWithOptions:0];
//    NSLog(@"%@", imageString);
//    NSURL *URL = [NSURL URLWithString: @"http://stellarbee.com/fitmix/index.php/xmlrpc_server"];
//    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
//    NSArray *arrREF=[NSArray arrayWithObjects:@"160",imageString,nil];
//    
//    
//    [request setMethod:@"upload" withParameter:arrREF];
//    NSLog(@"Request body: \n\n %@", [request body]);
//    //[request release];
//    XMLRPCResponse *responce=[XMLRPCConnection sendSynchronousXMLRPCRequest:request error:nil];
//    NSLog(@"\n\n\nResponce of UPLOAD :- \n\n%@",[responce body]);
}

- (void)request:(XMLRPCRequest *)request didReceiveResponse: (XMLRPCResponse *)response
{
    if ([response isFault])
    {
        NSLog(@"Fault code: %@", [response faultCode]);
        
        NSLog(@"Fault string: %@", [response faultString]);
    }
    else
    {
        NSLog(@"Parsed response: %@", [response object]);
    }
    
    NSLog(@"Response body: %@", [response body]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
@end
