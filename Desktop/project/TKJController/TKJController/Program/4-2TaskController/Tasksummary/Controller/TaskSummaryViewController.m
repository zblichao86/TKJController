//
//  TaskSummaryViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TaskSummaryViewController.h"
#import "WriteTaskSummaryViewController.h"

@interface TaskSummaryViewController ()

@end

@implementation TaskSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 返回按钮
- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 任务总结
- (IBAction)writeTaskSummary {
    
    WriteTaskSummaryViewController * writeTSVC = [[WriteTaskSummaryViewController alloc]init];
    [self.navigationController pushViewController:writeTSVC animated:YES];
}
@end
