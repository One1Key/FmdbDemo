//
//  PeopleService.h
//  FmdbDemo
//
//  Created by ZhengXiankai on 15/7/21.
//  Copyright (c) 2015年 ZhengXiankai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleService : NSObject

+ (instancetype)shareInstance;

- (void)createTable;

- (void)insertOnePerson;

- (NSArray *)query;

@end
