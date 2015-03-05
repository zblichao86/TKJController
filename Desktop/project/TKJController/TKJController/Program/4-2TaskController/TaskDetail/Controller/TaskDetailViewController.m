//
//  TaskDetailViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "TKXQTableViewCell.h"
#import "CBXQTableViewCell.h"
#import "CYRYTableViewCell.h"

#import "MessageViewController.h"
#import "UserDetailViewController.h"

#import "ACETelPrompt.h"

#import "RMViewController.h"
#import "PlaceMapViewController.h"

@interface TaskDetailViewController ()

@end

@implementation TaskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailTableView.delegate = self;
    self.detailTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
#pragma mark---返回按钮
- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark tableView 协议
#pragma mark---多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark---每组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"拓客详情";
            break;
        case 1:
            return @"成本详情";
            break;
        case 2:
            return @"参与人员";
            break;
            
        default:
            break;
    }
    return @"";
}
#pragma mark---每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 10;
    }
    return 1;
}
#pragma mark---每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        TKXQTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"TKXQTableViewCell" owner:self options:nil]lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        CBXQTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"CBXQTableViewCell" owner:self options:nil]lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    else if (indexPath.section == 2)
    {
        static NSString * cellID = @"cellID";
        CYRYTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CYRYTableViewCell" owner:self options:nil]lastObject];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        //专员详情按钮
        [cell.userDetailButon addTarget:self action:@selector(userDetailButonClicked:) forControlEvents:UIControlEventTouchUpInside];
        //拨打电话按钮
        [cell.playPhoneButton addTarget:self action:@selector(playPhoneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _userPhoneStr = cell.userPhoneLabel.text;
        
        return cell;
    }
    
    return nil;
}
#pragma mark---每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        return 60;
    }
    return 120;
}
#pragma mark---每组头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
#pragma mark---每组cell尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

#pragma mark---专员详情按钮
- (void)userDetailButonClicked:(id)sender
{
    UserDetailViewController * userDVC = [[UserDetailViewController alloc]init];
    [self.navigationController pushViewController:userDVC animated:YES];
}
#pragma mark---拨打电话按钮
- (void)playPhoneButtonClicked:(id)sender
{
    [ACETelPrompt callPhoneNumber:_userPhoneStr
                             call:^(NSTimeInterval duration) {
                                 NSLog(@"User made a call of %.1f seconds", duration);
                                 
                             } cancel:^{
                                 NSLog(@"User cancelled the call");
                             }];
}
#pragma mark---消息按钮
- (IBAction)messageButton {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

#pragma mark---奖励机制
- (IBAction)jiangLJZButton {
    RMViewController * rmVC = [[RMViewController alloc]init];
    [self.navigationController pushViewController:rmVC animated:YES];
}

#pragma mark---地点地图
- (IBAction)placeMapButton {
    PlaceMapViewController * placeMapVC = [[PlaceMapViewController alloc]init];
    [self.navigationController pushViewController:placeMapVC animated:YES];
}


@end
