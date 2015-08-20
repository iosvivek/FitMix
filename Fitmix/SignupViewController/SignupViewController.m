//
//  SignupViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController
@synthesize SignupViewControllerDelegate;
-(void)viewDidAppear:(BOOL)animated
{
    [self.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)selectimg_btn:(UIButton *)sender
{
    //[SignupViewControllerDelegate selectimg];
    
    UIActionSheet *acts=[[UIActionSheet alloc] initWithTitle:@"Select" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Library",@"Camera", nil];
    [acts showInView:self.view];

}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //NSLog(@"===%d",buttonIndex);
    if (buttonIndex==0)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    else if (buttonIndex==1)
    {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            [myAlertView show];
        }
        else
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:picker animated:YES completion:NULL];
            
        }
    }
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    // UIImagePickerControllerOriginalImage
    img_profile.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



-(void)xmlparser
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@",dob_txt.text]];
    NSLog(@"date :- %@",date);
    
    NSDateFormatter* dateFormatter1 = [[[NSDateFormatter alloc] init] autorelease];
    dateFormatter1.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    
    NSDate *now = [NSDate date];
    NSString *formattedDateString = [dateFormatter1 stringFromDate:now];
    NSLog(@"ISO-8601 date: %@", formattedDateString);

    
    NSURL *URL = [NSURL URLWithString: @"http://stellarbee.com/fitmix/index.php/xmlrpc_server"];
    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
    
    //NSArray *arrREF=[NSArray arrayWithObjects:firstname_txt.text, lastname_txt.text, email_txt.text,phone_txt.text, formattedDateString,email_txt.text,password_txt.text,card_name_txt.text,card_number_txt.text,cvc_txt.text,expiry_month_txt.text,expiry_year_txt.text,zip_code_txt.text, @"",nil];
    NSArray *arrREF=[NSArray arrayWithObjects:@"fName", @"lName", @"test_email@gmail.com", @"9595959595", @"1987-04-25",@"test-003", @"test-003", @"test Card", @"", @"", @"", @"", @"", @"",nil];
    
    XMLRPCConnectionManager *manager = [XMLRPCConnectionManager sharedManager];
    
    [request setMethod:@"signup" withParameter:arrREF];
    NSLog(@"Request body: %@", [request body]);
    [manager spawnConnectionWithXMLRPCRequest:request delegate:self];
    
    XMLRPCResponse * viewsResponse = [XMLRPCConnection sendSynchronousXMLRPCRequest:request error:nil];
    NSMutableArray * viewArray = [viewsResponse object];
    NSLog( @"\nDATA: \n%@\n", viewArray );
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

- (IBAction)signup_btn:(UIButton *)sender
{
    [self xmlparser];
    
}


 @end
