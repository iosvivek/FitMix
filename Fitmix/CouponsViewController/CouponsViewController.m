//
//  CouponsViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "CouponsViewController.h"

@interface CouponsViewController ()

@end

@implementation CouponsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *URL = [NSURL URLWithString: @"http://stellarbee.com/fitmix/index.php/xmlrpc_server"];
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    
    //NSArray *arrREF=[NSArray arrayWithObjects:email_txt.text,password_txt.text,nil];
    
    XMLRPCConnectionManager *manager = [XMLRPCConnectionManager sharedManager];
    
    [request setMethod:@"coupon" withParameter:nil];
    NSLog(@"Request body: %@", [request body]);
    [manager spawnConnectionWithXMLRPCRequest:request delegate:self];
    
    XMLRPCResponse * viewsResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:request error:nil];
    viewArray = [viewsResponse object];
    NSLog( @"\nDATA: \n%@\n", viewArray );

    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return viewArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CouponsCell *objcell=[tableView dequeueReusableCellWithIdentifier:@"CouponsCell"];
    if (objcell==nil)
    {
        objcell=[[[NSBundle mainBundle] loadNibNamed:@"CouponsCell" owner:self options:nil] objectAtIndex:0];
        
    }
   // objcell.img_coupon=
    NSString *str=[NSString stringWithFormat:@"%@",[viewArray objectAtIndex:indexPath.row]];
    UIImage *objimg=[UIImage imageNamed:str];
    objcell.img_coupon.image=objimg;
    
    return objcell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
