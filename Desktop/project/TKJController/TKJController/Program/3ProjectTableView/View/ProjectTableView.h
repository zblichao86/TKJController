//
//  ProjectTableView.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectTableView : UIView

@property (nonatomic,strong)UIButton * messageButton;

@property (nonatomic,copy)NSString * IDMessage;
@property (nonatomic,copy)NSString * userName;

@property (nonatomic,strong)UILabel * idTitle;
@property (nonatomic,strong)UILabel * idName;

@property (nonatomic,strong)UIImageView * tXimageView;
@end
