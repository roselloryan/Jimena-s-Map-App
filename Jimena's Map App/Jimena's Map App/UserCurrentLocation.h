//
//  MyCurrentLocation.h
//  Jimena's Map App
//
//  Created by Jimena Almendares on 12/7/15.
//  Copyright © 2015 RAR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface UserCurrentLocation : NSObject <MKAnnotation>

@property (assign, nonatomic) CGFloat latitude;
@property (assign, nonatomic) CGFloat longitude; 
           


-(instancetype)initWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude;

@end
