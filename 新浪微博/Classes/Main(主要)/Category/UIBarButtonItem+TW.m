//
//  UIBarButtonItem+TW.m
//  新浪微博
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "UIBarButtonItem+TW.h"

@implementation UIBarButtonItem (TW)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton * btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageWithNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithNamed:highImage] forState:UIControlStateHighlighted];
    btn.size = btn.currentBackgroundImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
