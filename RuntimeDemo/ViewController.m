//
//  ViewController.m
//  RuntimeDemo
//
//  Created by LXJ on 2018/5/7.
//  Copyright © 2018年 LianLuo. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"icon_lianjie0"];
    image.name = @"lala";
    NSLog(@"runtime动态添加属性name==%@" ,image.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
