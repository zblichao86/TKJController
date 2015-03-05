//
//  UserDetailViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UserDetailViewController.h"
#import "MessageViewController.h"
@interface UserDetailViewController ()

@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置默认属性
    [self initMorenShuXin];
    
    //添加地图
    [self initBMapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _bMapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _bMapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    
}
#pragma mark Map
//********************************************************
/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"马上开始定位");
}
/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"定位失败");
}
/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_bMapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
    
}
/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
//    NSLog(@"当前位置 lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//    [_bMapView updateLocationData:userLocation];
}


#pragma mark 初始化地图
- (void)initBMapView
{
    //代码创建BMKMapView
    _bMapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-255)];
    
    [self.mapView addSubview:_bMapView];
    
    //1.地图类型
    _bMapView.mapType = BMKMapTypeTrafficOn;
    //2.显示比例尺控件
    //_mapView.showMapScaleBar = true;
    //3.自定义比例尺控件在地图上的位置
    //_mapView.mapScaleBarPosition = CGPointMake(240, 280);
    //4.指南针在地图上显示的位置（默认指南针在地图发生变化时才出现）
    _bMapView.compassPosition = CGPointMake(10,10);
    //5.地图缩放的级别，手机上3-19级
    _addI = 16;
    _bMapView.zoomLevel = _addI;
    //6.地图旋转角度，手上范围-180-180
    _bMapView.rotation = 90;
    //7.地图俯视角度-45-0
    _bMapView.overlooking = -45;
    //8.设置地图的中心点，在地图上的坐标位置
    //[_mapView setMapCenterToScreenPt:CGPointMake(100, 30)];
    
    //定位
    _locService = [[BMKLocationService alloc]init];
    [_locService startUserLocationService];
    
    _bMapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
    _bMapView.showsUserLocation = YES;//显示定位图层
    
    _userLocation = [[BMKUserLocation alloc]init];
    
}

- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)messageButton {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
#pragma mark---放大
- (IBAction)addButton {
    if (_addI < 19)
    {
        _addI++;
    }
    _bMapView.zoomLevel = _addI;
    
}
#pragma mark---缩小
- (IBAction)subtractButton {
    if (_addI > 3)
    {
        _addI--;
    }
    _bMapView.zoomLevel = _addI;
}
#pragma mark---设置默认属性
- (void)initMorenShuXin
{
    //设置圆头像
    self.userPhotoImageView.layer.cornerRadius = 49;
    //超过的圆角的不显示
    self.userPhotoImageView.layer.masksToBounds = YES;
}
@end
