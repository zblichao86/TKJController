//
//  StatisticsViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    //拓客人员箭头方向
    BOOL _tkryJTFX;
    //起始日期箭头方向
    BOOL _qishiriqiJTFX;
    //结束日期箭头方向
    BOOL _jieshuriqiJTFX;
    
    //拓客人员PickerView
    UIPickerView * _tkryPickerView;
    NSMutableArray * _tkryPickerViewArray;
    
    //起始时间PickerView
    UIDatePicker * _qiShiShijianPickerView;
    
    //结束时间PickerView
    UIDatePicker * _jieshuShijianPickerView;
}
//返回按钮
- (IBAction)backProjectList;
//消息按钮
- (IBAction)messageVC;
//---------------------------------------------------------------
//专员
@property (weak, nonatomic) IBOutlet UILabel *zhuanyuanLabel;
@property (weak, nonatomic) IBOutlet UIImageView *zhuanyuanImageView;
- (IBAction)zhuanyuanButton;
//---------------------------------------------------------------
//地媒成绩
@property (weak, nonatomic) IBOutlet UILabel *dimeiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dimeiImageView;
- (IBAction)dimeiButton;
//---------------------------------------------------------------
//拓客方式
@property (weak, nonatomic) IBOutlet UILabel *tuokeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tuokeImageView;
- (IBAction)tuokeButton;
//---------------------------------------------------------------
//选择拓客专员
@property (weak, nonatomic) IBOutlet UILabel *tkzyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tkzyJTImageView;
- (IBAction)tkzyButton;
//---------------------------------------------------------------
//起始日期
@property (weak, nonatomic) IBOutlet UILabel *qsrqLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qsrqJTImageView;
- (IBAction)qsrqButtton;
//---------------------------------------------------------------
//结束日期
@property (weak, nonatomic) IBOutlet UILabel *jsrqLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jsrqJTimageView;
- (IBAction)jsrqButton;

@property (weak, nonatomic) IBOutlet UIView *bjView;


@end
