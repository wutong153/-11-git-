//
//  TWTabBarButton.m
//  新浪微博
/*
 为了我们自定义的tabbar 的TabBarItem 图片在上面文字在下面都是居中显示我们
 就自定义了这个button
 */

#import "TWTabBarButton.h"
// 设置图片占整个按钮view的比例
#define TWTabBarButtonImageRatio 0.6

@implementation TWTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}
/**2014年11月07日18:53:12
 *  重写内部的排版方法,设置图片文字的frame让图片在上面,文字在下面,都是居中 ===================
 */
// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = self.width;
    CGFloat imageH = self.height * TWTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

// 内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.height * TWTabBarButtonImageRatio;
    CGFloat titleW = self.width;
    CGFloat titleH = self.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
/**2014年11月07日18:53:14
 *  设置按钮 文字 文字颜色 图片(普通图片) 选中的图片 =====================================
 */
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // 文字颜色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    // 文字内容
    [self setTitle:item.title forState:UIControlStateNormal];
    // 图标
    [self setImage:item.image forState:UIControlStateNormal];
    // 选中的图标
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

//  重写高亮方法 去掉那啥状态
- (void)setHighlighted:(BOOL)highlighted
{
    
}
@end
