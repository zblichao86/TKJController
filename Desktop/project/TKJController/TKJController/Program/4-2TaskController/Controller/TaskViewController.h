//
//  TaskViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    //起始日期箭头方向
    BOOL _qishiriqiJTFX;
    //结束日期箭头方向
    BOOL _jieshuriqiJTFX;
    
    //userID
    NSString * _userID;
    //projectID
    NSString * _projectID;
    //dateA
    NSString * _dateA;
    //dateZ
    NSString * _dateZ;
    //taskState
    NSString * _taskState;
    //from
    NSString * _from;
    //num
    NSString * _num;

    
    //起始时间PickerView
    UIDatePicker * _qiShiShijianDatePicker;
    
    //结束时间PickerView
    UIDatePicker * _jieshuShijianDatePicker;
    
}

//任务列表TableView
@property (weak, nonatomic) IBOutlet UITableView *ListTableView;
//返回按钮
- (IBAction)backProjectList;
//消息按钮
- (IBAction)messageVC;

//------------------------------------------------------------------------
//全部Label
@property (weak, nonatomic) IBOutlet UILabel *quanbuLabel;
//切换条1ImageView
@property (weak, nonatomic) IBOutlet UIImageView *changeTiao1ImageView;
//切换button1
- (IBAction)qiehuanButton1;
//------------------------------------------------------------------------
//进行中Label
@property (weak, nonatomic) IBOutlet UILabel *jingxingzhongLabel;
//切换条2ImageView
@property (weak, nonatomic) IBOutlet UIImageView *changeTiao2ImageView;
//切换button1
- (IBAction)qiehuanButton2;
//------------------------------------------------------------------------
//已结束Label
@property (weak, nonatomic) IBOutlet UILabel *yijieshuLabel;
//切换条3ImageView
@property (weak, nonatomic) IBOutlet UIImageView *qiehuanTiao3Image;
- (IBAction)qianhuanButton3;
//------------------------------------------------------------------------

//起始日期
@property (weak, nonatomic) IBOutlet UILabel *qishiriqi;
@property (weak, nonatomic) IBOutlet UIImageView *qishiJTImage;
- (IBAction)qishiriqiButton;
//------------------------------------------------------------------------
//结束日期
@property (weak, nonatomic) IBOutlet UILabel *jieshuri;
@property (weak, nonatomic) IBOutlet UIImageView *jieshuJtImageView;
- (IBAction)jieshuButton;
//------------------------------------------------------------------------
//筛选按钮
- (IBAction)shaixuanButton;
//方式选择器
@property (weak, nonatomic) IBOutlet UIView *bjView;

@end
