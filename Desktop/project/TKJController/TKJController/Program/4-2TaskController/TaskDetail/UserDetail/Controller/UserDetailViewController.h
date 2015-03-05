//
//  UserDetailViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"
@interface UserDetailViewController : UIViewController<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView * _bMapView;
    
    BMKLocationService* _locService;
    
    BMKUserLocation * _userLocation;
    
    //地图缩放的级别
    int _addI;
}


//返回按钮
- (IBAction)backButton;
//消息按钮
- (IBAction)messageButton;

@property (weak, nonatomic) IBOutlet UIView *mapView;
//加按钮
- (IBAction)addButton;
//减按钮
- (IBAction)subtractButton;

//人员头像
@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImageView;
@end
