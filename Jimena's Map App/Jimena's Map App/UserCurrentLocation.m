//
//  MyCurrentLocation.m
//  Jimena's Map App
//
//  Created by Jimena Almendares on 12/7/15.
//  Copyright © 2015 RAR. All rights reserved.
//

#import "UserCurrentLocation.h"

@implementation UserCurrentLocation


-(instancetype)initWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    
    if (self) {
        _latitude = latitude;
        _longitude = longitude;
    }
    return  self;
}

-(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = [@(self.latitude) doubleValue];
    coordinate.longitude = [@(self.longitude) doubleValue];
    
    return coordinate;
}

@end
