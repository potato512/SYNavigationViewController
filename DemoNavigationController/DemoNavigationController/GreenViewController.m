//
//  GreenViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "GreenViewController.h"
#import "BrownViewController.h"
#import "SYNavigationController.h"


@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navitagionControllerStyle];
    self.title = @"绿背景/棕按钮/蓝标题 白状态";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(nextClick:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@ 被释放了", self);
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    NSLog(@"%@ 是 %@ 中的第 %@ 个视图控制器", self, @(self.sy_navigationController.sy_viewControllers.count), @([self.sy_navigationController.sy_viewControllers indexOfObject:self]));
}

- (void)nextClick:(UIButton *)button
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
