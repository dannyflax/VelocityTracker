//
//  AppDelegate.h
//  VelocityTracker
//
//  Created by Danny Flax on 6/1/15.
//  Copyright (c) 2015 Danny Flax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CMMotionManager *motionManager;
}
@property (strong, nonatomic) UIWindow *window;
@property (readonly) CMMotionManager *motionManager;

@end

