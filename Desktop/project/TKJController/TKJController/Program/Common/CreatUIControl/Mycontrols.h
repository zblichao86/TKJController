//
//  Mycontrols.h
//  MyControl
//
//  Created by Damonlu on 14-9-26.
//  Copyright (c) 2014年 Damonlu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Mycontrols : NSObject

+ (UILabel *)creatLabelWithTitle:(NSString *)title andFrame:(CGRect)frame;

+ (UIButton *)creatButtonWithTitle:(NSString *)title andFrame:(CGRect)frame andTag:(NSInteger)tag;

+ (UITextField *)creatTextFieldWithPlaceholder:(NSString *)placeholder andFrame:(CGRect)frame andTag:(NSInteger)tag andDelegate:(id)delegate;

+ (UIButton *)creatButtonwithImage:(NSString *)imageName andFrame:(CGRect)frame andTag:(NSInteger)tag;

@end
