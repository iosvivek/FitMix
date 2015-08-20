//
//  CouponsViewController.h
//  Fitmix
//
//  Created by Samir on 7/1/15.
//  Copyright (c) 2015 Omni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CouponsCell.h"
#import "XMLRPCConnection.h"
#import "XMLRPCConnectionDelegate.h"
#import "XMLRPCConnectionManager.h"
#import "XMLRPCRequest.h"
#import "XMLRPCResponse.h"


@interface CouponsViewController : UIViewController<XMLRPCConnectionDelegate>
{

    NSMutableArray * viewArray;
}
@end
