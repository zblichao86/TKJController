//
//  PlaceMapViewController.h
//  TKJController
//
//  Created by apple on 15/3/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface PlaceMapViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView * _bMapView;
    
    BMKLocationService* _locService;
    
    BMKUserLocation * _userLocation;
    
    //地图缩放的级别
    int _addI;
}




@property (weak, nonatomic) IBOutlet UIView *placeMapView;
//返回
- (IBAction)backButton;
//加按钮
- (IBAction)addButton;
//减按钮
- (IBAction)subtractButton;

@end
