//
//  MessageDetailViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//返回按钮
- (IBAction)backMessageButon;
//消息正文
@property (weak, nonatomic) IBOutlet UILabel *messageDetailLabel;

//messageScrollerView的View
@property (weak, nonatomic) IBOutlet UIView *messageScrollerViewView;

//消息ScrollerView的view的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageScrollerViewViewHight;
//消息正文Label的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageLabelHight;

//回复消息的tableView
@property (weak, nonatomic) IBOutlet UITableView *huifuMessageTableView;

//回复消息按钮
- (IBAction)huifuMessageButton;
@end
