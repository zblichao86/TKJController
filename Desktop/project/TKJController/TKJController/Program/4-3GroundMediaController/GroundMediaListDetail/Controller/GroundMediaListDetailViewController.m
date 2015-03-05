//
//  GroundMediaListDetailViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "GroundMediaListDetailViewController.h"
#import "JBXinxiTableViewCell.h"

#import "MessageViewController.h"

@interface GroundMediaListDetailViewController ()

@end

@implementation GroundMediaListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置默认属性
    [self initMorenShuXin];
    
    self.groundMediaListDetailTBVC.delegate = self;
    self.groundMediaListDetailTBVC.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---返回按钮
- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark tableView 协议
#pragma mark---多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
#pragma mark---每组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"基本信息";
            break;
        case 1:
            return @"地媒信息";
            break;
        case 2:
            return @"联系方式";
            break;
        case 3:
            return @"合作模式";
            break;
        case 4:
            return @"奖励机制";
            break;
            
        default:
            break;
    }
    return @"";
}
#pragma mark---每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark---每行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0||indexPath.section == 1||indexPath.section == 2||indexPath.section == 3)
    {
        JBXinxiTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"JBXinxiTableViewCell" owner:self options:nil]lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        if (indexPath.section == 1)
        {
            cell.label1.text = @"资源依据";
            cell.label2.text = @"对象类型";
            cell.label3.text = @"名称";
            cell.label4.text = @"主营业务";
            cell.label5.text = @"";
            
            cell.labelData1.text = @"";
            cell.labelData2.text = @"";
            cell.labelData3.text = @"";
            cell.labelData4.text = @"";
            cell.labelData5.text = @"";
        }
        else if (indexPath.section == 2)
        {
            cell.label1.text = @"联系人";
            cell.label2.text = @"联系方式";
            cell.label3.text = @"";
            cell.label4.text = @"";
            cell.label5.text = @"";
            
            cell.labelData1.text = @"";
            cell.labelData2.text = @"";
            cell.labelData3.text = @"";
            cell.labelData4.text = @"";
            cell.labelData5.text = @"";
        }
        else if (indexPath.section == 3)
        {
            cell.label1.text = @"合作方式";
            cell.label2.text = @"资源类型";
            cell.label3.text = @"工作内容";
            cell.label4.text = @"协议价";
            cell.label5.text = @"意向度";
            
            cell.labelData1.text = @"";
            cell.labelData2.text = @"";
            cell.labelData3.text = @"";
            cell.labelData4.text = @"";
            cell.labelData5.text = @"";
        }
        
        return cell;
    }
    JBXinxiTableViewCell * cell = [[[NSBundle mainBundle] loadNibNamed:@"JBXinxiTableViewCell" owner:self options:nil]lastObject];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    return nil;
}
#pragma mark---每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 1:
            return 180;
            break;
        case 2:
            return 100;
            break;
//        case 4:
//            return @"奖励机制";
//            break;
            
        default:
            break;
    }
    return 220;
}
#pragma mark---每组头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
#pragma mark---每组尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

#pragma mark---消息按钮
- (IBAction)messageButton {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
#pragma mark---设置默认属性
- (void)initMorenShuXin
{
    //设置圆头像
    self.shopImageView.layer.cornerRadius = 49;
    //超过的圆角的不显示
    self.shopImageView.layer.masksToBounds = YES;
}
@end
