//
//  QuestionnaireViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "QuestionnaireViewController.h"
#import "MessageViewController.h"
@interface QuestionnaireViewController ()

@end

@implementation QuestionnaireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---视图即将出现
- (void)viewDidAppear:(BOOL)animated
{
    CGFloat needTypeY = CGRectGetMaxY(self.needTypeView.frame);
    self.scrollerViewHight.constant = CGRectGetHeight(CGRectMake(0, 0, screenWidth, needTypeY+10));
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
@end
