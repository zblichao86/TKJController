//
//  MessageDetailViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MessageDetailViewController.h"
#import "HuiFuMessageTableViewCell.h"
#import "BackMessageViewController.h"
@interface MessageDetailViewController ()<UITextViewDelegate>
{
    CGFloat _cellH;
}
@end

@implementation MessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化默认设置
    [self setupSetting];
    
    self.huifuMessageTableView.delegate = self;
    self.huifuMessageTableView.dataSource = self;
}
#pragma mark--- 初始化默认设置
- (void)setupSetting
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 返回消息按钮
- (IBAction)backMessageButon {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 视图即将显示
- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    
    self.messageDetailLabel.text = @"用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom!用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom!!用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom!用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，标题的改cell的style必须选Custom，不改cell的style必须选Custom用storyboard，要想往cell里面拖控件如开关，`222";
    
    //消息label的最大宽度
    CGFloat messageContentLabelMaxW = self.view.frame.size.width-20-90;//self.messageScrollerViewView.frame.size.width;
    //消息label的换行类型
    //[self.messageDetailLabel setLineBreakMode:NSLineBreakByWordWrapping];

    //消息label的frame
    CGRect cframe = [self.messageDetailLabel.text boundingRectWithSize:CGSizeMake(messageContentLabelMaxW,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    
    //根据label数据定制消息label的高和scroller的高
    self.messageLabelHight.constant = CGRectGetHeight(CGRectMake(0, 0, messageContentLabelMaxW, cframe.size.height));
    
    self.messageScrollerViewViewHight.constant = CGRectGetHeight(CGRectMake(0, 0, messageContentLabelMaxW, cframe.size.height));
    
    
    NSLog(@"messageScrollerViewViewHight--%f",self.messageScrollerViewViewHight.constant);
    NSLog(@"cframe.size.height---%f",cframe.size.height);
    NSLog(@"messageContentLabelMaxW---%f",messageContentLabelMaxW);
    
}
#pragma mark 回复消息按钮
- (IBAction)huifuMessageButton {
    
    BackMessageViewController * backMessageVC = [[BackMessageViewController alloc]init];
    [self presentViewController:backMessageVC animated:YES completion:nil];
}


#pragma mark---ListTableView协议
#pragma mark---tableView每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
#pragma mark---tableViewCell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    HuiFuMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HuiFuMessageTableViewCell" owner:self options:nil]lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //回复label内容
    cell.huifuContentLabel.text = @"电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还电话沟通那你还";
    CGFloat huifuContentLabelMaxW = self.view.frame.size.width-20-80;
    CGRect hfframe = [cell.huifuContentLabel.text boundingRectWithSize:CGSizeMake(huifuContentLabelMaxW,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    cell.huifuContentLabelHight.constant = CGRectGetHeight(CGRectMake(0, 0, huifuContentLabelMaxW, hfframe.size.height));
    
    //根据正文数据高度赋值cell高度
    _cellH = hfframe.size.height + 50;
    
    return cell;
}
#pragma mark---tableViewCell行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_cellH)
    {
        return _cellH;
    }
    return 100;
}



@end
