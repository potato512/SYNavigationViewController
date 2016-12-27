# SYNavigationViewController
可以自定义不同样式的导航栏样式的导航栏视图控制器（有push动画效果）

#效果图
![navigation.gif](./navigation.gif)

#功能介绍说明
使用继承UINavigationContoller的封装类SYNavigationController，便于设置自定义的导航栏样式，效果优于使用未封装UINavigationContoller时的效果。
 * 有push动画的层级效果（未封装UINavigationContoller的无）
 * 样式设置方法可以在viewDidLoad方法中实现（未封装UINavigationContoller的通常在viewWillAppear，或viewWillDisappear方法中实现）
 * 样式设置后不同的视图控制器互不影响（未封装UINavigationContoller的会相互影响）
 * 同时可以设置状态栏字体样式，黑色或白色

#使用方法
~~~~ javascript
// 导入头文件
#import "SYNavigationController.h"
~~~~

~~~~ javascript
// 定义根视图
ViewController *rootVC = [[ViewController alloc] init];
SYNavigationController *rootNav = [[SYNavigationController alloc] initWithRootViewController:rootVC];
rootNav.showBackBarButtonItem = YES;
rootNav.transferNavigationBarAttributes = NO;
rootVC.showCancelBarButtonItem = YES;
~~~~ 

~~~~ javascript
// 修改导航栏样式
[self navigationStyleWithBackgroundColor:[UIColor brownColor] buttonColor:[UIColor yellowColor] titleColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:12.0]];
~~~~ 

~~~~ javascript
// 修改状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
// 黑色字体UIStatusBarStyleDefault、白色字体UIStatusBarStyleLightContent
return UIStatusBarStyleDefault;
}
~~~~ 

#注意事项
 * 1 获取视图控制器数组，或索引时不是
~~~~ javascript
NSLog(@"%@ 是 %@ 中的第 %@ 个视图控制器", self, @(self.navigationController.viewControllers.count), @([self.navigationController.viewControllers indexOfObject:self]));
~~~
 而是
~~~ javascript
NSLog(@"%@ 是 %@ 中的第 %@ 个视图控制器", self, @(self.sy_navigationController.sy_viewControllers.count), @([self.sy_navigationController.sy_viewControllers indexOfObject:self]));
~~~

 * 2