//
//  ViewController.m
//  MapDemo
//
//  Created by Magneto on 5/9/14.
//  Copyright (c) 2014 Magneto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapCustom;
- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager=[[CLLocationManager alloc]init];
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    arrOfLat=[[NSMutableArray alloc]initWithObjects:@"18.49537084",@"18.50236128",@"18.50007555",@"18.51230126",@"18.48895869",@"18.50992193",
    @"18.48330350",@"18.50866514",@"18.48748776",@"18.50107265",@"18.47692688",@"18.51787314",@"18.47490445",@"18.51182214",@"18.47830336",@"18.53246817",@"18.46939543",@"18.51289465",@"18.46289736",@"18.53073505",@"18.45919360", nil];
	
    arrOfLong=[[NSMutableArray alloc]initWithObjects:@"73.81353486",@"73.80475269",@"73.82689453",@"73.80631731",
               @"73.82096014",@"73.83402294",@"73.80780503",@"73.79065015",@"73.79474917",@"73.84133326",@"73.81830134",
               @"73.83836110",@"73.82222497",@"73.84364563",@"73.79875092",@"73.83427489",@"73.83407027",@"73.85381813",
               @"73.81683553",@"73.84411203",@"73.82159038", nil];
    arrOfTitle=[[NSMutableArray alloc]initWithObjects:@"FROZEN FANTACY",@"SCOOP N TREAT ICE CREAM PARLOU",@"CREAMY SCOOP",@"M/S ESHA ENTERPRISES",@"JUST CHILL",@"BESTO -APO",@"APULKI ICE CREAM PARLOUR",@"SAYEE ENTERPRISES",@"VENKATESHWARA FROSTIES",@"JAY GANESH ICECREAM PARLOUR",@"MAULI ENTERPRISES",@"PARTH ENTERPRISES",@"GOOD LUCK I/C PARLOUR",@"S N MARKETING",@"SAI AMUL ICECREAM PARLOUR",@"SAGAR COMMUNICATION",@"SINHGAD INSTITUTE PARLOUR",@"SHARAVA ICE CREAM",@"ABHIRUCHI PARLOUR",@"SHREE GANPATI BHUVAN",@"MAITREE FOODS", nil];
    arrOfSubtitle=[[NSMutableArray alloc]initWithObjects:@"10Happy Colony, Kothrud,Pune",
                   @"Gananjay Society, Gandhi Bhavan Road",@"Ganesh Park, Erandwane",@"Mathwad Prangan, Wing A, CTS No-1125",@"Shanti Ganga Apt.Shriram Society",@"Indrapushp",@"Chaitnya Nagari Warje Pune-411052",@"Audumbar Apt., Right Bhusari Colony",@"Shubham Heights,Warje Highway",@"Dattawadi,Pune",@"S.No-12/5,Suncity Road, Anandnagar,Pune",@"Bhandarkar Road,Pune",@"Manik Baug, Sinhagad Road,Pune",
                   @"L.B.Shastri Road,Pune",@"Dangat Estate, Near Warje Flyover",@"Deep Bunglow Chowk",
                   @"Sinhgad Campus, Pune-32",@"Sadashiv Path, Pune-30",@"Abhiruchi Mall,S.M.59/1C, Bhide Baug,Sinhgad Road, Vadgaon BK",@"F.C Road,Shivajinagar",@"Sun Universe", nil];
    
    for (int i=0; i<arrOfTitle.count; i++)
    {
        Annotation *annOfStore=[[Annotation alloc]init];
        CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake([arrOfLat[i] floatValue], [arrOfLong[i] floatValue]);
        annOfStore.coordinate=coordinate;
        annOfStore.title=arrOfTitle[i];
        annOfStore.subtitle=arrOfSubtitle[i];
        [mapCustom addAnnotation:annOfStore];
    }
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate, 4000, 4000);
    [mapCustom setRegion:region];
}

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation:(id<MKAnnotation>) annotation
{
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [self.mapCustom dequeueReusableAnnotationViewWithIdentifier: @"VoteSpotPin"];
    if (pin == nil)
    {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: @"TestPin"];
    }
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    else
    {
        pin.image=[UIImage imageNamed:@"green.png"];
        pin.canShowCallout = YES;
    }
    //pin.animatesDrop=YES;
    UIImageView *leftCalloutView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 30)];
    leftCalloutView.image=[UIImage imageNamed:@"green.png"];
    pin.leftCalloutAccessoryView=leftCalloutView;

    UIView *viewOfBtns=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    viewOfBtns.backgroundColor=[UIColor clearColor];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(0, 8, 19, 25)];
    btn1.tag=100;
    [btn1 addTarget:self action:@selector(hello:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateNormal];
    [viewOfBtns addSubview:btn1];

    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(35, 8, 19, 25)];
    btn2.tag=101;
    [btn2 addTarget:self action:@selector(hello:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateNormal];
    [viewOfBtns addSubview:btn2];
    pin.rightCalloutAccessoryView=viewOfBtns;
    
    return pin;
}
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *aV;
    for (aV in views)
    {
//        CGRect endFrame = aV.frame;
//        
//        aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 230.0, aV.frame.size.width, aV.frame.size.height);
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.45];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//        [aV setFrame:endFrame];
//        [UIView commitAnimations];
//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//        animation.duration = 10.f;
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//        animation.toValue = [NSValue valueWithCGPoint:CGPointMake([self.view frame].size.width - 100,
//                                                                  [self.view frame].size.height - 50)];
//        [aV.layer addAnimation:animation
//                             forKey:@"position"];

