//
//  UIView+Resign.h
//  UIView的类别-点击屏幕收回键盘
//
//  Created by Damonlu on 14-10-2.
//  Copyright (c) 2014年 Damonlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Resign)

//让当前视图所有可能是第一响应者的对象放弃第一响应
- (void) resignAll;

@end
