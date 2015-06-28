//
//  InterfaceController.h
//  DemoRicercaFiliali WatchKit Extension
//
//  Created by Nicolò Brognoli on 28/06/15.
//  Copyright (c) 2015 Lynx S.p.A. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import "CLLocationManager+VersionWrapper.h"

@interface InterfaceController : WKInterfaceController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet WKInterfaceMap *map;

@end
