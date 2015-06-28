//
//  CLLocationManager+VersionWrapper.h
//  WatchExample
//
//  Created by Nicolò Brognoli on 27/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

typedef enum {
    CLAuthTypeUnknown = 0,
    CLAuthTypeAuthorized = 1,
    CLAuthTypePromptNeeded = 2,
    CLAuthTypeDenied = 3,
} CLAuthType;

@interface CLLocationManager (VersionWrapper)

- (CLAuthType)checkAuthorization;

@end
