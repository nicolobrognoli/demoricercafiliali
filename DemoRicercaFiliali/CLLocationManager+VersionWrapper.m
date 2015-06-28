//
//  CLLocationManager+VersionWrapper.m
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import "CLLocationManager+VersionWrapper.h"

@implementation CLLocationManager (VersionWrapper)

- (CLAuthType)checkAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
        {
            return CLAuthTypePromptNeeded;
        }
            break;
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
        {
            return CLAuthTypeDenied;
        }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        {
            return CLAuthTypeAuthorized;
        }
            break;
        default:
            break;
    }
    
    return CLAuthTypeUnknown;
}

@end