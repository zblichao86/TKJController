//
//  GroundMediaListDetailViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroundMediaListDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;



//返回按钮
- (IBAction)backButton;

@property (weak, nonatomic) IBOutlet UITableView *groundMediaListDetailTBVC;
//消息按钮
- (IBAction)messageButton;


@end
