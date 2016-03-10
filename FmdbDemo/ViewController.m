//
//  ViewController.m
//  FmdbDemo
//
//  Created by ZhengXiankai on 15/7/21.
//  Copyright (c) 2015年 ZhengXiankai. All rights reserved.
//

#import "ViewController.h"
#import "PeopleService.h"
#import "PersonModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[PeopleService shareInstance] createTable];
    [[PeopleService shareInstance] insertOnePerson];
    NSArray *people = [[PeopleService shareInstance] query];
    
    for (PersonModel *person in people) {
        NSLog(@"name = %@, age = %d", person.name, person.age);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
