//
//  LocationViewController.m
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMapView];
    [self setmappoint];
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationCell *objcell=[tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    if (objcell==nil)
    {
        objcell=[[[NSBundle mainBundle] loadNibNamed:@"LocationCell" owner:self options:nil] objectAtIndex:0];
    
     }
return objcell;
}
-(void)setMapView
{
    //23.047235, 72.533832
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:23.047235 longitude:72.533832 zoom:17];
    
    mapView = [GMSMapView mapWithFrame:CGRectMake(0, 100, self.view.bounds.size.width ,self.view.bounds.size.height-300) camera:camera];
    mapView.delegate=self;
     mapView.myLocationEnabled = YES;
    [self.view addSubview:mapView];
}
-(void)setmappoint
{
    GMSMarker *currentmarker = [[GMSMarker alloc] init];
    currentmarker.position = CLLocationCoordinate2DMake(23.047235 , 72.533832);
    
    currentmarker.title = @"Shilp Complex";
    currentmarker.snippet = @"Gurukul Rd ,Sushil Nagar Society ,Memnagar ,Ahmedabad";
    currentmarker.map = mapView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
