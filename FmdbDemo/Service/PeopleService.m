//
//  PeopleService.m
//  FmdbDemo
//
//  Created by ZhengXiankai on 15/7/21.
//  Copyright (c) 2015年 ZhengXiankai. All rights reserved.
// 范德萨范德萨

#import "PersonModel.h"
#import "PeopleService.h"
#import "DbService.h"


@interface PeopleService ()
{
    DbService *_dbService;
}

@end

@implementation PeopleService

+ (instancetype)shareInstance
{
    static id instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        NSString *dbName = @"people.db";
        NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *dbPath = [directory stringByAppendingPathComponent:dbName];
        _dbService = [[DbService alloc] initWithPath:dbPath];
    }
    return self;
}

- (void)createTable
{
    NSString *sql = @"CREATE TABLE People (                     \
                        id INTEGER PRIMARY KEY AUTOINCREMENT,   \
                        str1 TEXT,                              \
                        str2 TEXT,                              \
                        float1 REAL,                            \
                        double1 INTEGER,                        \
                        short1 REAL,                            \
                        long1 REAL,                             \
                        date1 TEXT,                             \
                        bool1 INTEGER,                          \
                        data1 BLOB                              \
                        )";
    [_dbService executeUpdate:sql param:nil];
}

- (void)insertOnePerson
{
    NSString *sql = @"insert into People(str1, str2, float1, double1, short1, long1, date1, bool1, data1) values(?,?,?,?,?,?,?,?,?)";
    
    NSString *text = @"dataValue";
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *param = @[@"bomo", @"male", @70, @175l, @22, @123, [NSDate date], @NO, data];
    
    [_dbService executeUpdate:sql param:param];
}

- (NSArray *)query
{
    return [_dbService executeQuery:@"select * from People" withArgumentsInArray:nil modelClass:[PersonModel class]];
}

@end
