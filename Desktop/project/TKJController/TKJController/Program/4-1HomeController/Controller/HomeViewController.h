//
//  HomeViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

//返回首页
- (IBAction)backProgectList;
//消息页
- (IBAction)messageVC;
//中型车辆
@property (weak, nonatomic) IBOutlet UILabel *middleVehicles;
//小型车辆
@property (weak, nonatomic) IBOutlet UILabel *smallVehicles;
//大型车辆
@property (weak, nonatomic) IBOutlet UILabel *largeVehicles;

//经理
@property (weak, nonatomic) IBOutlet UILabel *managersTime;
//专员
@property (weak, nonatomic) IBOutlet UILabel *assistantTime;
//小蜜蜂
@property (weak, nonatomic) IBOutlet UILabel *beesTime;


//专员数据
@property (weak, nonatomic) IBOutlet UILabel *assistantName;
//注册数据
@property (weak, nonatomic) IBOutlet UILabel *registration;

//关注数据
@property (weak, nonatomic) IBOutlet UILabel *attention;
//留电数据
@property (weak, nonatomic) IBOutlet UILabel *phone;

//拉访数据
@property (weak, nonatomic) IBOutlet UILabel *visit;
//派单数据
@property (weak, nonatomic) IBOutlet UILabel *leaflets;

@end
