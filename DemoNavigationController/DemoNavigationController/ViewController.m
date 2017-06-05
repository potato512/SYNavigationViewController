//
//  ViewController.m
//  DemoNavigationController
//
//  Created by zhangshaoyu on 16/12/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "BarViewController.h"

#import "AnimationCubeVC.h"
#import "AnimationMoveInVC.h"
#import "AnimationRevealVC.h"
#import "AnimationFadeVC.h"
#import "AnimationPageVC.h"
#import "AnimationSuckVC.h"
#import "AnimationRippleVC.h"
#import "AnimationOglVC.h"
#import "AnimationRotateVC.h"
#import "AnimationPushVC.h"
#import "AnimationCameraVC.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"自定义导航控制器";
    
    self.array = @[@"立体翻滚转场", @"新视图移到旧视图上面转场", @"旧视图移开显示新视图转场", @"交叉淡化转场", @"翻页转场", @"收缩转场", @"滴水转场", @"上下左右翻转转场", @"旋转转场", @"push转场", @"相机开关转场"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextClick
{
    BarViewController *nextVC = [[BarViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    NSString *text = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *nextVC = nil;
    if (0 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"cube" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationCubeVC new];
    }
    else if (1 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"moveIn" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationMoveInVC new];
    }
    else if (2 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"reveal" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationRevealVC new];
    }
    else if (3 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"fade" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationFadeVC new];
    }
    else if (4 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"pageCurl" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationPageVC new];
    }
    else if (5 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"suckEffect" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationSuckVC new];
    }
    else if (6 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"rippleEffect" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationRippleVC new];
    }
    else if (7 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"oglFlip" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationOglVC new];
    }
    else if (8 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"rotate" subType:@"90cw" function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationRotateVC new];
    }
    else if (9 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"push" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationPushVC new];
    }
    else if (10 == indexPath.row)
    {
        [self.sy_navigationController navigationControllerAnimation:0.6 type:@"cameraIrisHollowOpen" subType:kCATransitionFromLeft function:kCAMediaTimingFunctionLinear];
        
        nextVC = [AnimationCameraVC new];
    }
    nextVC.title = self.array[indexPath.row];
    // push-效果明显
    [self.navigationController pushViewController:nextVC animated:YES];
    // present-效果无
//    SYNavigationController *nextNav = [[SYNavigationController alloc] initWithRootViewController:nextVC];
//    [self presentViewController:nextNav animated:YES completion:nil];
}


@end
