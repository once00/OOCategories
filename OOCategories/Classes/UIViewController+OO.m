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
        
        SEL originalSelector1 = @selector(viewDidLoad);
        SEL swizzledSelector1= @selector(OO_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
        Method originalMethod1 = class_getInstanceMethod(class,originalSelector1);
        Method swizzledMethod1 = class_getInstanceMethod(class,swizzledSelector1);
        method_exchangeImplementations(originalMethod1,swizzledMethod1);
    });
}

- (void)OO_viewWillAppear:(BOOL)animated {
    
    [self OO_viewWillAppear:animated];
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//
//    UIScrollView *scrollView = nil;
//    for (UIView *view in self.view.subviews) {
//        if ([view isKindOfClass:[UITableView class]] || [view isKindOfClass:[UICollectionView class]]) {
//            scrollView = (UIScrollView *)view;
//            break;
//        }
//    }
//    if (!self.automaticallyAdjustsScrollViewInsets) {
//        if (@available(iOS 11.0, *)) {
//            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        }
//    }
//    else {
//        if (@available(iOS 11.0, *)) {
//            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
//        }
//    }
}

- (void)OO_viewDidLoad {
    [self OO_viewDidLoad];
    
    // iOS 15适配
//        if (@available(iOS 15.0, *)) {
//            UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
//            [appearance setBackgroundColor:[UIColor whiteColor]];
////            [appearance setShadowImage:[DFCMacros createImageWithColor:[UIColor whiteColor]]];
////            appearance.titleTextAttributes = dict;
////            [appearance setBackIndicatorImage:backButtonImage transitionMaskImage:backButtonImage];
//            // UINavigationBarAppearance 会覆盖原有的导航栏设置，这里需要重新设置返回按钮隐藏
////            appearance.backButtonAppearance.normal.titlePositionAdjustment = UIOffsetMake(NSIntegerMin, -200);
//            [[UINavigationBar appearance] setScrollEdgeAppearance: appearance];
//            [[UINavigationBar appearance] setStandardAppearance:appearance];
//        }
    
//    if (@available(iOS 13.0, *)) {
//        UINavigationBarAppearance * appearance = [[UINavigationBarAppearance alloc] init];
//        // 背景色
//        appearance.backgroundColor = [UIColor whiteColor];
//        // 去除导航栏阴影（如果不设置clear，导航栏底下会有一条阴影线）
////        appearance.shadowColor = [UIColor clearColor];
//        // 字体颜色、尺寸等
//        appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor redColor]};
//        // 带scroll滑动的页面
//        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
//        // 常规页面
//        self.navigationController.navigationBar.standardAppearance = appearance;
//    }
    
//    if (@available(iOS 13.0, *)) {
//        UITabBarAppearance * appearance = [[UITabBarAppearance alloc] init];
//         // 背景色
//        appearance.backgroundColor = [UIColor whiteColor];
//        self.tabBarController.tabBar.standardAppearance = appearance;
//        if (@available(iOS 15.0, *)) {
//            self.tabBarController.tabBar.scrollEdgeAppearance = appearance;
//        }
//    }

    //或者全局设置
//    if (@available(iOS 15.0, *)) {
//        [UITableView appearance].sectionHeaderTopPadding = 0;
//    }
    
    //视图从导航栏下开始布局
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

@end
