//
//  CheckinViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "CheckinViewController.h"

@interface CheckinViewController ()

@end

@implementation CheckinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *URL = [NSURL URLWithString: @"http://stellarbee.com/fitmix/index.php/xmlrpc_server"];
        XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    
    
        NSArray *arrREF=[NSArray arrayWithObjects:@"789",@"321",nil];
    
        XMLRPCConnectionManager *manager = [XMLRPCConnectionManager sharedManager];
    
        [request setMethod:@"qrcode" withParameter:arrREF];
        NSLog(@"Request body: %@", [request body]);
        [manager spawnConnectionWithXMLRPCRequest:request delegate:self];
    
        XMLRPCResponse * viewsResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:request error:nil];
        NSMutableArray * viewArray = [viewsResponse object];
        NSLog( @"\nDATA: \n%@\n", viewArray );
    
    
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
