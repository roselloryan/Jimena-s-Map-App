//
//  PinOnMapViewController.h
//  Jimena's Map App
//
//  Created by Jimena Almendares on 12/4/15.
//  Copyright © 2015 RAR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCurrentLocation.h"

@interface pinOnMapViewController : UIViewController

@property (strong, nonatomic) UserCurrentLocation *currentLocation;

@end
