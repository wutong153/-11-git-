//
//  TWSearchBar.m
//  新浪微博
//
//  Created by Mac on 14-11-8.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWSearchBar.h"

@implementation TWSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.背景
        self.background = [UIImage resizbleImage:@"searchbar_textfield_background"];
        // 2.设置垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        // 3.右边显示一个清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        // 4.左边显示一个放大镜图片
        // 一个图片 放到view里面居中宽度30 输入框的左边view是view 模式是永远显示
        UIImage *icon = [UIImage imageWithNamed:@"searchbar_textfield_search_icon"];
        UIImageView * iconView = [[UIImageView alloc]initWithImage:icon];
        iconView.contentMode = UIViewContentModeCenter; // 居中显示
        iconView.width = 30;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        // 5.设置placeholder 占位符
        self.placeholder = @"请输入搜索内容";
    }
    return self;
}

@end
