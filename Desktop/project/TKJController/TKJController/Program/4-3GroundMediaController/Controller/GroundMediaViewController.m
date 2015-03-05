//
//  GroundMediaViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "GroundMediaViewController.h"
#import "GroundMediaListTableViewCell.h"
#import "GroundMediaListDetailViewController.h"
#import "MessageViewController.h"

#import "MJRefresh.h"

@interface GroundMediaViewController ()

@end

@implementation GroundMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化设置参数
    [self initSettingArgument];
    
    //创建PickerView
    [self setupPickerView];
    
    self.groundMediaListTBV.dataSource = self;
    self.groundMediaListTBV.delegate = self;
    
    //1.集成刷新控件
    [self setupRefresh];
}

#pragma mark ListTableView协议
#pragma mark---每组多少航
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
#pragma mark---多少组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    GroundMediaListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroundMediaListTableViewCell" owner:self options:nil]lastObject];
    }
    //取消cell点击效果
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //cell箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //设置圆头像
    cell.shopImaeView.layer.cornerRadius = 35;
    //超过的圆角的不显示
    cell.shopImaeView.layer.masksToBounds = YES;
    
    
    return cell;
}
#pragma mark---点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroundMediaListDetailViewController * groundMediaListDetailVC = [[GroundMediaListDetailViewController alloc]init];
    //隐藏底部TaBBar
    groundMediaListDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:groundMediaListDetailVC animated:YES];
    
}
#pragma mark---每行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark---每组头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---每组尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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

#pragma mark---点击全部按钮
- (IBAction)quanbuButton {
    self.quanbuLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];;
    self.quanbuImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    self.jinxingzhongLabel.textColor = [UIColor blackColor];
    self.jingxinzhongImageViwe.image = [UIImage imageNamed:@""];
    
    self.yijieshuLabel.textColor = [UIColor blackColor];
    self.yijieshuImageView.image = [UIImage imageNamed:@""];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.groundMediaListTBV headerBeginRefreshing];
}
#pragma mark---点击进心中按钮
- (IBAction)jingxingzhongButton {
    self.quanbuLabel.textColor = [UIColor blackColor];
    self.quanbuImageView.image = [UIImage imageNamed:@""];
    
    self.jinxingzhongLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.jingxinzhongImageViwe.image = [UIImage imageNamed:@"4-change.png"];
    
    self.yijieshuLabel.textColor = [UIColor blackColor];
    self.yijieshuImageView.image = [UIImage imageNamed:@""];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.groundMediaListTBV headerBeginRefreshing];
}
#pragma mark---点击已结束按钮
- (IBAction)yijieshuButton {
    self.quanbuLabel.textColor = [UIColor blackColor];
    self.quanbuImageView.image = [UIImage imageNamed:@""];
    
    self.jinxingzhongLabel.textColor = [UIColor blackColor];
    self.jingxinzhongImageViwe.image = [UIImage imageNamed:@""];
    
    self.yijieshuLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.yijieshuImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.groundMediaListTBV headerBeginRefreshing];
}
#pragma mark---全部区域
- (IBAction)quanbuQYButton {
    
    _jieshuriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jieshuDateJTImageView.transform = CGAffineTransformMakeRotation(0);
        _jieshuShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];
    
    _qishiriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.kaishiDateJTImageView.transform = CGAffineTransformMakeRotation(0);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
    }];
    
    //全部区域箭头方向
    CGFloat jiaodu;
    CGFloat pVweizhi;
    if (_quanbuquyuJTFX == NO)
    {
        jiaodu = M_PI;
        pVweizhi = 0;
        _quanbuquyuJTFX = YES;
    }
    else if (_quanbuquyuJTFX == YES)
    {
        jiaodu = 0;
        pVweizhi = -300;
        _quanbuquyuJTFX = NO;
    }
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.quanbuJTImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        _quBuQuYuPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
        
    }];

}
#pragma mark---起始日期
- (IBAction)kaishiDateButton {
    
    _jieshuriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jieshuDateJTImageView.transform = CGAffineTransformMakeRotation(0);
        _jieshuShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];
    
    _quanbuquyuJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.quanbuJTImageView.transform = CGAffineTransformMakeRotation(0);
        _quBuQuYuPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
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
        
        self.kaishiDateJTImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
    }];

}
#pragma mark---结束日期
- (IBAction)jieshuDateButton {
    
    _qishiriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.kaishiDateJTImageView.transform = CGAffineTransformMakeRotation(0);
        
        _qiShiShijianPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
    }];
    _quanbuquyuJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.quanbuJTImageView.transform = CGAffineTransformMakeRotation(0);
        _quBuQuYuPickerView.frame = CGRectMake(0, -300, screenWidth, 180);
        
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
        
        self.jieshuDateJTImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        _jieshuShijianPickerView.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
        
    }];

}
#pragma mark---初始化设置参数
- (void)initSettingArgument
{
    //全部区域起始结束箭头参数属性
    _quanbuquyuJTFX = NO;
    _qishiriqiJTFX = NO;
    _jieshuriqiJTFX = NO;
}
#pragma mark---创建pickerView
- (void)setupPickerView
{
    //全部区域PickerView
    _quBuQuYuPickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    _quBuQuYuPickerView.showsSelectionIndicator = YES;
    _quBuQuYuPickerView.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _quBuQuYuPickerView.delegate = self;
    _quBuQuYuPickerView.dataSource = self;
    [self.dimeiliebiaoView addSubview:_quBuQuYuPickerView];
    
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
    [self.dimeiliebiaoView addSubview:_qiShiShijianPickerView];
    
    
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
    
    [_jieshuShijianPickerView addTarget:self action:@selector(qiShiShijiandateChange) forControlEvents:UIControlEventValueChanged];
    [self.dimeiliebiaoView addSubview:_jieshuShijianPickerView];
    
}
#pragma mark-起始日期时间选择
- (void)qiShiShijiandateChange
{
    
    NSLog(@"---qiShiShijiandateChange---%@",_qiShiShijianPickerView.date);
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
    return @"上海";
    
}

#pragma mark-设置下方的数据刷新
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    //    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // dateKey用于存储刷新时间，可以保证不同界面拥有不同的刷新时间
    [self.groundMediaListTBV addHeaderWithTarget:self action:@selector(headerRereshing) dateKey:@"table"];
    //自动刷新(一进入程序就下拉刷新)
    [self.groundMediaListTBV headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.groundMediaListTBV addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.groundMediaListTBV.headerPullToRefreshText = @"下拉刷新地媒列表";
    self.groundMediaListTBV.headerReleaseToRefreshText = @"松开马上刷新地媒列表";
    self.groundMediaListTBV.headerRefreshingText = @"地媒列表刷新中";
    
    self.groundMediaListTBV.footerPullToRefreshText = @"上拉加载更多地媒列表";
    self.groundMediaListTBV.footerReleaseToRefreshText = @"松开加载更多地媒列表";
    self.groundMediaListTBV.footerRefreshingText = @"地媒列表加载中";
}
- (void)headerRereshing
{
    // 刷新表格
    [self.groundMediaListTBV reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.groundMediaListTBV headerEndRefreshing];
}
- (void)footerRereshing
{
    // 刷新表格
    [self.groundMediaListTBV reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.groundMediaListTBV footerEndRefreshing];
}


@end
