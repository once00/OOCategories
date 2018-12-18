//
//  UIViewController+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UIViewController+OO.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIViewController (OO)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector= @selector(OO_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
    });
}

- (void)OO_viewWillAppear:(BOOL)animated {
    
    [self OO_viewWillAppear:animated];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]) {
            scrollView = (UIScrollView *)view;
            break;
        }
    }
    if (!self.automaticallyAdjustsScrollViewInsets) {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    else {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
        }
    }
}

- (void)OO_setAutomaticallyAdjustsScrollViewInsets:(BOOL)automaticallyAdjustsScrollViewInsets {
    
    [self OO_setAutomaticallyAdjustsScrollViewInsets:automaticallyAdjustsScrollViewInsets];
    
}


@end
