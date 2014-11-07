//
//  UIView+TW.m
//  新浪微博
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "UIView+TW.h"

@implementation UIView (TW)
// x, y 的set get方法 ==================================
// x的-------------------------
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
// y的-------------------------
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}

// 中心点center 的set get方法 ===========================
// CenterX-------------------------
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(CGFloat)centerX
{
    return self.center.x;
}
// CenterY-------------------------
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY
{
    return self.center.y;
}

// width, height宽高的 set get方法 ==================================
// 高-------------------------
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}
// 宽-------------------------
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width
{
    return self.frame.size.width;
}
@end
