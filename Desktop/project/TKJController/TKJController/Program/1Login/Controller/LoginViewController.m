//
//  LoginViewController.m
//  TKJ-BeerAdmin
//
//  Created by apple on 15/1/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//


#import "LoginViewController.h"
#import "ProjectViewController.h"
#import "AFNetworking.h"
#import "UIView+Resign.h"
#import "MBProgressHUD+MJ.h"

#define screenFrame [UIScreen mainScreen].bounds
#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface LoginViewController ()
{
    //Login---Data
    NSDictionary * _loginDateDic;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化控件属性
    [self setupControlNature];
    
    //检查是否记住了密码
    [self chickIsOrRememberPwd];
    
}
#pragma mark---初始化控件属性
- (void)setupControlNature
{
    self.userNameTextField.delegate = self;
    self.passWordTextField.delegate = self;
    
    //是否记住密码
    _remember = NO;
    
    _userNameTextField.text = @"";
    _passWordTextField.text = @"";
    _userNameTextField.textColor = [UIColor whiteColor];
    _passWordTextField.textColor = [UIColor whiteColor];
    
    //用户名密码是否为空
    _isOrNoNull = NO;
    
    _loginDateDic = [[NSDictionary alloc]init];
}

#pragma mark 登陆视图即将显示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    //头像的高
    self.touxiangH.constant = CGRectGetHeight(CGRectMake(0, 0, 0, self.view.frame.size.width*1.5/5));
    //登陆按钮属性
    [self.loginB setTitleColor:[UIColor colorWithRed:61.0/255 green:168.0/255 blue:13.0/255 alpha:1] forState:UIControlStateNormal];
    self.loginB.layer.cornerRadius = screenWidth/19;
    self.loginB.layer.masksToBounds = YES;//超过的圆角的不显示
    self.loginB.titleLabel.font = [UIFont systemFontOfSize:18];
    //用户名
    self.userNameView.layer.cornerRadius = screenWidth/19;
    self.userNameView.layer.masksToBounds = YES;//超过的圆角的不显示
    //密码
    self.passWordView.layer.cornerRadius = screenWidth/19;
    self.passWordView.layer.masksToBounds = YES;//超过的圆角的不显示
    
    
}
#pragma mark---检查是否记住了密码
- (void)chickIsOrRememberPwd
{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString * pathplist = [path stringByAppendingPathComponent:@"rememberPwd.plist"];
    
    NSArray * plistArray  = [NSArray arrayWithContentsOfFile:pathplist];
    
    if (plistArray.count)
    {
        _userNameTextField.text = plistArray[0];
        _passWordTextField.text = plistArray[1];
        
        self.rememberLabel.textColor = [UIColor redColor];
        self.rememberImageView.image = [UIImage imageNamed:@"checkin"];
        
        _remember = YES;
    }

}
#pragma mark 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark---------登陆按钮点击
- (IBAction)loginButton {
    
    //回收键盘（防止键盘不收回直接登录）
    [self backjianpan];
    
    //判断用户名密码是否为空
    [self userNameAndPwdIsOrNoNull];
    
    //记住密码
    [self rememberPwd];
    
    //请求登录数据
    [self senderLoginDate];
    
    
}

