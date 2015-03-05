//
//  LoginViewController.h
//  TKJ-BeerAdmin
//
//  Created by apple on 15/1/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    //是否记住密码
    BOOL  _remember;
    
    //用户名密码是否为空
    BOOL _isOrNoNull;
}

//头像的高
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *touxiangH;

//登陆按钮
- (IBAction)loginButton;
@property (weak, nonatomic) IBOutlet UIButton *loginB;
//用户名
@property (weak, nonatomic) IBOutlet UIView *userNameView;
//密码
@property (weak, nonatomic) IBOutlet UIView *passWordView;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

//记住密码label和imageView
@property (weak, nonatomic) IBOutlet UIImageView *rememberImageView;
@property (weak, nonatomic) IBOutlet UILabel *rememberLabel;

- (IBAction)rememberPwdButton;
- (IBAction)forgetPwdButtn;

@end
