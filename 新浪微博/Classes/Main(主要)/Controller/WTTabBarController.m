//
//  WTTabBarController.m
//  新浪微博
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "WTTabBarController.h"
#import "TWTabBar.h"
#import "WTMessageViewController.h"
#import "WTHomeViewController.h"
#import "WTProfileViewController.h"
#import "WTDiscoverTableViewController.h"

@interface WTTabBarController ()
// TabbarController的自定义属性Tabbar
@property (nonatomic, weak)TWTabBar * customTabBar;
@end

@implementation WTTabBarController
#pragma mark - 初始化方法
/**
 *  tabBar控制器最后初始化都会调用. initXib这个方法
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 初始化所有子控制器
        [self setupAllChildVCs];

        
    }
    return self;
}

#pragma mark view加载完毕
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 初始化tabbar
    [self setupTabBar];
}

#pragma mark 初始化tabbar
/**
 *  初始化tabbar ==================================================
 */
- (void)setupTabBar
{
    // 创建新的tabbar
    TWTabBar * customTabBar = [[TWTabBar alloc]init];
    customTabBar.frame = self.tabBar.frame;

    
    [self.view addSubview:customTabBar];
    self.customTabBar = customTabBar;
    
    // 移除原来的tabbar
    [self.tabBar removeFromSuperview];
}

#pragma mark 初始化所有子控制器
/**
 *  初始化所有子控制器v
 */
- (void)setupAllChildVCs
{
    // 1.首页
    WTHomeViewController * home = [[WTHomeViewController alloc]init];
    [self setupOneChildVC:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    // 2.消息
    WTMessageViewController * message = [[WTMessageViewController alloc]init];
    [self setupOneChildVC:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    // 3.广场
    WTDiscoverTableViewController * discover = [[WTDiscoverTableViewController alloc]init];
    [self setupOneChildVC:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    // 4.我
    WTProfileViewController * profile = [[WTProfileViewController alloc]init];
    [self setupOneChildVC:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
    /*
     最原始版
     WTDiscoverTableViewController * discover = [[WTDiscoverTableViewController alloc]init];
     discover.view.backgroundColor = WTRandomColor;
     discover.tabBarItem.title = @"广场";
     discover.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
     discover.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_selected"];
     [self addChildViewController:discover];
     */
}

#pragma mark 初始化一个子控制器
/**
 *  初始化一个子控制器
 */
- (void)setupOneChildVC:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 控制器的背景颜色
    child.view.backgroundColor = WTRandomColor;
    // 设置标题
    child.tabBarItem.title = title;
    // 设置图片
    child.tabBarItem.image = [UIImage imageWithNamed:imageName];
    
    UIImage * selectedImage = [UIImage imageWithNamed:selectedImageName];
    if (iOS7) { // 如果是ios7 , 不要渲染图片
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    // 设置选中状态图片
    child.tabBarItem.selectedImage = selectedImage;
    // 添加子控制器
    [self addChildViewController:child];
    [self.customTabBar addTabBarButton:child.tabBarItem];
}




#pragma mark - 其他方法
@end
