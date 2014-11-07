//
//  TWTabBar.m
//  新浪微博
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWTabBar.h"

@interface TWTabBar ()
@property (nonatomic, weak)UIButton * plusButton;
// 装选项卡按钮的数组
@property (nonatomic, strong)NSMutableArray * tabBarButtons;
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景
        [self setupBg];
        
        // 增加一个加号按钮
        [self setupPlusButton];
    }
    return self;
}

/**
 *  设置背景
 */
- (void)setupBg
{
    if (iOS7) {
        self.backgroundColor = [UIColor whiteColor];
    }else
    {
        // 这个方法设置背景图片,可以将一个下图片平铺整个宽
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNamed:@"tabbar_background"]];
    }
    NSString * y  = @"sdd33";
    
}

/**
 *  添加中间那个加号按钮
 */
- (void)setupPlusButton
{
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
{
    int count = self.tabBarButtons.count;
    for (int i = 0; i < count; i++) {
        UIButton * button = self.tabBarButtons[i];
        button.width = self.width / (count + 1);
        button.height = self.height;
        button.x = button.width * i;
        button.y = 0;
        
        // 因为中间有一个加号按钮, 所以右边的两个选项卡按钮的x就要多加一个按钮的宽度
        if (i >= count / 2) {
            button.x += button.width;
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
    UIButton * button = [[UIButton alloc]init];
    
    // 文字颜色
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 文字
    [button setTitle:item.title forState:UIControlStateNormal];
    
    // 图片
    [button setImage:item.image forState:UIControlStateNormal];
    
    // 选中的图标
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    // 将按钮添加到 自己的肚皮上
    [self addSubview:button];
    
    // 将填好数据的button添加到准备好的数组
    [self.tabBarButtons addObject:button];
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
