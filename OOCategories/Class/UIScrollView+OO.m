//
//  UIScrollView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UIScrollView+OO.h"

@implementation UIScrollView (OO)

+ (UIScrollView *)scrollview_OO_withtableviewbackgroundColor:(UIColor *)color{
    
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.backgroundColor=color;
    if (@available(iOS 11.0, *)) {
        scrollview.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    }
    
    return scrollview;
}

@end
