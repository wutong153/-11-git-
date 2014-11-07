//
//  TWTabBar.h
//  新浪微博
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWTabBar : UIView

/**
 *  添加一个选项卡按钮
 *
 *  @param item 选项卡按钮对应的模型数据 (标题\图标\选中的图标)
 */
- (void)addTabBarButton:(UITabBarItem *)item;
@end
