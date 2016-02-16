//
//  ViewController.h
//  MapDemo
//
//  Created by Magneto on 5/9/14.
//  Copyright (c) 2014 Magneto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
@interface ViewController : UIViewController<MKMapViewDelegate>
{
    NSMutableArray *arrOfLat,*arrOfLong,*arrOfTitle,*arrOfSubtitle;
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapCustom;
@end
