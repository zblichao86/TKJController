//
//  GroundMediaViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroundMediaViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate>
{
    //全部区域箭头方向
    BOOL _quanbuquyuJTFX;
    //起始日期箭头方向
    BOOL _qishiriqiJTFX;
    //结束日期箭头方向
    BOOL _jieshuriqiJTFX;
    
    //全部区域PickerView
    UIPickerView * _quBuQuYuPickerView;
    NSMutableArray * _quBuQuYuPickerViewArray;
    
    //起始时间PickerView
    UIDatePicker * _qiShiShijianPickerView;

    //结束时间PickerView
    UIDatePicker * _jieshuShijianPickerView;

}

//地媒TableView
@property (weak, nonatomic) IBOutlet UITableView *groundMediaListTBV;
//返回按钮
- (IBAction)backProjectList;
//消息按钮
- (IBAction)messageVC;
//-----------------------------------------------------------------------
//全部
@property (weak, nonatomic) IBOutlet UILabel *quanbuLabel;
@property (weak, nonatomic) IBOutlet UIImageView *quanbuImageView;
- (IBAction)quanbuButton;
//-----------------------------------------------------------------------
//进心中
@property (weak, nonatomic) IBOutlet UILabel *jinxingzhongLabel;
@property (weak, nonatomic) IBOutlet UIImageView *jingxinzhongImageViwe;
- (IBAction)jingxingzhongButton;
//-----------------------------------------------------------------------
//已结束
@property (weak, nonatomic) IBOutlet UILabel *yijieshuLabel;
@property (weak, nonatomic) IBOutlet UIImageView *yijieshuImageView;
- (IBAction)yijieshuButton;


//-----------------------------------------------------------------------
//全部区域
@property (weak, nonatomic) IBOutlet UIImageView *quanbuJTImageView;
- (IBAction)quanbuQYButton;
//-----------------------------------------------------------------------
//开始日期
@property (weak, nonatomic) IBOutlet UIImageView *kaishiDateJTImageView;
@property (weak, nonatomic) IBOutlet UILabel *kaishiDateLabel;
- (IBAction)kaishiDateButton;
//-----------------------------------------------------------------------
//结束日期
@property (weak, nonatomic) IBOutlet UIImageView *jieshuDateJTImageView;
@property (weak, nonatomic) IBOutlet UILabel *jieshuDateLabel;
- (IBAction)jieshuDateButton;

//全部区域的PickerView上的View
@property (weak, nonatomic) IBOutlet UIView *dimeiliebiaoView;


@end
