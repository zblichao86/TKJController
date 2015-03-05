//
//  ProjectTableViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ProjectTableViewController.h"
#import "ProjectTableView.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "UIImageView+WebCache.h"
//自定义TabBarViewController
#import "LTTabBarViewController.h"
//自定义ProjectListTableViewCell
#import "ProjectListTableViewCell.h"
//消息按钮
#import "MessageViewController.h"

#import "ProjectListItem.h"

#import "MJRefresh.h"

#import "Mycontrols.h"
#define screenFrame [UIScreen mainScreen].bounds
#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height
@interface ProjectTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //ProjectTableView上半部分View
    ProjectTableView * _projectTV;
    
    //项目列表tableView
    UITableView * _tableView;
    
    //userID
    NSString * _userIDB;
    
    //管理员头像
    NSString * _photoImageViewStr;
}
@end

@implementation ProjectTableViewController

////懒加载项目列表数组
//- (NSMutableArray *)projectListMutableArray
//{
//    if (_projectListMutableArray == nil) {
//        _projectListMutableArray = [[NSMutableArray alloc]init];
//    }
//    return _projectListMutableArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化控件信息
    [self initControll];
    
    //添加topView
    [self topView];
    
    //获取本地存储的登录数据
    [self hqLoginDate];
    
    //获取人员身份信息
    [self statusMessage];
    
    
    //添加UITableView
    [self addTabView];
    
    //1.集成刷新控件
    [self setupRefresh];
    
}
#pragma mark---初始化控件信息
- (void)initControll
{
    //项目列表数组
    _projectListMutableArray = [[NSMutableArray alloc]init];
}
#pragma mark---添加ProjectTableView上半部分View
- (void)topView
{
    _projectTV = [[ProjectTableView alloc]init];
    [_projectTV.messageButton addTarget:self action:@selector(messageButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    _projectTV.tXimageView.image = [UIImage imageNamed:@"logo_manager"];

    [self.view addSubview:_projectTV];
}
- (void)addTabView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, screenHeight*2/5-20, screenWidth, screenHeight*3/5+20) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor colorWithRed:250.0/255 green:251.0/255 blue:255.0/255 alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //Post获取项目信息
    [self postProjectListMessage];
}

#pragma mark tableView 协议
#pragma mark---多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_projectListMutableArray.count)
    {
        return _projectListMutableArray.count;
    }
    return 0;
}
#pragma mark---每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---每行cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    ProjectListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ProjectListTableViewCell" owner:self options:nil]lastObject];
    }
    //取消cell点击效果
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //添加向右箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark---每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
#pragma mark---点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        ProjectListItem * projectListItem = _projectListMutableArray[indexPath.section];
        NSLog(@"projectListItem.projectId-----------------%@",projectListItem.projectId);
        //存储点击信息
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString * pathplist = [path stringByAppendingPathComponent:@"projectID.plist"];
        NSDictionary * projectID = @{@"projectID":[NSString stringWithFormat:@"%@",projectListItem.projectId]};
        [projectID writeToFile:pathplist atomically:YES];
        
        LTTabBarViewController * lTTBVC = [[LTTabBarViewController alloc]init];
        [self.navigationController pushViewController:lTTBVC animated:YES];
    }
    @catch (NSException *exception) {
        NSLog(@"exception点击cell---%@",exception);
    }
    @finally {
        NSLog(@"");
    }
}

#pragma mark---Post获取项目信息
- (void)postProjectListMessage
{
    
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (_userIDB.length)
    {
        params[@"userid"] = _userIDB;
    }
    params[@"from"] = @"0";
    params[@"num"] = @"10";
    
    NSString * URLLogin = [NSString stringWithFormat:@"%@/Project/getProjectList",LTDataUrl];
    
    [mgr POST:URLLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"getProjectListPOST成功=%@",responseObject);
        if (responseObject)
        {
            NSString * message = [responseObject objectForKey:@"message"];
            int code = [[responseObject objectForKey:@"code"]intValue];
            NSArray * dataArray = [responseObject objectForKey:@"data"];
            if (code == 0)
            {
                for (NSDictionary * dict in dataArray)
                {
                    ProjectListItem * projectListItem = [[ProjectListItem alloc]init];
                    
                    projectListItem.projectId = [dict objectForKey:@"projectId"];
                    projectListItem.projectName = [dict objectForKey:@"projectName"];
                    projectListItem.contractId = [dict objectForKey:@"contractId"];
                    projectListItem.cityid = [dict objectForKey:@"cityid"];
                    projectListItem.region = [dict objectForKey:@"region"];
                    projectListItem.city = [dict objectForKey:@"city"];
                    projectListItem.taskNum = [dict objectForKey:@"taskNum"];
                    projectListItem.mediumNum = [dict objectForKey:@"mediumNum"];
                    
                    [_projectListMutableArray addObject:projectListItem];
                    
                }
                NSLog(@"_projectListMutableArray个数---%d",_projectListMutableArray.count);
            }
            else
            {
                if (message.length)
                {
                    [MBProgressHUD showError:message];
                }
            }
            
            [_tableView reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD showError:@"连接失败，请检查网络连接"];
        NSLog(@"getProjectListPOST失败=%@",error);
    }];

}


