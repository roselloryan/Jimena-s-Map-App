//
//  CrazyButtonStyleKit.m
//  ProjectName
//
//  Created by AuthorName on 12/1/15.
//  Copyright (c) 2015 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "CrazyButtonStyleKit.h"


@implementation CrazyButtonStyleKit

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawCanvas1
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* color3 = [UIColor colorWithRed: 0.296 green: 0.001 blue: 0.001 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.951 green: 0.837 blue: 0.174 alpha: 1];

    //// Rectangle Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 81.73, 76.24);

    UIBezierPath* rectanglePath = [UIBezierPath bezierPath];
    [rectanglePath moveToPoint: CGPointMake(-39.73, 0.73)];
    [rectanglePath addLineToPoint: CGPointMake(-80.65, -39.24)];
    [rectanglePath addLineToPoint: CGPointMake(-78.66, -39.24)];
    [rectanglePath addLineToPoint: CGPointMake(-70.91, -13.24)];
    [rectanglePath addLineToPoint: CGPointMake(-62.14, -5.24)];
    [rectanglePath addLineToPoint: CGPointMake(-39.73, -0.29)];
    [rectanglePath addLineToPoint: CGPointMake(-39.73, 1.76)];
    [rectanglePath addLineToPoint: CGPointMake(-80.65, 1.76)];
    [rectanglePath addCurveToPoint: CGPointMake(-78.71, -0.24) controlPoint1: CGPointMake(-81.21, 1.76) controlPoint2: CGPointMake(-78.71, 0.32)];
    [rectanglePath addCurveToPoint: CGPointMake(-71.89, -5.24) controlPoint1: CGPointMake(-78.71, -0.81) controlPoint2: CGPointMake(-72.44, -5.24)];
    [rectanglePath addLineToPoint: CGPointMake(-39.73, -0.29)];
    [rectanglePath addLineToPoint: CGPointMake(-39.73, 1.76)];
    [rectanglePath addLineToPoint: CGPointMake(-79.66, 1.76)];
    [rectanglePath addLineToPoint: CGPointMake(-80.65, 1.76)];
    [rectanglePath addLineToPoint: CGPointMake(-80.65, 0.73)];
    [rectanglePath addLineToPoint: CGPointMake(-80.65, -39.24)];
    [rectanglePath addLineToPoint: CGPointMake(-78.66, -39.24)];
    [rectanglePath addLineToPoint: CGPointMake(-71.89, -5.24)];
    [rectanglePath addCurveToPoint: CGPointMake(-79.66, 1.76) controlPoint1: CGPointMake(-71.89, -4.68) controlPoint2: CGPointMake(-79.11, 1.76)];
    [rectanglePath addCurveToPoint: CGPointMake(-39.73, 0.73) controlPoint1: CGPointMake(-80.21, 1.76) controlPoint2: CGPointMake(-39.73, 1.3)];
    [rectanglePath closePath];
    [color setFill];
    [rectanglePath fill];

    CGContextRestoreGState(context);


    //// Star Drawing
    UIBezierPath* starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(15.5, 55.75)];
    [starPath addLineToPoint: CGPointMake(19.82, 61.28)];
    [starPath addLineToPoint: CGPointMake(27.15, 63.18)];
    [starPath addLineToPoint: CGPointMake(22.49, 68.49)];
    [starPath addLineToPoint: CGPointMake(22.7, 75.2)];
    [starPath addLineToPoint: CGPointMake(15.5, 72.95)];
    [starPath addLineToPoint: CGPointMake(8.3, 75.2)];
    [starPath addLineToPoint: CGPointMake(8.51, 68.49)];
    [starPath addLineToPoint: CGPointMake(3.85, 63.18)];
    [starPath addLineToPoint: CGPointMake(11.18, 61.28)];
    [starPath closePath];
    [color2 setFill];
    [starPath fill];
    [color3 setStroke];
    starPath.lineWidth = 1;
    [starPath stroke];


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(42.56, 78)];
    [bezierPath addCurveToPoint: CGPointMake(51.53, 64.14) controlPoint1: CGPointMake(51.53, 64.14) controlPoint2: CGPointMake(67.46, 64.14)];
    [bezierPath addCurveToPoint: CGPointMake(34.59, 64.14) controlPoint1: CGPointMake(35.59, 64.14) controlPoint2: CGPointMake(26.62, 75.03)];
    [bezierPath addCurveToPoint: CGPointMake(51.53, 39.39) controlPoint1: CGPointMake(42.56, 53.25) controlPoint2: CGPointMake(63.48, 32.45)];
    [bezierPath addCurveToPoint: CGPointMake(27.62, 59.19) controlPoint1: CGPointMake(39.57, 46.32) controlPoint2: CGPointMake(20.65, 74.04)];
    [bezierPath addCurveToPoint: CGPointMake(34.59, 46.32) controlPoint1: CGPointMake(34.59, 44.34) controlPoint2: CGPointMake(49.53, 38.4)];
    [bezierPath addCurveToPoint: CGPointMake(51.53, 17.6) controlPoint1: CGPointMake(19.65, 54.24) controlPoint2: CGPointMake(43.56, 34.44)];
    [bezierPath addCurveToPoint: CGPointMake(27.62, 34.44) controlPoint1: CGPointMake(59.5, 0.77) controlPoint2: CGPointMake(43.56, 24.53)];
    [bezierPath addCurveToPoint: CGPointMake(27.62, 17.6) controlPoint1: CGPointMake(11.68, 44.34) controlPoint2: CGPointMake(18.65, 39.39)];
    [bezierPath addCurveToPoint: CGPointMake(14.17, 26.02) controlPoint1: CGPointMake(36.58, -4.18) controlPoint2: CGPointMake(30.11, 12.16)];
    [bezierPath addCurveToPoint: CGPointMake(1.22, 37.9) controlPoint1: CGPointMake(-1.77, 39.88) controlPoint2: CGPointMake(1.22, 37.9)];
    bezierPath.lineCapStyle = kCGLineCapRound;

    bezierPath.lineJoinStyle = kCGLineJoinBevel;

    [UIColor.redColor setFill];
    [bezierPath fill];
    [color4 setStroke];
    bezierPath.lineWidth = 2;
    [bezierPath stroke];


    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(1.43, 36.5)];
    [bezier2Path addCurveToPoint: CGPointMake(1.43, 78) controlPoint1: CGPointMake(0.46, 79.01) controlPoint2: CGPointMake(1.43, 78)];
    [bezier2Path addLineToPoint: CGPointMake(42.5, 78)];
    bezier2Path.lineCapStyle = kCGLineCapRound;

    bezier2Path.lineJoinStyle = kCGLineJoinBevel;

    [color4 setStroke];
    bezier2Path.lineWidth = 2;
    [bezier2Path stroke];
}

@end
