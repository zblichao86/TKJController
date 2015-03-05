//
//  StatisticsViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "StatisticsViewController.h"
#import "MessageViewController.h"
@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化设置参数
    [self initSettingArgument];
    
    //创建PickerView
    [self setupStatisPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark---返回按钮
- (IBAction)backProjectList {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark---消息按钮
- (IBAction)messageVC {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
#pragma mark---专员成绩
- (IBAction)zhuanyuanButton {
    self.zhuanyuanLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.zhuanyuanImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    self.dimeiLabel.textColor = [UIColor blackColor];
    self.dimeiImageView.image = [UIImage imageNamed:@""];
    
    self.tuokeLabel.textColor = [UIColor blackColor];
    self.tuokeImageView.image = [UIImage imageNamed:@""];
}
#pragma mark---地媒成绩
- (IBAction)dimeiButton {
    self.zhuanyuanLabel.textColor = [UIColor blackColor];
    self.zhuanyuanImageView.image = [UIImage imageNamed:@""];
    
    self.dimeiLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.dimeiImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    self.tuokeLabel.textColor = [UIColor blackColor];
    self.tuokeImageView.image = [UIImage imageNamed:@""];
}
#pragma mark---拓客成绩
- (IBAction)tuokeButton {
    self.zhuanyuanLabel.textColor = [UIColor blackColor];
    self.zhuanyuanImageView.image = [UIImage imageNamed:@""];
    
    self.dimeiLabel.textColor = [UIColor blackColor];
    self.dimeiImageView.image = [UIImage imageNamed:@""];
    
    self.tuokeLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.tuokeImageView.image = [UIImage imageNamed:@"4-change.png"];
}
#pragma mark---拓客专员按钮
- (IBAction)tkzyButton {
    _jieshuriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jsrqJTimageView.transform = CGAffineTransformMakeRotation(0);
        _jieshuShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];
    _qishiriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.qsrqJTImageView.transform = CGAffineTransformMakeRotation(0);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
    }];

    
    //全部区域箭头方向
    CGFloat jiaodu;
    CGFloat pVweizhi;
    if (_tkryJTFX == NO)
    {
        jiaodu = M_PI;
        pVweizhi = 0;
        _tkryJTFX = YES;
    }
    else if (_tkryJTFX == YES)
    {
        jiaodu = 0;
        pVweizhi = -300;
        _tkryJTFX = NO;
    }
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.tkzyJTImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        _tkryPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
        
    }];
}
#pragma mark---起始日期按钮
- (IBAction)qsrqButtton {
    _jieshuriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jsrqJTimageView.transform = CGAffineTransformMakeRotation(0);
        _jieshuShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];
    
    _tkryJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.tkzyJTImageView.transform = CGAffineTransformMakeRotation(0);
        _tkryPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];

    
    //起始箭头方向
    CGFloat jiaodu;
    CGFloat pVweizhi;
    if (_qishiriqiJTFX == NO)
    {
        jiaodu = M_PI;
        pVweizhi = 0;
        _qishiriqiJTFX = YES;
    }
    else if (_qishiriqiJTFX == YES)
    {
        jiaodu = 0;
        pVweizhi = -300;
        _qishiriqiJTFX = NO;
    }
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.qsrqJTImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
    }];

    
}
#pragma mark---结束日期按钮
- (IBAction)jsrqButton {
    
    _qishiriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.qsrqJTImageView.transform = CGAffineTransformMakeRotation(0);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
    }];
    _tkryJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.tkzyJTImageView.transform = CGAffineTransformMakeRotation(0);
        _tkryPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];

    
    //结束箭头方向
    CGFloat jiaodu;
    CGFloat pVweizhi;
    if (_jieshuriqiJTFX == NO)
    {
        jiaodu = M_PI;
        _jieshuriqiJTFX = YES;
        pVweizhi = 0;
    }
    else if (_jieshuriqiJTFX == YES)
    {
        jiaodu = 0;
        _jieshuriqiJTFX = NO;
        pVweizhi = -300;
    }
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jsrqJTimageView.transform = CGAffineTransformMakeRotation(jiaodu);
        _jieshuShijianPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
        
    }];

}
#pragma mark---创建pickerView
- (void)setupStatisPickerView
{
    //拓客人员PickerView
    _tkryPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    _tkryPickerView.showsSelectionIndicator = YES;
    _tkryPickerView.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _tkryPickerView.delegate = self;
    _tkryPickerView.dataSource = self;
    [self.bjView addSubview:_tkryPickerView];
    
    
    //起始时间PickerView
    _qiShiShijianPickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    [_qiShiShijianPickerView setDatePickerMode:UIDatePickerModeDate];
    _qiShiShijianPickerView.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _qiShiShijianPickerView.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"M/d/yyyy h:m a"];
    NSString *stringTime1 = @"2/1/2013 3:4 am";
    NSString *stringTime2 = @"2/1/2030 3:4 am";
    NSDate *dateTime1 = [formatter dateFromString:stringTime1];
    NSDate *dateTime2 = [formatter dateFromString:stringTime2];
    
    _qiShiShijianPickerView.minimumDate = dateTime1;
    _qiShiShijianPickerView.maximumDate = dateTime2;
    
    [_qiShiShijianPickerView addTarget:self action:@selector(qiShiShijiandateChange) forControlEvents:UIControlEventValueChanged];
    [self.bjView addSubview:_qiShiShijianPickerView];
    
    
    //结束时间PickerView
    _jieshuShijianPickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    [_jieshuShijianPickerView setDatePickerMode:UIDatePickerModeDate];
    _jieshuShijianPickerView.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _jieshuShijianPickerView.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat : @"M/d/yyyy h:m a"];
    NSString *stringTime11 = @"2/1/2013 3:4 am";
    NSString *stringTime21 = @"2/1/2030 3:4 am";
    NSDate *dateTime11 = [formatter dateFromString:stringTime11];
    NSDate *dateTime21 = [formatter dateFromString:stringTime21];
    
    _jieshuShijianPickerView.minimumDate = dateTime11;
    _jieshuShijianPickerView.maximumDate = dateTime21;
    
    [_jieshuShijianPickerView addTarget:self action:@selector(jieshuShijiandateChange) forControlEvents:UIControlEventValueChanged];
    [self.bjView addSubview:_jieshuShijianPickerView];
}
- (void)qiShiShijiandateChange
{
    
}
- (void)jieshuShijiandateChange
{
    
}
#pragma mark---pickerView协议
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//每列对应多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 20;
}

//每列每行对应显示的数据是什么
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"张三";
    
}

#pragma mark-设置下方的数据刷新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}
#pragma mark---初始化设置参数
- (void)initSettingArgument
{
    _tkryJTFX = NO;
    _qishiriqiJTFX = NO;
    _jieshuriqiJTFX = NO;
}

@end
