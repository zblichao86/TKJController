//
//  UIView+Resign.m
//  UIView的类别-点击屏幕收回键盘
//
//  Created by Damonlu on 14-10-2.
//  Copyright (c) 2014年 Damonlu. All rights reserved.
//

#import "UIView+Resign.h"

@implementation UIView (Resign)


- (void) resignFirstResponder:(UIView *)view
{
    //遍历当前视图的所有姿势图
    for (UIView * subView in view.subviews)
    {
        //如果是输入框类型就放弃第一响应
        if ([subView isKindOfClass:[UITextField class]])
        {
            [subView resignFirstResponder];
        }
        //如果子视图还有子视图就继续遍历
        else if ([subView.subviews count]!=0)
        {
            [self resignFirstResponder:subView];
        }
    }
}
- (void) resignAll
{
    [self resignFirstResponder:self];
}
@end
