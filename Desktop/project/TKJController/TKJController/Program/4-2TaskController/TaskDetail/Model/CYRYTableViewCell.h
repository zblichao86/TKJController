//
//  CYRYTableViewCell.h
//  TKJAdmin
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYRYTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *touxiangImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPhoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *playPhoneButton;

@property (weak, nonatomic) IBOutlet UIButton *userDetailButon;

@end
