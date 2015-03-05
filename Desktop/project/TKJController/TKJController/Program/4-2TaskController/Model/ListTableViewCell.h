//
//  ListTableViewCell.h
//  TKJAdmin
//
//  Created by apple on 15/2/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

//项目地点
@property (weak, nonatomic) IBOutlet UILabel *projectPlace;
//项目时间
@property (weak, nonatomic) IBOutlet UILabel *projectTime;
//专员名称
@property (weak, nonatomic) IBOutlet UILabel *zhuanyuanName;
//邀请码
@property (weak, nonatomic) IBOutlet UILabel *yaoqingNum;
//任务总结
@property (weak, nonatomic) IBOutlet UIButton *TaskZongjieButton;
//消息发布
@property (weak, nonatomic) IBOutlet UIButton *MessageFaBuButton;

@end
