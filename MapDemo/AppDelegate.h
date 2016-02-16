//
//  AppDelegate.h
//  MapDemo
//
//  Created by Magneto on 5/9/14.
//  Copyright (c) 2014 Magneto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) CLLocationManager *locationManager;
@end
