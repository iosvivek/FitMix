//
//  LocationViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationCell.h"
#import <CoreLocation/CoreLocation.h>
#import <GoogleMaps/GoogleMaps.h>

@interface LocationViewController : UIViewController<CLLocationManagerDelegate,GMSMapViewDelegate>
{
    GMSMapView *mapView;
}

@property (nonatomic,strong)CLLocationManager *locationmanager;
@end
