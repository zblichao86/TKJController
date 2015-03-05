//
//  TaskDetailViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSString * _userPhoneStr;
}

//返回按钮
- (IBAction)backButton;
//详情TableView
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
//消息按钮
- (IBAction)messageButton;

//奖励机制按钮
- (IBAction)jiangLJZButton;
//地点地图
- (IBAction)placeMapButton;

@end
