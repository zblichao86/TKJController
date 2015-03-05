//
//  AppDelegate.h
//  TKJAdmin
//
//  Created by apple on 15/2/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,BMKGeneralDelegate>
{
    BMKMapManager * _mapManager;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong)CLLocationManager * locationManager;
@end

