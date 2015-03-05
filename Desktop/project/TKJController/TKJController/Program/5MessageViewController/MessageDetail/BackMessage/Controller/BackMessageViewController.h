//
//  BackMessageViewController.h
//  TKJController
//
//  Created by apple on 15/3/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackMessageViewController : UIViewController<UITextViewDelegate>
- (IBAction)backButton;
- (IBAction)senderMessage;
@property (weak, nonatomic) IBOutlet UITextView *backTextView;

@end
