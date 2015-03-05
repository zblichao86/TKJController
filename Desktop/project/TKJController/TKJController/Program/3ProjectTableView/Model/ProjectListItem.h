//
//  ProjectListItem.h
//  TKJController
//
//  Created by apple on 15/3/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectListItem : NSObject

//项目id
@property (nonatomic,copy) NSString * projectId;
//项目名称
@property (nonatomic,copy) NSString * projectName;
//合同id
@property (nonatomic,copy) NSString * contractId;
//城市id
@property (nonatomic,copy) NSString * cityid;
//地区
@property (nonatomic,copy) NSString * region;
//城市
@property (nonatomic,copy) NSString * city;
//任务码
@property (nonatomic,copy) NSString * taskNum;
//地媒码
@property (nonatomic,copy) NSString * mediumNum;

@end
