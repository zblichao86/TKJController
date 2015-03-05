//
//  MessageViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/26.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)backMessageButton;
@property (weak, nonatomic) IBOutlet UITableView *messageTBV;

@end
