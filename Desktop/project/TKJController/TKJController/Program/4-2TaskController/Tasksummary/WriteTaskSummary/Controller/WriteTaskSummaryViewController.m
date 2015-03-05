//
//  WriteTaskSummaryViewController.m
//  TKJAdmin
//
//  Created by apple on 15/3/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "WriteTaskSummaryViewController.h"

@interface WriteTaskSummaryViewController ()

@end

@implementation WriteTaskSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark---返回按钮
- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark---任务总结提交
- (IBAction)tijiaoButton {
}
@end
