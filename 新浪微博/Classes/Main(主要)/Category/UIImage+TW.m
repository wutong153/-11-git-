//
//  UIImage+TW.m
//  新浪微博
//
//  Created by Mac on 14-11-6.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import "UIImage+TW.h"

@implementation UIImage (TW)

+ (UIImage *)imageWithNamed:(NSString *)name
{
    // 1.需要返回的图片
    UIImage * image = nil;
    
    
    
    // 判断系统版本
    if (iOS7) {
        NSString *ios7Name = [name stringByAppendingString:@"_os7"];
        // 加载ios7的图片
        image = [self imageNamed:ios7Name];
    }
    
    if (image == nil) {
        image = [self imageNamed:name];
    }
    
    return image;
}

@end
