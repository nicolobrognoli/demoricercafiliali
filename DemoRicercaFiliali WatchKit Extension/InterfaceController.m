//
//  InterfaceController.m
//  DemoRicercaFiliali WatchKit Extension
//
//  Created by Nicolò Brognoli on 28/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "InterfaceController.h"

#define LONGITUDINE_QUINTINO 10.996453
#define LATITUDINE_QUINTINO 45.44234

@interface InterfaceController()

@property (nonatomic, strong) CLLocationManager *locationMgr;
@property (nonatomic, strong) CLLocation *lastLocation;
@property (nonatomic, strong) NSTimer *timer;


@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
    
    self.locationMgr = [[CLLocationManager alloc] init];
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationMgr.delegate = self;
    
    [self.locationMgr startUpdatingLocation];
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(LATITUDINE_QUINTINO, LONGITUDINE_QUINTINO);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.map setRegion:region];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation;
    if (locations && [locations objectAtIndex:0]) {
        currentLocation = [locations objectAtIndex:0];
    }
    
    if (currentLocation)
    {
        if (currentLocation.coordinate.latitude != self.lastLocation.coordinate.latitude &&
            currentLocation.coordinate.longitude != self.lastLocation.coordinate.longitude) {
            self.lastLocation = currentLocation;
            NSLog(@"New location: %f, %f", self.lastLocation.coordinate.latitude, self.lastLocation.coordinate.longitude);
            
            self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(updatePosition) userInfo:nil repeats:NO];
        }
    }
}

-(void)updatePosition
{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    CLLocationCoordinate2D userLocation = CLLocationCoordinate2DMake(self.lastLocation.coordinate.latitude, self.lastLocation.coordinate.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation, span);
    [self.map setRegion:region];
    
    CLLocationCoordinate2D quintino = CLLocationCoordinate2DMake(LATITUDINE_QUINTINO, LONGITUDINE_QUINTINO);
    
    [self.map addAnnotation:quintino withImageNamed:@"pin_point" centerOffset:CGPointMake(0, -30)];
    
    [self.map addAnnotation:userLocation withImageNamed:@"userpin" centerOffset:CGPointMake(0, 0)];
}

#pragma mark - Action

- (IBAction)informazioniAction
{
    [self presentControllerWithName:@"informazioni" context:nil];
}

- (IBAction)altreOpzioniAction {
    [self presentControllerWithName:@"altreOpzioni" context:nil];
}


@end



