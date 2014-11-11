//
//  TWTitleButton.m
//  新浪微博
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWTitleButton.h"
// 按钮标题按钮图片的宽度
#define TWTitleButtonImageW 30

@implementation TWTitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //  设置文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        /**
         *  把字体变粗一点
         */
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        // 高亮时不要让imageView变灰色
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        
        // 背景
        [self setBackgroundImage:[UIImage resizbleImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    }
    return self;
}

// 设置图片的的位置 和宽高
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = TWTitleButtonImageW;
    CGFloat imageX = self.width -imageW;
    CGFloat imageH = self.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

// 设置文字的位置 和宽高
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = self.width -TWTitleButtonImageW;
    CGFloat titleH = self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
