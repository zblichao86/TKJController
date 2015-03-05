//
//  MessageViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageDetailViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messageTBV.dataSource = self;
    self.messageTBV.delegate = self;
}

#pragma mark MessageViewController协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    MessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil]lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //messageCell
    //1-查看详情按钮
    [cell.lookMessageDetailButton addTarget:self action:@selector(lookMessageDetailButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

#pragma mark - messageCell查看详情按钮
- (void)lookMessageDetailButtonClicked:(id)sender
{
    MessageDetailViewController * messageDVC = [[MessageDetailViewController alloc]init];
    [self.navigationController pushViewController:messageDVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backMessageButton {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
