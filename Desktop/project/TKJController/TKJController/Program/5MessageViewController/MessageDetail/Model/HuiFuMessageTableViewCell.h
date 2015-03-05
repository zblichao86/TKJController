//
//  HuiFuMessageTableViewCell.h
//  TKJAdmin
//
//  Created by apple on 15/3/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuiFuMessageTableViewCell : UITableViewCell
//回复正文label的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *huifuContentLabelHight;
//回复正文label内容
@property (weak, nonatomic) IBOutlet UILabel *huifuContentLabel;
@end
