//
//  ProjectTableView.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ProjectTableView.h"
#import "Mycontrols.h"
#define screenFrame [UIScreen mainScreen].bounds
#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface ProjectTableView()
{
    UIImageView * _backgroundImageView1;
}
@end
@implementation ProjectTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.frame = CGRectMake(0, 0, screenWidth, screenHeight*2/5);
        
        self.IDMessage = @"身份:";
        self.userName = @"姓名";
        
        [self setupLoginView];
    }
    return self;
}


- (void)setupLoginView
{
    //view1
    _backgroundImageView1 = [[UIImageView alloc]init];
    _backgroundImageView1.image = [UIImage imageNamed:@"2-tittle"];
    _backgroundImageView1.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_backgroundImageView1];
    
    NSLayoutConstraint * View1Width = [NSLayoutConstraint constraintWithItem:_backgroundImageView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:screenWidth];
    [_backgroundImageView1 addConstraint:View1Width];
    
    NSLayoutConstraint * View1h = [NSLayoutConstraint constraintWithItem:_backgroundImageView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.height/2];
    [_backgroundImageView1 addConstraint:View1h];
    
    NSLayoutConstraint * View1L = [NSLayoutConstraint constraintWithItem:_backgroundImageView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    [self addConstraint:View1L];
    
    NSLayoutConstraint * View1Y = [NSLayoutConstraint constraintWithItem:_backgroundImageView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    [self addConstraint:View1Y];
    
    
    //***************************************************************
    
    //logo
    UILabel * projectTittle = [[UILabel alloc]init];
    projectTittle.text = @"我的项目";
    projectTittle.textColor = [UIColor whiteColor];
    projectTittle.textAlignment = NSTextAlignmentCenter;
    projectTittle.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:projectTittle];
    //width
    NSLayoutConstraint * logoWidth = [NSLayoutConstraint constraintWithItem:projectTittle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:80];
    [projectTittle addConstraint:logoWidth];
    //hight
    NSLayoutConstraint * logoHight = [NSLayoutConstraint constraintWithItem:projectTittle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [projectTittle addConstraint:logoHight];
    
    //位置
    NSLayoutConstraint * logoCenterT = [NSLayoutConstraint constraintWithItem:projectTittle attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self addConstraint:logoCenterT];
    
    NSLayoutConstraint * logoCenterX = [NSLayoutConstraint constraintWithItem:projectTittle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self addConstraint:logoCenterX];
    
    //***************************************************************
    
    UIImageView * titleView = [[UIImageView alloc]init];
    titleView.image = [UIImage imageNamed:@"write"];
    titleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:titleView];
    //width
    NSLayoutConstraint * titleViewWidth = [NSLayoutConstraint constraintWithItem:titleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.32 constant:0.0];
    [self addConstraint:titleViewWidth];
    //hight
    NSLayoutConstraint * titleViewHight = [NSLayoutConstraint constraintWithItem:titleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.32 constant:0.0];
    [self addConstraint:titleViewHight];
    
    //位置
    NSLayoutConstraint * titleViewY = [NSLayoutConstraint constraintWithItem:titleView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_backgroundImageView1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self addConstraint:titleViewY];
    NSLayoutConstraint * titleViewX = [NSLayoutConstraint constraintWithItem:titleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self addConstraint:titleViewX];
    
    //头像
    _tXimageView = [[UIImageView alloc]init];
    //_tXimageView.image = [UIImage imageNamed:@"logo_manager"];
    _tXimageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_tXimageView];
    //width
    NSLayoutConstraint * titleWidth = [NSLayoutConstraint constraintWithItem:_tXimageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0.0];
    [self addConstraint:titleWidth];
    //hight
    NSLayoutConstraint * titleHight = [NSLayoutConstraint constraintWithItem:_tXimageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0.0];
    [self addConstraint:titleHight];
    
    //位置
    NSLayoutConstraint * titleY = [NSLayoutConstraint constraintWithItem:_tXimageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_backgroundImageView1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self addConstraint:titleY];
    NSLayoutConstraint * titleCenterX = [NSLayoutConstraint constraintWithItem:_tXimageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self addConstraint:titleCenterX];
    
    
    
    
    //**************************************************************
    //身份标题
    self.idTitle = [Mycontrols creatLabelWithTitle:self.IDMessage andFrame:CGRectMake((screenWidth-100)/2-30, self.frame.size.height-60 , 100, 30)];
    self.idTitle.font = [UIFont systemFontOfSize:16];
    self.idTitle.textColor = [UIColor grayColor];
    [self addSubview:self.idTitle];
    
    //name
    self.idName = [Mycontrols creatLabelWithTitle:self.userName andFrame:CGRectMake((screenWidth-100)/2+40, self.frame.size.height-60 , 100, 30)];
    self.idName.font = [UIFont systemFontOfSize:19];
    self.idName.textColor = [UIColor grayColor];
    [self addSubview:self.idName];
    
    //**************************************************************
    //消息
    self.messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.messageButton setBackgroundImage:[UIImage imageNamed:@"mes(2).png"] forState:UIControlStateNormal];
    self.messageButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.messageButton];
    //width
    NSLayoutConstraint * messageButtonWidth = [NSLayoutConstraint constraintWithItem:self.messageButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.messageButton addConstraint:messageButtonWidth];
    //hight
    NSLayoutConstraint * messageButtonHight = [NSLayoutConstraint constraintWithItem:self.messageButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    [self.messageButton addConstraint:messageButtonHight];
    
    //位置
    NSLayoutConstraint * messageButtonT = [NSLayoutConstraint constraintWithItem:self.messageButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:25];
    [self addConstraint:messageButtonT];
    
    NSLayoutConstraint * messageButtonR = [NSLayoutConstraint constraintWithItem:self.messageButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-25];
    [self addConstraint:messageButtonR];
    
}


@end
