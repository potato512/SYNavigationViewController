//
//  PurpleViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "PurpleViewController.h"

@interface PurpleViewController ()

@end

@implementation PurpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navitagionControllerStyle];
    self.title = @"粉背景/蓝按钮/橙标题 白状态";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏样式自定义

- (void)navitagionControllerStyle
{
    // 使用 SYNavigationController 设置具有动画push效果（原生的则是突然变化）
    [self navigationStyleWithBackgroundColor:[UIColor purpleColor] buttonColor:[UIColor blueColor] titleColor:[UIColor orangeColor] titleFont:[UIFont systemFontOfSize:20.0]];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
