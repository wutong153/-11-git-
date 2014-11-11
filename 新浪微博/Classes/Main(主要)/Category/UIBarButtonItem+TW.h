//
//  UIBarButtonItem+TW.h
//  新浪微博
//
//  Created by Mac on 14-11-9.
//  Copyright (c) 2014年 wutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TW)

/**
 *  普通和高亮状态图片,方法一起搞定
 *
 *  @param image     <#image description#>
 *  @param highImage <#highImage description#>
 *  @param target    <#target description#>
 *  @param action    <#action description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
