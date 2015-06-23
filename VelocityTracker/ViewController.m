//
//  ViewController.m
//  VelocityTracker
//
//  Created by Danny Flax on 6/1/15.
//  Copyright (c) 2015 Danny Flax. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    
    return motionManager;
}


- (void)startMyMotionDetect
{
    
    [self.motionManager
     startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
     withHandler:^(CMAccelerometerData *data, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(),
                        ^{
                            NSLog(@"%f, %f, %f",data.acceleration.x, data.acceleration.y, data.acceleration.z);
                       
                        }
                        );
     }
     ];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startMyMotionDetect];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//this is a delegate method
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    NSLog(@"%f, %f, %f, %f", acceleration.x, acceleration.y, acceleration.z, acceleration.timestamp);
}

@end
