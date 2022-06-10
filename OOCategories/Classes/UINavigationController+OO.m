//
//  UINavigationController+OO.m
//  qm
//
//  Created by 作作有芒1 on 2021/4/19.
//  Copyright © 2021 谢元潮. All rights reserved.
//

#import "UINavigationController+OO.h"
#import <objc/runtime.h>

@implementation UINavigationController (OO)

+ (void)load {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector= @selector(OOpushViewController:animated:);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        method_exchangeImplementations(originalMethod,swizzledMethod);
        
    });
}

- (void)OOpushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //防止一个页面多次跳转
    if ([self.viewControllers.lastObject isKindOfClass:[viewController class]]) {
        return;
    }
    
    [self OOpushViewController:viewController animated:animated];
}

@end
