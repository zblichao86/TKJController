//
//  TaskViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TaskViewController.h"
#import "ListTableViewCell.h"
#import "MessageViewController.h"

#import "TaskDetailViewController.h"
#import "TaskSummaryViewController.h"
#import "MessageSenderViewController.h"

#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "MJRefresh.h"

@interface TaskViewController ()

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化设置参数
    [self initSettingArgument];
    //创建PickerView
    [self setupTaskPickerView];
    
    self.ListTableView.delegate = self;
    self.ListTableView.dataSource = self;

    //进入就加载全部
    [self loadData:@"" dateZ:@"" taskState:@"全部" from:@"0" num:@"9"];
    
    //1.集成刷新控件
    [self setupRefresh];
}
#pragma mark---ListTableView协议
#pragma mark---tableView组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
#pragma mark---tableView每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---tableViewCell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    ListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil]lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //任务总结
    [cell.TaskZongjieButton addTarget:self action:@selector(TaskZongjieButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    //消息发布
    [cell.MessageFaBuButton addTarget:self action:@selector(MessageFaBuButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark---tableViewCell点击按钮
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TaskDetailViewController * taskDetailVC = [[TaskDetailViewController alloc]init];
    taskDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:taskDetailVC animated:YES];
}
#pragma mark---tableViewCell行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark---tableViewCell头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---tableViewCell尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
#pragma mark---内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark---返回按钮
- (IBAction)backProjectList {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark---消息视图控制器按钮
- (IBAction)messageVC {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

#pragma mark---任务总结按钮
- (void)TaskZongjieButtonClicked:(id)sender
{
    TaskSummaryViewController * taskSVC = [[TaskSummaryViewController alloc]init];
    [self.navigationController pushViewController:taskSVC animated:YES];
}
#pragma mark---消息发布按钮
- (void)MessageFaBuButtonClicked:(id)sender
{
    MessageSenderViewController * messageSVC = [[MessageSenderViewController alloc]init];
    [self.navigationController pushViewController:messageSVC animated:YES];
}
#pragma mark---点击全部按钮
- (IBAction)qiehuanButton1 {
    NSLog(@"点击全部");
    
    self.quanbuLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.changeTiao1ImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    self.jingxingzhongLabel.textColor = [UIColor blackColor];
    self.changeTiao2ImageView.image = [UIImage imageNamed:@""];
    
    self.yijieshuLabel.textColor = [UIColor blackColor];
    self.qiehuanTiao3Image.image = [UIImage imageNamed:@""];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.ListTableView headerBeginRefreshing];
    
}
#pragma mark---点击进心中按钮
- (IBAction)qiehuanButton2 {
    NSLog(@"点击进心中");
    
    self.quanbuLabel.textColor = [UIColor blackColor];
    self.changeTiao1ImageView.image = [UIImage imageNamed:@""];
    
    self.jingxingzhongLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.changeTiao2ImageView.image = [UIImage imageNamed:@"4-change.png"];
    
    self.yijieshuLabel.textColor = [UIColor blackColor];
    self.qiehuanTiao3Image.image = [UIImage imageNamed:@""];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.ListTableView headerBeginRefreshing];
}
#pragma mark---点击已结束按钮
- (IBAction)qianhuanButton3 {
    NSLog(@"点击已结束");
    
    self.quanbuLabel.textColor = [UIColor blackColor];
    self.changeTiao1ImageView.image = [UIImage imageNamed:@""];
    
    self.jingxingzhongLabel.textColor = [UIColor blackColor];
    self.changeTiao2ImageView.image = [UIImage imageNamed:@""];
    
    self.yijieshuLabel.textColor = [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:0.0/255.0 alpha:1];
    self.qiehuanTiao3Image.image = [UIImage imageNamed:@"4-change.png"];
    
    //自动刷新(一进入程序就下拉刷新)
    [self.ListTableView headerBeginRefreshing];
}
#pragma mark---点击起始日期按钮
- (IBAction)qishiriqiButton {
    NSLog(@"点击起始日期按钮");
    
    _jieshuriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.jieshuJtImageView.transform = CGAffineTransformMakeRotation(0);
        _jieshuShijianDatePicker.frame = CGRectMake(0, -300, screenWidth, 180);
        
    }];
    
    //起始箭头方向
    CGFloat jiaodu;
    CGFloat pVweizhi;
    if (_qishiriqiJTFX == NO)
    {
        jiaodu = M_PI;
        _qishiriqiJTFX = YES;
        pVweizhi = 0;
    }
    else if (_qishiriqiJTFX == YES)
    {
        jiaodu = 0;
        _qishiriqiJTFX = NO;
        pVweizhi = -300;
    }
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.qishiJTImage.transform = CGAffineTransformMakeRotation(jiaodu);
        _qiShiShijianDatePicker.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
    }];
    
}
#pragma mark---点击结束日期按钮
- (IBAction)jieshuButton {
    NSLog(@"点击结束日期按钮");
    
    _qishiriqiJTFX = NO;
    [UIView animateWithDuration:0.5 animations:^(void) {
        
        self.qishiJTImage.transform = CGAffineTransformMakeRotation(0);
        _qiShiShijianDatePicker.frame = CGRectMake(0, -300, screenWidth, 180);
        
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
        
        self.jieshuJtImageView.transform = CGAffineTransformMakeRotation(jiaodu);
        _jieshuShijianDatePicker.frame = CGRectMake(0, pVweizhi, screenWidth, 180);
        
    }];
}
#pragma mark---创建pickerView
- (void)setupTaskPickerView
{
    //起始时间PickerView
    _qiShiShijianDatePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    [_qiShiShijianDatePicker setDatePickerMode:UIDatePickerModeDate];
    _qiShiShijianDatePicker.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _qiShiShijianDatePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"M/d/yyyy h:m a"];
    NSString *stringTime1 = @"2/1/2013 3:4 am";
    NSString *stringTime2 = @"2/1/2030 3:4 am";
    NSDate *dateTime1 = [formatter dateFromString:stringTime1];
    NSDate *dateTime2 = [formatter dateFromString:stringTime2];
    
    _qiShiShijianDatePicker.minimumDate = dateTime1;
    _qiShiShijianDatePicker.maximumDate = dateTime2;
    
    
    [_qiShiShijianDatePicker addTarget:self action:@selector(qiShiShijianDatePickerChange) forControlEvents:UIControlEventValueChanged];
    [self.bjView addSubview:_qiShiShijianDatePicker];
    
    //结束时间PickerView
    _jieshuShijianDatePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, -300, screenWidth, 180)];
    [_jieshuShijianDatePicker setDatePickerMode:UIDatePickerModeDate];
    _jieshuShijianDatePicker.backgroundColor = [UIColor colorWithRed:232.0/255 green:233.0/255 blue:232.0/255 alpha:1];
    _jieshuShijianDatePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat : @"M/d/yyyy h:m a"];
    NSString *stringTime11 = @"2/1/2013 3:4 am";
    NSString *stringTime21 = @"2/1/2030 3:4 am";
    NSDate *dateTime11 = [formatter dateFromString:stringTime11];
    NSDate *dateTime21 = [formatter dateFromString:stringTime21];
    
    _jieshuShijianDatePicker.minimumDate = dateTime11;
    _jieshuShijianDatePicker.maximumDate = dateTime21;
    
    
    [_jieshuShijianDatePicker addTarget:self action:@selector(jieshuShijianDatePickerPickerChange) forControlEvents:UIControlEventValueChanged];
    [self.bjView addSubview:_jieshuShijianDatePicker];
    
}

