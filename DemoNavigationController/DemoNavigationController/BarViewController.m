//
//  BarViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "BarViewController.h"
#import "SYNavigationController.h"
#import "RedViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"红背景/黄按钮/绿标题 白状态";
    
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
    
    NSLog(@"%@ 是 %@ 中的第 %@ 个视图控制器", self, @(self.navigationController.viewControllers.count), @([self.navigationController.viewControllers indexOfObject:self]));
}

- (void)nextClick:(UIButton *)button
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
