//
//  LTTabBarViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "LTTabBarViewController.h"

#import "HomeViewController.h"
#import "TaskViewController.h"
#import "GroundMediaViewController.h"
#import "StatisticsViewController.h"
#import "QuestionnaireViewController.h"

@interface LTTabBarViewController ()

@end

@implementation LTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
    
}

//初始化所有的子控制器

- (void)setupAllChildViewControllers
{
    // 1.首页
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setupChildViewController:home title:@"概况" imageName:@"bottom_radio_general _0" selectedImageName:@"bottom_radio_general _1"];
    
    // 2.任务
    TaskViewController *task = [[TaskViewController alloc] init];
    [self setupChildViewController:task title:@"任务" imageName:@"bottom_radio_task_0" selectedImageName:@"bottom_radio_task_1"];
    
    // 3.地媒
    GroundMediaViewController *groundMedia = [[GroundMediaViewController alloc] init];
    [self setupChildViewController:groundMedia title:@"地媒" imageName:@"bottom_radio_media_0" selectedImageName:@"bottom_radio_media_1"];
    
    // 4.统计
    StatisticsViewController *statistics = [[StatisticsViewController alloc] init];
    [self setupChildViewController:statistics title:@"统计" imageName:@"bottom_radio_static_0" selectedImageName:@"bottom_radio_static_1"];
    
    // 4.问卷
    QuestionnaireViewController *questionnaire = [[QuestionnaireViewController alloc] init];
    [self setupChildViewController:questionnaire title:@"问卷" imageName:@"bottom_radio_question_0" selectedImageName:@"bottom_radio_question_1"];
}

/*
 初始化一个子控制器
需要初始化的子控制器
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 2.包装一个导航控制器
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:childVc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBar setTintColor:[UIColor colorWithRed:48.0/255 green:166.0/255    blue:0.0/255 alpha:1]];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar"]];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
