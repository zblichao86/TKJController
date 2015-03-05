//
//  HomeViewController.m
//  TKJAdmin
//
//  Created by apple on 15/2/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
@interface HomeViewController ()
{
    //userID
    NSString * _userIDB;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //获取本地存储的登录数据
    [self hqLoginDate];
    
    //获取项目概况数据
    [self hpProjectData];

}

#pragma mark---获取项目概况数据
- (void)hpProjectData
{
    //获取存数的projectID
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * pathlogin = [path stringByAppendingPathComponent:@"projectID.plist"];
    
    NSDictionary * projectIDDic = [NSDictionary dictionaryWithContentsOfFile:pathlogin];
    NSString * projectID = [projectIDDic objectForKey:@"projectID"];
    
    //
    AFHTTPRequestOperationManager * mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (_userIDB.length)
    {
        params[@"userid"] = _userIDB;
    }
    if (projectID.length)
    {
        params[@"projectid"] = projectID;
    }

    NSString * URLLogin = [NSString stringWithFormat:@"%@/Project/getProjectGeneral",LTDataUrl];
    
    [mgr POST:URLLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"获取项目概况数据POST成功=%@",responseObject);
        if (responseObject)
        {
            NSString * message = [responseObject objectForKey:@"message"];
            int code = [[responseObject objectForKey:@"code"]intValue];
            NSDictionary * data = [responseObject objectForKey:@"data"];
            if (code == 0)
            {
                @try {
                    _middleVehicles.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"middleVehicles"]];
                    _visit.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"visit"]];
                    _smallVehicles.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"smallVehicles"]];
                    _leaflets.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"leaflets"]];
                    _assistantName.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"assistantName"]];
                    _largeVehicles.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"largeVehicles"]];
                    _assistantTime.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"assistantTime"]];
                    _beesTime.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"beesTime"]];
                    _managersTime.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"managersTime"]];
                    _attention.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"attention"]];
                    _registration.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"registration"]];
                    _phone.text = [NSString stringWithFormat:@"%@",[data objectForKey:@"phone"]];
                }
                @catch (NSException *exception) {
                    NSLog(@"exception获取项目概况数据---%@",exception);
                }
                @finally {
                    NSLog(@"");
                }
                
            }
            else
            {
                if (message.length)
                {
                    [MBProgressHUD showError:message];
                }
            }
       
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"获取项目概况数据失败=%@",error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 返回项目列表页
- (IBAction)backProgectList {
    NSLog(@"返回项目列表页");
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 消息列表页
- (IBAction)messageVC {
    MessageViewController * messageVC = [[MessageViewController alloc]init];
    [self.navigationController pushViewController:messageVC animated:YES];
}

#pragma mark---获取登录存储的信息
- (void)hqLoginDate
{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * pathlogin = [path stringByAppendingPathComponent:@"loginDate.plist"];
    
    NSDictionary * loginDataDic = [NSDictionary dictionaryWithContentsOfFile:pathlogin];
    
    //赋值
    _userIDB = [loginDataDic objectForKey:@"ID"];

}


@end
