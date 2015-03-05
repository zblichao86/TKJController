//
//  Mycontrols.m
//  MyControl
//
//  Created by Damonlu on 14-9-26.
//  Copyright (c) 2014年 Damonlu. All rights reserved.
//

#import "Mycontrols.h"

@implementation Mycontrols

+ (UILabel *)creatLabelWithTitle:(NSString *)title andFrame:(CGRect)frame
{
    //用户自定义属性
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    
    //固定属性
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

+ (UIButton *)creatButtonWithTitle:(NSString *)title andFrame:(CGRect)frame andTag:(NSInteger)tag
{
    //用户自定义属性
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    button.frame = frame;
    button.tag = tag;
    
    //固定属性
    button.backgroundColor = [UIColor whiteColor];
    
    return button;
    
}

+ (UIButton *)creatButtonwithImage:(NSString *)imageName andFrame:(CGRect)frame andTag:(NSInteger)tag
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.frame = frame;
    button.tag = tag;
    button.backgroundColor = [UIColor clearColor];
    
    return button;
}

+ (UITextField *)creatTextFieldWithPlaceholder:(NSString *)placeholder andFrame:(CGRect)frame andTag:(NSInteger)tag andDelegate:(id)delegate
{
    //用户自定义属性
    UITextField * textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.tag = tag;
    textField.delegate = delegate;
    
    //设置提示字体的颜色
    UIColor * color = [UIColor redColor];
    textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color}];
    
    //固定属性
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [textField setBackgroundColor:[UIColor clearColor]];
    [textField drawPlaceholderInRect:CGRectMake(0, 0, 40, 40)];
    textField.textColor = [UIColor redColor];
    textField.textAlignment = NSTextAlignmentCenter;
    return textField;
}



@end
