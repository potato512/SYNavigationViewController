//
//  SYNavigationController.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github：https://github.com/potato512/SYNavigationViewController

#import <UIKit/UIKit.h>
#import "SYNavigationBar.h"
#import "UIViewController+SYNavigationController.h"

/******************************************************************************/

#pragma mark - 内容视图控制器

@interface SYContainerController : UIViewController

@property (nonatomic, readonly, strong) __kindof UIViewController *contentViewController;

@end

/******************************************************************************/

#pragma mark - 内容导航视图控制器

@interface SYContainerNavigationController : UINavigationController

@end

/******************************************************************************/

#pragma mark - 导航视图控制器

IB_DESIGNABLE
@interface SYNavigationController : UINavigationController

/**
*  是否使用系统的返回按钮（push出来的视图控制器）（默认NO，即使用自定义）
*/
@property (nonatomic, assign) IBInspectable BOOL showBackBarButtonItem;

/**
 *  是否显示返回按钮（present出来的视图控制器）（默认NO，即不显示）
 */
@property (nonatomic, assign) IBInspectable BOOL showCancelBarButtonItem;

/// 使用根视图控制器导航栏样式（默认YES，即每个视图控制器的导航栏样式与根视图控制器的一致）
@property (nonatomic, assign) IBInspectable BOOL transferNavigationBarAttributes;

/**
 *  可见视图控制器
 */
@property (nonatomic, readonly, strong) UIViewController *sy_visibleViewController;

/**
 *  顶层视图控制器
 */
@property (nonatomic, readonly, strong) UIViewController *sy_topViewController;

/**
 *  视图控制器数组
 */
@property (nonatomic, readonly, strong) NSArray <__kindof UIViewController *> *sy_viewControllers;

/**
 *  初始化导航栏视图控制器
 *
 *  @param rootViewController 根视图控制器
 *
 *  @return 导航栏视图控制器
 */
- (instancetype)initWithRootViewControllerNoWrapping:(UIViewController *)rootViewController;

/**
 *  移除视图控制器
 *
 *  @param controller 被移除的视图控制器
 */
- (void)removeViewController:(UIViewController *)controller NS_REQUIRES_SUPER;
- (void)removeViewController:(UIViewController *)controller animated:(BOOL)flag NS_REQUIRES_SUPER;

/**
 *  推出视图控制器
 *
 *  @param viewController 被推出显示的视图控制器
 *  @param animated       是否动画
 *  @param block          推出时的回调block
 */
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                  complete:(void(^)(BOOL finished))block;

/**
 *  返回到指定的视图控制器
 *
 *  @param viewController 指定回到的视图控制器
 *  @param animated       是否动画
 *  @param block          返回时的回调block
 *
 *  @return 视图控制器数组
 */
- (NSArray <__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController
                                                      animated:(BOOL)animated
                                                      complete:(void(^)(BOOL finished))block;

/**
 *  返回到根视图控制器
 *
 *  @param animated 是否动画
 *  @param block    返回时的回调block
 *
 *  @return 视图控制器数组
 */
- (NSArray <__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
                                                                  complete:(void(^)(BOOL finished))block;



#pragma mark - 自定义转场动画

/**
 *  转场动画
 *
 *  @param duration 动画时间（默认0.3秒）
 *  @param type     动画类型-动画形式（默认）
 *  @"cube"                  立方体翻滚效果
 *  @"moveIn"                新视图移到旧视图上面
 *  @"reveal"                显露效果(将旧视图移开,显示下面的新视图)
 *  @"fade"                  交叉淡化过渡(不支持过渡方向)(默认为此效果)
 *  @"pageCurl"              向上翻一页
 *  @"pageUnCurl"            向下翻一页
 *  @"suckEffect"            收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
 *  @"rippleEffect"          滴水效果,(不支持过渡方向)
 *  @"oglFlip"               上下左右翻转效果
 *  @"rotate"                旋转效果
 *  @"push"
 *  @"cameraIrisHollowOpen"  相机镜头打开效果(不支持过渡方向)
 *  @"cameraIrisHollowClose" 相机镜头关上效果(不支持过渡方向)
 *  kCATransitionFade        交叉淡化过渡
 *  kCATransitionMoveIn      新视图移到旧视图上面
 *  kCATransitionPush        新视图把旧视图推出去
 *  kCATransitionReveal      将旧视图移开,显示下面的新视图
 *
 *  @param subType  动画子类型-动画方向
 *  kCATransitionFromRight; 同字面意思(下同)
 *  kCATransitionFromLeft;
 *  kCATransitionFromTop;
 *  kCATransitionFromBottom;
 *
 *  当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
 *  90cw   逆时针旋转90°
 *  90ccw  顺时针旋转90°
 *  180cw  逆时针旋转180°
 *  180ccw 顺时针旋转180°
 *
 *  @param function 动画轨迹模式
 *  kCAMediaTimingFunctionLinear        线性,即匀速
 *  kCAMediaTimingFunctionEaseIn        先慢后快
 *  kCAMediaTimingFunctionEaseOut       先快后慢
 *  kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
 *  kCAMediaTimingFunctionDefault       实际效果是动画中间比较快
 *
 */
- (void)navigationControllerAnimation:(NSTimeInterval)duration type:(NSString *)type subType:(NSString *)subType function:(NSString *)function;

@end

/******************************************************************************/

/*
 使用说明
 1、定义根视图
 ViewController *rootVC = [[ViewController alloc] init];
 SYNavigationController *rootNav = [[SYNavigationController alloc] initWithRootViewController:rootVC];
 rootNav.showBackBarButtonItem = YES;
 rootNav.transferNavigationBarAttributes = NO;
 rootVC.showCancelBarButtonItem = YES;
 
 2、修改导航栏样式
 [self navigationStyleWithBackgroundColor:[UIColor brownColor] buttonColor:[UIColor yellowColor] titleColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:12.0]];
 
 3、修改状态栏样式
 - (UIStatusBarStyle)preferredStatusBarStyle
 {
     // 黑色字体UIStatusBarStyleDefault、白色字体UIStatusBarStyleLightContent
     return UIStatusBarStyleDefault;
 }
 
 4、转场动画使用
 [self.sy_navigationController navigationControllerAnimation:0.6 type:@"oglFlip" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
 
*/



