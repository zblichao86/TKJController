//
//  ProjectViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectTableViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ProjectTableViewController * projectTVC = [[ProjectTableViewController alloc]init];
    _nav = [[UINavigationController alloc]initWithRootViewController:projectTVC];
    [self.view addSubview:_nav.view];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
