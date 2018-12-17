//
//  UIScrollView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (OO)


/**
 初始化Scroll

 @param color 背景颜色
 @return 无
 */
+ (UIScrollView *)scrollview_OO_withtableviewbackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
