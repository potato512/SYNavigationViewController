//
//  RedViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "RedViewController.h"
#import "GreenViewController.h"

@interface RedViewController ()

@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navitagionControllerStyle];
    self.title = @"红背景/黄按钮/绿标题 白状态";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextClick
{
    GreenViewController *nextVC = [[GreenViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark - 导航栏样式自定义

- (void)navitagionControllerStyle
{
    // 使用 SYNavigationController 设置具有动画push效果（原生的则是突然变化）
    [self navigationStyleWithBackgroundColor:[UIColor redColor] buttonColor:[UIColor yellowColor] titleColor:[UIColor greenColor] titleFont:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