- (void)qiShiShijianDatePickerChange
{
    
}
- (void)jieshuShijianDatePickerPickerChange
{
    
}


#pragma mark---筛选按钮
- (IBAction)shaixuanButton {
    
}

#pragma mark---初始化设置参数
- (void)initSettingArgument
{
    //起始结束箭头参数属性
    _qishiriqiJTFX = NO;
    _jieshuriqiJTFX = NO;
    
    //获取本地存储数据userID
    NSString * path1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * pathlogin1 = [path1 stringByAppendingPathComponent:@"loginDate.plist"];
    NSDictionary * loginDataDic1 = [NSDictionary dictionaryWithContentsOfFile:pathlogin1];
    _userID = [loginDataDic1 objectForKey:@"ID"];
    
    //获取存数的projectID
    NSString * path2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * pathlogin2 = [path2 stringByAppendingPathComponent:@"projectID.plist"];
    NSDictionary * projectIDDic2 = [NSDictionary dictionaryWithContentsOfFile:pathlogin2];
    _projectID = [projectIDDic2 objectForKey:@"projectID"];
}


#pragma mark---数据加载Post
- (void)loadData:(NSString *)dateA dateZ:(NSString *)dateZ taskState:(NSString *)taskState from:(NSString *)from num:(NSString *)num
{
    //[MBProgressHUD showMessage:@"数据加载中。。。"];
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (_userID.length)
    {
        params[@"userid"] = _userID;
    }
    if (_projectID.length)
    {
        params[@"projectid"] = _projectID;
    }
    params[@"dateA"] = dateA;
    params[@"dateZ"] = dateZ;
    params[@"taskState"] = taskState;
    params[@"from"] = from;
    params[@"num"] = num;
    
    NSString * URLLogin = [NSString stringWithFormat:@"%@/Project/getProjectTask",LTDataUrl];
    
    [mgr POST:URLLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"任务数据POST成功=%@",responseObject);
        if (responseObject)
        {
            NSString * message = [responseObject objectForKey:@"message"];
            int code = [[responseObject objectForKey:@"code"]intValue];
            NSDictionary * data = [responseObject objectForKey:@"data"];
            if (code == 0)
            {
                
                [self.ListTableView reloadData];
                //[MBProgressHUD hideHUD];
            }
            else
            {
                if (message.length)
                {
                    [MBProgressHUD hideHUD];
                    //[MBProgressHUD showError:message];
                }
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[MBProgressHUD hideHUD];
        NSLog(@"任务数据失败=%@",error);
    }];

}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    //    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // dateKey用于存储刷新时间，可以保证不同界面拥有不同的刷新时间
    [self.ListTableView addHeaderWithTarget:self action:@selector(headerRereshing) dateKey:@"table"];
    //自动刷新(一进入程序就下拉刷新)
    [self.ListTableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.ListTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.ListTableView.headerPullToRefreshText = @"下拉刷新任务列表";
    self.ListTableView.headerReleaseToRefreshText = @"松开马上刷新任务列表";
    self.ListTableView.headerRefreshingText = @"任务列表刷新中";
    
    self.ListTableView.footerPullToRefreshText = @"上拉加载更多任务列表";
    self.ListTableView.footerReleaseToRefreshText = @"松开加载更多任务列表";
    self.ListTableView.footerRefreshingText = @"任务列表加载中";
}
- (void)headerRereshing
{
    // 刷新表格
    [self.ListTableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.ListTableView headerEndRefreshing];
}
- (void)footerRereshing
{
    // 刷新表格
    [self.ListTableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [self.ListTableView footerEndRefreshing];
}


@end
