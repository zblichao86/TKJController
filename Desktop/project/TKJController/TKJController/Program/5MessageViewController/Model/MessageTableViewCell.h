//
//  MessageTableViewCell.h
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
//1:是否读取条
@property (weak, nonatomic) IBOutlet UIView *isOrNoReadView;
//2：头像
@property (weak, nonatomic) IBOutlet UIImageView *touxiangImageView;
//3：消息发布人名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//4:项目名称
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
//5：项目地点
@property (weak, nonatomic) IBOutlet UILabel *projectPlaceLabel;
//6：消息回复个数
@property (weak, nonatomic) IBOutlet UILabel *backMessageNumLabel;
//7：消息详情按钮
@property (weak, nonatomic) IBOutlet UIButton *lookMessageDetailButton;
//8:消息发布时间
@property (weak, nonatomic) IBOutlet UILabel *messageSenderTimeLabel;
//9:部分消息
@property (weak, nonatomic) IBOutlet UILabel *messageLittleLabel;

@end
