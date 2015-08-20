//
//  HomeViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    
    LoginViewController *objlogin;
    SignupViewController *objsinup;
    MyFitmixViewController *objmyfitmix;
    ProfileViewController *objprofile;
    LocationViewController *objlocation;
    CouponsViewController *objcoupons;
    CheckinViewController *objCheckin;
}
@end

@implementation HomeViewController
@synthesize str;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self Homeview];
    
    
     iconArr=[NSArray arrayWithObjects:@"Home.png",@"Sign_UP.png",@"Login.png",@"Exit.png", nil];
    nameArr=[NSArray arrayWithObjects:@"HOME",@"SIGN UP",@"LOGIN",@"EXIT", nil];
    
    iconArr2=[NSArray arrayWithObjects:@"My_FitMix.png",@"My_Profile.png",@"Locations.png",@"Deals.png",@"Referrals.png",@"Exit.png", nil];
    nameArr2=[NSArray arrayWithObjects:@"MY FITMIX",@"PROFILE",@"LOCATIONS",@"DEALS",@"REFERRALS",@"EXIT", nil];


    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"%@",str);
     if ([str isEqualToString:@"Signup"])
    {
        [self signupview];
    }
    else if([str isEqualToString:@"Login"])
    {
        [self Loginview];
    }
    else if([str isEqualToString:@"Skip"])
    {
        [self Homeview];
    }
    
}
- (IBAction)signup_btn:(id)sender
{
    [self signupview];
}
- (IBAction)login_btn:(id)sender
{
    [self Loginview];
}
-(IBAction)mennu_btn:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    [saidview setFrame:CGRectMake(0, 15, 160, 553)];
}
#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (curantstetas==1)
    {
        return nameArr2.count;
    }
    else
    {
        return nameArr.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustamCell *objcell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (objcell==nil)
    {
        objcell=[[[NSBundle mainBundle] loadNibNamed:@"CustamCell" owner:self options:nil] objectAtIndex:0];

    }
    if (curantstetas==1)
    {
        objcell.objimage.image=[UIImage imageNamed:[iconArr2 objectAtIndex:indexPath.row]];
        objcell.name_lbl.text=[nameArr2 objectAtIndex:indexPath.row];
    }
    else
    {
        objcell.objimage.image=[UIImage imageNamed:[iconArr objectAtIndex:indexPath.row]];
        objcell.name_lbl.text=[nameArr objectAtIndex:indexPath.row];
    }
    UIView *bgColorView = [[UIView alloc] init];
    [bgColorView setBackgroundColor:[UIColor  blackColor]];
    [objcell setSelectedBackgroundView:bgColorView];
    return objcell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self removeallView];
    if (curantstetas==1)
    {
        if (indexPath.row==0)
        {
            [self Myfitmix];
        }
        else if (indexPath.row==1)
        {
            [self Profile];
        }
        else if (indexPath.row==2)
        {
            [self Location];
        }
        else if (indexPath.row==3)
        {
            [self Coupons];
        }
        else if(indexPath.row==4)
        {
            [self Referrals];
        }
        else if(indexPath.row==5)
        {
            exit(0);
        }
        
        
    }
    else
    {
        if (indexPath.row==0)
        {
            [self Homeview];
        }
        else if (indexPath.row==1)
        {
            [self signupview];
        }
        else if (indexPath.row==2)
        {
            [self Loginview];
        }
        else if (indexPath.row==3)
        {
            exit(0);
        }
    }
}
-(void)removeallView
{
    for (UIView *objView in containerView.subviews)
    {
        if ([objView isKindOfClass:[UIView class]])
        {
            [objView removeFromSuperview];
        }
    }
}

-(void)hiddenmenu
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    [saidview setFrame:CGRectMake(-160, 15, 160, 553)];
}
-(void)Homeview
{
    Title_lbl.text=@"HOME";
    login_btn.hidden=YES;
    subscribe_btn.hidden=YES;
    [containerView addSubview:homecontainerview];
    [self hiddenmenu];
    
}
-(void)Loginview
{
    Title_lbl.text=@"LOGIN";
    login_btn.hidden=YES;
    subscribe_btn.hidden=YES;
    objlogin=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    objlogin.LoginViewControllerDelegate=self;
    objlogin.view.frame=CGRectMake(0, 0, objlogin.view.frame.size.width, objlogin.view.frame.size.height);
    [containerView addSubview:objlogin.view];
    [self hiddenmenu];
}
 
-(void)signupview
{
    Title_lbl.text=@"SIGNUP";
    login_btn.hidden=NO;
    subscribe_btn.hidden=YES;
    objsinup=[[SignupViewController alloc]initWithNibName:@"SignupViewController" bundle:nil];
    objsinup.SignupViewControllerDelegate=self;
    objsinup.view.frame=CGRectMake(0, 0, objsinup.view.frame.size.width, objsinup.view.frame.size.height);
    [containerView addSubview:objsinup.view];
    [self hiddenmenu];

}
-(void)Myfitmix
{
    Title_lbl.text=@"MY FITMIX";
    subscribe_btn.hidden=NO;
    objmyfitmix=[[MyFitmixViewController alloc]initWithNibName:@"MyFitmixViewController" bundle:nil];
    objmyfitmix.MyfitmixViewControllerDelegate=self;
    [containerView addSubview:objmyfitmix.view];
    curantstetas=1;
    [self hiddenmenu];
    [menu_tebal reloadData];
}
-(void)Checkin
{
   Title_lbl.text=@"CSAN IN";
    objCheckin=[[CheckinViewController alloc]initWithNibName:@"CheckinViewController" bundle:nil];
    [containerView addSubview:objCheckin.view];
    [self hiddenmenu];
    [menu_tebal reloadData];
}


-(void)Profile
{
    Title_lbl.text=@"PROFILE";
    subscribe_btn.hidden=NO;
     objprofile=[[ProfileViewController alloc]initWithNibName:@"ProfileViewController" bundle:nil];
    [containerView addSubview:objprofile.view];
    [self hiddenmenu];
}
-(void)Location
{
    Title_lbl.text=@"LOCATIONS";
    subscribe_btn.hidden=YES;
    objlocation=[[LocationViewController alloc]initWithNibName:@"LocationViewController" bundle:nil];
    [containerView addSubview:objlocation.view];
    [self hiddenmenu];
}
-(void)Coupons
{
    Title_lbl.text=@"DEALS";
    subscribe_btn.hidden=YES;
    objcoupons=[[CouponsViewController alloc]initWithNibName:@"CouponsViewController" bundle:nil];
    [containerView addSubview:objcoupons.view];
    [self hiddenmenu];
}
-(void)Referrals
{
    NSLog(@"Referrals is not Availabal...");
    [self hiddenmenu];
}
 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
