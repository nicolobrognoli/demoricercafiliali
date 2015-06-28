//
//  ViewController.m
//  DemoRicercaFiliali
//
//  Created by Nicolò Brognoli on 28/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "ViewController.h"

#define LONGITUDINE_QUINTINO 10.996453
#define LATITUDINE_QUINTINO 45.44234

@interface ViewController ()

@property (nonatomic, strong) CLLocationManager *locationMgr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    self.locationMgr = [[CLLocationManager alloc] init];
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    
    CLAuthType authType = [self.locationMgr checkAuthorization];
    
    switch (authType) {
        case CLAuthTypeAuthorized:
        {
            [self.locationMgr startUpdatingLocation];
        }
            break;
        case CLAuthTypePromptNeeded:
        {
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [self.locationMgr requestAlwaysAuthorization];
            } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationMgr requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
            break;
        case CLAuthTypeDenied:
        {
            NSLog(@"CoreLocation: Authorization Denied");
        }
            break;
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
