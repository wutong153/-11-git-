//
//  TWTitleMenu.m
//  新浪微博
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "TWTitleMenu.h"

@implementation TWTitleMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImage *bg = [UIImage resizbleImage:@"popover_background" leftRatio:1 toRatio:0.5];
    
    
//    UIScrollView
//    UIImage *img = [UIImage imageWithNamed:@"popover_background"];
//    
//
//    
//    UIImage *bg = [img resizableImageWithCapInsets:UIEdgeInsetsMake(20,20,20,20)];
    
    //[bg ]
    [bg drawInRect:rect];
}

//
//-(void)drawRect:(CGRect)rect{
//    
//}

@end