//        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//        
//        // Set the initial and the final values
//        [animation setFromValue:[NSNumber numberWithFloat:0.00f]];
//        [animation setToValue:[NSNumber numberWithFloat:1.f]];
//        
//        // Set duration
//        [animation setDuration:0.5f];
//        
//        // Set animation to be consistent on completion
//        [animation setRemovedOnCompletion:NO];
//        [animation setFillMode:kCAFillModeForwards];
//        // Add animation to the view's layer
//        [[aV layer] addAnimation:animation forKey:@"scale"];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                          animationWithKeyPath:@"transform"];
        CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
        CATransform3D scale2 = CATransform3DMakeScale(1.0, 1.0, 1);
        CATransform3D scale3 = CATransform3DMakeScale(1.3, 1.3, 1);
        CATransform3D scale4 = CATransform3DMakeScale(1.5, 1.5, 1);
        CATransform3D scale5 = CATransform3DMakeScale(1.3,1.3, 1);
        CATransform3D scale6 = CATransform3DMakeScale(1.0, 1.0, 1);
        NSArray *frameValues = [NSArray arrayWithObjects:
                                [NSValue valueWithCATransform3D:scale1],
                                [NSValue valueWithCATransform3D:scale2],
                                [NSValue valueWithCATransform3D:scale3],
                                [NSValue valueWithCATransform3D:scale4],
                                [NSValue valueWithCATransform3D:scale5],
                                [NSValue valueWithCATransform3D:scale6],
                                nil];
        [animation setValues:frameValues];
        NSArray *frameTimes = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0],
                               [NSNumber numberWithFloat:0.2],
                               [NSNumber numberWithFloat:0.4],
                               [NSNumber numberWithFloat:0.6],
                               [NSNumber numberWithFloat:0.8],
                               [NSNumber numberWithFloat:1.0],

                               nil];
        [animation setKeyTimes:frameTimes];
        
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.duration =1;
        
        [aV.layer addAnimation:animation forKey:@"popup"];
        
    }
}
-(void)hello:(UIButton *)sender
{
    if (sender.tag==100)
    {
        NSLog(@"First Button");
    }
    else if (sender.tag==101)
    {
        NSLog(@"Second Button");
    }
}
@end
