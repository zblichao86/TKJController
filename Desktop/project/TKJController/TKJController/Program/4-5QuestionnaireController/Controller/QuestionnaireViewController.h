//
//  QuestionnaireViewController.h
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionnaireViewController : UIViewController

//scrollerView的高
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollerViewHight;

//返回按钮
- (IBAction)backProjectList;
//消息按钮
- (IBAction)messageVC;

@property (weak, nonatomic) IBOutlet UIView *needTypeView;
@end
