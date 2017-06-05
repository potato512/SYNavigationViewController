//
//  BarViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "BarViewController.h"
#import "RedViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"红背景/黄按钮/绿标题 白状态";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextClick
{
    RedViewController *nextVC = [[RedViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark - 导航栏样式自定义

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (Class)sy_navigationBarClass
{
    return [SYNavigationBar class];
}


@end
