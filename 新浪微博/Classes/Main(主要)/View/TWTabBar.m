//
//  TWTabBar.m
//  新浪微博
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWTabBar.h"
#import "TWTabBarButton.h"

@interface TWTabBar ()
@property (nonatomic, weak)UIButton * plusButton;
// 装选项卡按钮的数组
@property (nonatomic, strong)NSMutableArray * tabBarButtons;

// 选中的tabBarButton
@property (nonatomic, weak)TWTabBarButton * selectedTabBarButton;
@end

@implementation TWTabBar

// 选项卡按钮数组的懒加载
- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

// 加号按钮的懒加载
- (UIButton *)plusButton
{// 小重构
    if (!_plusButton) {
        // 添加一个加号按钮(中间的加号按钮)
        UIButton * plusButton = [[UIButton alloc]init];
        
        // 设置背景
        [plusButton setBackgroundImage:[UIImage imageWithNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        // 设置图标
        [plusButton setImage:[UIImage imageWithNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        // 添加到view
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }
    return _plusButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景
        [self setupBg];

    }
    return self;
}

/**
 *  设置背景
 */
- (void)setupBg
{
    if (iOS7) {
        //self.backgroundColor = [UIColor whiteColor];
    }else
    {
        // 这个方法设置背景图片,可以将一个下图片平铺整个宽
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNamed:@"tabbar_background"]];
    }
//    NSString * y  = @"sdd33"; 2014年11月07日11:00:21 实验
    
}



/**
 *  专门设置TWTabBar下面的子控件的 frame
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置中间加号按钮的frame
    [self setupPlusButtonFrame];
    
    // 设置选项卡按钮的frame
    [self setupTabBarButtonFrame];
    
}

/**
 *  4个选项卡按钮的frame ============================================
 */
- (void)setupTabBarButtonFrame
{// 2014年11月08日13:04:21 小重构
    int count = self.tabBarButtons.count;
    CGFloat buttonW = self.width / (count + 1);
    CGFloat buttonH = self.height;
    for (int i = 0; i < count; i++) {
        UIButton * button = self.tabBarButtons[i];
        button.width = buttonW;
        button.height = buttonH;
        button.x = buttonW * i;
        button.y = 0;
        
        // 因为中间有一个加号按钮, 所以右边的两个选项卡按钮的x就要多加一个按钮的宽度
        if (i >= count / 2) {
            button.x += buttonW;
        }
    }
}



/**
 *  中间按钮的frame  ============================================
 */
- (void)setupPlusButtonFrame
{
    // 1.计算加号按钮的位置和尺寸
    // 这句是拿到背景图片的宽高, 然后根据图片宽高设置按钮的宽高
    CGSize plusButtonSize = self.plusButton.currentBackgroundImage.size;
    
    // 尺寸
    self.plusButton.width = plusButtonSize.width;
    self.plusButton.height = plusButtonSize.height;
    
    // 设置终点
    self.plusButton.centerY = self.height * 0.5;
    self.plusButton.centerX = self.width * 0.5;
}


#pragma mark 选项卡添加方法
// 选项卡按钮添加方法
- (void)addTabBarButton:(UITabBarItem *)item
{
    TWTabBarButton * button = [[TWTabBarButton alloc]init];
    button.item = item;
    // 给每一个按钮添加一个方法
    [button addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    // 设置每个按钮额tag
    button.tag = self.tabBarButtons.count;
   
    // 将按钮添加到 自己的肚皮上
    [self addSubview:button];
    // 将填好数据的button添加到准备好的数组
    [self.tabBarButtons addObject:button];
    
    // 默认最前面的按钮选中
    if (self.tabBarButtons.count == 1) {
        [self tabBarButtonClick:button];
    }
}


- (void)tabBarButtonClick:(TWTabBarButton *)tabBarButton
{
    // 总结我最开始还以为这两个方法是分开的,那个时候找不到to值怎么搞
    // 原来代理方法自己不用实现,而是直接调用,哎
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        int from = self.selectedTabBarButton.tag;
        int to = tabBarButton.tag;
        [self.delegate tabBar:self didSelectButtonFrom:from to:to];
    }
    
    
    self.selectedTabBarButton.selected = NO;
    tabBarButton.selected = YES;
    self.selectedTabBarButton = tabBarButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
