//
//  RMViewController.m
//  TKJController
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RMViewController.h"
#import "JLJZBJViewController.h"
@interface RMViewController ()

@end

@implementation RMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回按钮
- (IBAction)backButton {
    [self.navigationController popViewControllerAnimated:YES];
}
//奖励机制编辑按钮
- (IBAction)bianJiButton {
    JLJZBJViewController * jljzBJVC = [[JLJZBJViewController alloc]init];
    [self.navigationController pushViewController:jljzBJVC animated:YES];
}
@end