#pragma mark---视图即将显示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //影藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
}
#pragma mark---messageButtonClicked
- (void)messageButtonClicked
{
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---获取登录存储的信息
- (void)hqLoginDate
{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * pathlogin = [path stringByAppendingPathComponent:@"loginDate.plist"];
    
    NSDictionary * loginDataDic = [NSDictionary dictionaryWithContentsOfFile:pathlogin];

    NSLog(@"dictLogin===%@",loginDataDic);
    
    
    //赋值
    _userIDB = [loginDataDic objectForKey:@"ID"];
    _projectTV.idName.text = [loginDataDic objectForKey:@"userName"];
    
    _photoImageViewStr = [loginDataDic objectForKey:@"headImage"];
}

#pragma mark---登录成功获取人员身份信息
- (void)statusMessage
{
    [MBProgressHUD showMessage:@"获取身份中。。。"];
    
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    if (_userIDB.length)
    {
        params[@"userid"] = _userIDB;
    }
    else
    {
        params[@"userid"] = @"";
    }
    NSLog(@"userid---%@",_userIDB);
    
    NSString * URLLogin = [NSString stringWithFormat:@"%@/Project/getPersonRole",LTDataUrl];
    
    [mgr POST:URLLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"身份信息POST成功=%@",responseObject);
        if (responseObject)
        {
            NSString * message = [responseObject objectForKey:@"message"];
            int code = [[responseObject objectForKey:@"code"]integerValue];
            if (code == 0)
            {
                int date = [[responseObject objectForKey:@"date"]integerValue];
                @try {
                    switch (date) {
                        case 0:
                            _projectTV.idTitle.text = @"项目经理:";
                            break;
                        case 1:
                            _projectTV.idTitle.text = @"项目总监:";
                            break;
                        case 2:
                            _projectTV.idTitle.text = @"励拓员工:";
                            break;
                        case 3:
                            _projectTV.idTitle.text = @"开发商:";
                            break;
                        case 5:
                            _projectTV.idTitle.text = @"未知:";
                            break;
                        default:
                            break;
                            
                            
                            
                    }

                }
                @catch (NSException *exception) {
                    NSLog(@"exception身份信息POST---%@",exception);
                }
                @finally {
                    [MBProgressHUD hideHUD];
                    NSLog(@"");
                }
            }
            else
            {
                if (message.length)
                {
                    [MBProgressHUD hideHUD];
                    [MBProgressHUD showError:message];
                }
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];
        NSLog(@"身份信息POST失败=%@",error);
    }];
    
}
- (void)viewDidAppear:(BOOL)animated
{
//    NSLog(@"_photoImageViewStr---%@",_photoImageViewStr);
//    [_projectTV.tXimageView setImageWithURL:[NSURL URLWithString:@"_photoImageViewStr"] placeholderImage:[UIImage imageNamed:@""]];
}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    //    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // dateKey用于存储刷新时间，可以保证不同界面拥有不同的刷新时间
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing) dateKey:@"table"];
    //自动刷新(一进入程序就下拉刷新)
    [_tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    _tableView.headerPullToRefreshText = @"下拉刷新项目列表";
    _tableView.headerReleaseToRefreshText = @"松开马上刷新项目列表";
    _tableView.headerRefreshingText = @"项目列表刷新中";
    
    _tableView.footerPullToRefreshText = @"上拉加载更多项目列表";
    _tableView.footerReleaseToRefreshText = @"松开加载更多项目列表";
    _tableView.footerRefreshingText = @"项目列表加载中";
}
- (void)headerRereshing
{
    // 刷新表格
    [_tableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView headerEndRefreshing];
}
- (void)footerRereshing
{
    // 刷新表格
    [_tableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [_tableView footerEndRefreshing];
}

@end
