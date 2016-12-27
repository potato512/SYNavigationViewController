//
//  BrownViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "BrownViewController.h"
#import "PurpleViewController.h"
#import "SYNavigationController.h"

@interface BrownViewController ()

@end

@implementation BrownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self navitagionControllerStyle];
    self.title = @"棕背景/黄按钮/绿标题 黑状态";
    
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
    PurpleViewController *nextVC = [[PurpleViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


#pragma mark - 导航栏样式自定义

- (void)navitagionControllerStyle
{
    // 使用 SYNavigationController 设置具有动画push效果（原生的则是突然变化）
    [self navigationStyleWithBackgroundColor:[UIColor brownColor] buttonColor:[UIColor yellowColor] titleColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:12.0]];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


@end
