//
//  GroundMediaListTableViewCell.h
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroundMediaListTableViewCell : UITableViewCell
//左边标记View
@property (weak, nonatomic) IBOutlet UIView *zuobianSTView;
//项目时间Label
@property (weak, nonatomic) IBOutlet UILabel *projectTimeLabel;
//项目名称Label
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
//店铺名Label
@property (weak, nonatomic) IBOutlet UILabel *shopName;
//店铺头像
@property (weak, nonatomic) IBOutlet UIImageView *shopImaeView;

@end
