//
//  GreenViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "GreenViewController.h"
#import "BrownViewController.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navitagionControllerStyle];
    self.title = @"绿背景/棕按钮/蓝标题 白状态";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextClick
{
    BrownViewController *nextVC = [[BrownViewController alloc] init];
    SYNavigationController *nextNav = [[SYNavigationController alloc] initWithRootViewController:nextVC];
    nextNav.showCancelBarButtonItem = YES;
    [self presentViewController:nextNav animated:YES completion:nil];
}


#pragma mark - 导航栏样式自定义

- (void)navitagionControllerStyle
{
    // 使用 SYNavigationController 设置具有动画push效果（原生的则是突然变化）
    [self navigationStyleWithBackgroundColor:[UIColor greenColor] buttonColor:[UIColor brownColor] titleColor:[UIColor blueColor] titleFont:[UIFont systemFontOfSize:12.0]];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
