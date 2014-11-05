//
//  WTTabBarController.m
//  新浪微博
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "WTTabBarController.h"

#import "WTMessageViewController.h"
#import "WTHomeViewController.h"
#import "WTProfileViewController.h"
#import "WTDiscoverTableViewController.h"
@interface WTTabBarController ()

@end

@implementation WTTabBarController

/**
 *  tabBar控制器最后初始化都会调用. initXib这个方法
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
// 提炼版
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
    return self;
}

- (void)setupOneChildVC:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    child.view.backgroundColor = WTRandomColor;
    child.tabBarItem.title = title;
    child.tabBarItem.image = [UIImage imageNamed:imageName];
    child.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    [self addChildViewController:child];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