#pragma mark 点return收回键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)backjianpan
{
    [_userNameTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    NSLog(@"用户名---%@",_userNameTextField.text);
    NSLog(@"密码---%@",_passWordTextField.text);
}
- (void)userNameAndPwdIsOrNoNull
{
    if ([_userNameTextField.text isEqualToString:@""]||[_passWordTextField.text isEqualToString: @""])
    {
        [MBProgressHUD showError:@"用户名或密码不能为空"];
    }
    else
    {
        _isOrNoNull = YES;
    }
}
#pragma mark---点击(登录按钮)记住密码
- (void)rememberPwd
{
    if (_remember == YES)
    {
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString * pathplist = [path stringByAppendingPathComponent:@"rememberPwd.plist"];
        
        NSArray * array = @[_userNameTextField.text,_passWordTextField.text];
        [array writeToFile:pathplist atomically:YES];
        
        NSLog(@"存储路径pathplist---%@",pathplist);
    }
}
#pragma mark--请求登录数据
- (void)senderLoginDate
{
    if (_isOrNoNull == YES)
    {
        [MBProgressHUD showMessage:@"正在登陆中。。。"];
        
        AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"userCode"] = _userNameTextField.text;
        params[@"passWord"] = _passWordTextField.text;
        params[@"systemId"] = @"24";
        
        NSString * URLLogin = [NSString stringWithFormat:@"%@/Account/login",LTDataUrl];
        
        [mgr POST:URLLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"登录POST成功=%@",responseObject);
            if (responseObject)
            {
                NSString * message = [responseObject objectForKey:@"message"];
                int code = [[responseObject objectForKey:@"code"]intValue];
                _loginDateDic = [responseObject objectForKey:@"data"];
                
                if (code == 0)//登录成功
                {
                    //解析登录返回数据--存入本地
                    [self jiexiLoginDate];
                    
                    ProjectViewController * projectTVC = [[ProjectViewController alloc]init];
                    [self presentViewController:projectTVC animated:YES completion:nil];
                    
                }
                else
                {
                    //登录失败提示系统message
                    if (message.length)
                    {
                        [MBProgressHUD showError:message];
                    }

                }
                [MBProgressHUD hideHUD];
                
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"连接失败，请检查网络连接"];
            NSLog(@"登录POST失败=%@",error);
        }];
    }
    
}

# pragma mark 点击屏幕收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view resignAll];
}
#pragma mark 记住密码Button
- (IBAction)rememberPwdButton {
    
    if (_remember == NO)
    {
        self.rememberLabel.textColor = [UIColor redColor];
        self.rememberImageView.image = [UIImage imageNamed:@"checkin"];
        _remember = YES;
        
    }
    else if (_remember == YES)
    {
        
        self.rememberLabel.textColor = [UIColor whiteColor];
        self.rememberImageView.image = [UIImage imageNamed:@"check1.png"];
        _remember = NO;
        
        //点击不记住密码，就删除内存中存得密码
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString * pathplist = [path stringByAppendingPathComponent:@"rememberPwd.plist"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:pathplist error:nil];
        
    }

}
#pragma mark---记录用户名密码
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.userNameTextField)
    {
        self.userNameTextField.text = textField.text;
    }
    else if (textField == self.passWordTextField)
    {
        self.passWordTextField.text = textField.text;
    }
    
}
#pragma mark---忘记密码按钮
- (IBAction)forgetPwdButtn {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"若忘记密码请与后台管理员联系" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];

}

#pragma mark---解析登录数据data---存入本地
- (void)jiexiLoginDate
{
    @try {
        NSString * userCode = [_loginDateDic objectForKey:@"userCode"];
        NSString * ID = [NSString stringWithFormat:@"%@",[_loginDateDic objectForKey:@"id"]];
        NSString * phone = [_loginDateDic objectForKey:@"phone"];
        NSString * headImage = [_loginDateDic objectForKey:@"headImage"];
        NSString * ticket = [_loginDateDic objectForKey:@"ticket"];
        NSString * userName = [_loginDateDic objectForKey:@"userName"];
        NSString * passWord = [_loginDateDic objectForKey:@"passWord"];
        
        NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString * pathplist = [path stringByAppendingPathComponent:@"loginDate.plist"];
        NSDictionary * logDic = @{@"userCode":userCode,@"ID":ID,@"phone":phone,@"headImage":headImage,@"ticket":ticket,@"userName":userName,@"passWord":passWord};
        
        [logDic writeToFile:pathplist atomically:YES];
    }
    @catch (NSException *exception) {
        NSLog(@"exception解析登录数据data-%@",exception);
    }
    @finally {
        NSLog(@"");
    }

}

@end
