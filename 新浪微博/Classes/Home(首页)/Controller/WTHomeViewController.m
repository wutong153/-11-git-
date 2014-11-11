//
//  WTHomeViewController.m
//  新浪微博
//
//  Created by Mac on 14-11-5.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "WTHomeViewController.h"
#import "TWTitleMenu.h"
#import "TWTitleButton.h"

@interface WTHomeViewController ()
// 标题按钮
@property (nonatomic, strong)TWTitleButton * titleButton;

// 点击标题按钮弹出的view
@property (nonatomic, strong)TWTitleMenu * titleMenu;
@end

@implementation WTHomeViewController

#pragma mark - 懒加载区
// 标题按钮的懒加载
- (TWTitleButton *)titleButton
{
    if (!_titleButton) {
        _titleButton = [[TWTitleButton alloc]init];
    }
    return _titleButton;
}

// 弹出view的懒加载
- (TWTitleMenu *)titleMenu
{
    if (!_titleMenu) {
        // 创建出来的时候坐标和宽高都设置好了
        TWTitleMenu * titleMenu = [[TWTitleMenu alloc]init];
        titleMenu.width = 200;
        titleMenu.height = 200;
        titleMenu.centerX = self.view.width * 0.5;
        titleMenu.y =  55;
        self.titleMenu = titleMenu;
    }
    return _titleMenu;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    
    
    // 创建标题按钮
    [self.titleButton setTitle:@"标题按钮" forState:UIControlStateNormal];
    [self.titleButton setImage:[UIImage imageWithNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    self.titleButton.width = 120;
    self.titleButton.height = 38;
    
    [self.titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = self.titleButton;
    
    // 添加左边item按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
}
- (void)pop
{
    TWLog(@"你在点👉边的按钮");
}
- (void)friendSearch
{
    TWLog(@"黑你在点👈边的按钮");
}
/**
 *  点击标题按钮方法
 */
- (void)titleClick:(TWTitleButton *)titleButton
{
    // 准备两张图片,到时候改变,标题按钮的图片
    UIImage * down = [UIImage imageWithNamed:@"navigationbar_arrow_down"];
    UIImage * up = [UIImage imageWithNamed:@"navigationbar_arrow_up"];
    
    if (titleButton.currentImage == down) {
        // 如果按钮是正常状态(也就是没有弹出view的状态)
        
        // 将标题按钮的图片
        [titleButton setImage:up forState:UIControlStateNormal];
        
        // 弹出view
        [self.view.window addSubview:self.titleMenu];
        self.titleMenu.height = 0;
        self.titleMenu.alpha = 0;
        [UIView animateWithDuration:1.0 animations:^{
            // 1秒后, 弹出view高从0变成200  从透明到不透明
            self.titleMenu.height = 200;
            self.titleMenu.alpha = 1;
        }];
        
        // 有弹出view在的时候 ,禁止tableview滚动
        self.tableView.scrollEnabled = NO;
    }else{
        // 如果是弹出view的状态
        
        // 将标题按钮的图片
        [titleButton setImage:down forState:UIControlStateNormal];
        
        [UIView animateWithDuration:1.0 animations:^{
            self.titleMenu.height = 0;
            self.titleMenu.alpha = 0;
        } completion:^(BOOL finished) {
            [self.titleMenu removeFromSuperview];
        }];
        
        // 恢复tableview 可以滚动
        self.tableView.scrollEnabled = YES;
    }
}

#pragma mark - 数据源方法
// 一共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

#pragma mark 每行cell显示什么样的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义一个标示
    static NSString * ID = @"cell";
    
    // 2.去缓存池中找有没有可用的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果缓存中没得的话就自己创建cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell ---%d", indexPath.row];
    
    return cell;
}

// 点解cell 方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * vc = [[UIViewController alloc]init];
    vc.title = [NSString stringWithFormat:@"cell ---%d的控制器", indexPath.row];
    vc.view.backgroundColor = WTRandomColor;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
