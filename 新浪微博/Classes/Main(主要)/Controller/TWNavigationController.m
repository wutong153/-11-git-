//
//  TWNavigationController.m
//  新浪微博
//
//  Created by Mac on 14-11-8.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWNavigationController.h"

@interface TWNavigationController ()

@end

@implementation TWNavigationController

// 第一次调用此类的时候调用的方法
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavTheme];
    
    
    // 2.设置导航按钮主题
    [self setupItemTheme];
}

// 1.设置导航栏主题
+ (void)setupNavTheme
{
    // 获取 appearance对象,就能修改主题
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    // 设置背景
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary * textAtts = [NSMutableDictionary dictionary];
        
        // 设置文字颜色
        textAtts[UITextAttributeTextColor] = [UIColor blackColor];
        // 去掉阴影
        textAtts[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
        
        // 设置文字字体
        textAtts[UITextAttributeFont] = [UIFont boldSystemFontOfSize:20];
        
        // 将样式添加
        [navBar setTitleTextAttributes:textAtts];
    }
}

// 2.设置导航按钮主题
+ (void)setupItemTheme
{
    // 1.获取
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    
    // 2.设置按钮的背景
    if (iOS7) {// ios7的时候的情况
        NSMutableDictionary * textAtts = [NSMutableDictionary dictionary];
        
        // 设置文字颜色
        textAtts[UITextAttributeTextColor] = [UIColor orangeColor];
        // 去掉阴影
        textAtts[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
        
        // 设置文字字体
        textAtts[UITextAttributeFont] = [UIFont boldSystemFontOfSize:16];
        [item setTitleTextAttributes:textAtts forState:UIControlStateNormal];
    }else{// ios6时候的情况
        // 设置背景
        [item setBackgroundImage:[UIImage /*普通状态*/imageWithNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage /*高亮状态*/imageWithNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage /*不可用状态*/imageWithNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
        
        // 设置文字颜色
        NSMutableDictionary * textAtts = [NSMutableDictionary dictionary];
        
        // 设置文字颜色
        textAtts[UITextAttributeTextColor] = [UIColor grayColor];
        // 去掉阴影
        textAtts[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
        
        // 设置文字字体
        textAtts[UITextAttributeFont] = [UIFont boldSystemFontOfSize:13];
        [item setTitleTextAttributes:textAtts forState:UIControlStateNormal];
        [item setTitleTextAttributes:textAtts forState:UIControlStateHighlighted];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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


//  重写控制器的push方法, 让非根控制器不显示tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {// 如果push的不是根控制器(不是栈低控制器)
        //  不显示tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        //  设置左边的按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back" highImage:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        // 设置右边的按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_more" highImage:@"navigationbar_more_highlighted" target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
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
