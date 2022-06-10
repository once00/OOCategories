//
//  NSObject+OOKVO.m
//  Matchmaker
//
//  Created by 曹绍奇 on 2019/8/5.
//  Copyright © 2019 Once. All rights reserved.
//

#import "NSObject+OOKVO.h"
#import <objc/runtime.h>
#import <objc/runtime.h>


@implementation DSObserver
+ (instancetype)sharedDSObserver
{
    static id objc;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objc = [NSMutableArray array];
    });
    return objc;
}

@end

@implementation NSObject (OOKVO)

//+ (void)load
//{
//    [self switchMethod];
//}
//
//+ (void)switchMethod
//{
//    SEL removeSel = @selector(removeObserver:forKeyPath:);
//    SEL myRemoveSel = @selector(removeDasen:forKeyPath:);
//    SEL addSel = @selector(addObserver:forKeyPath:options:context:);
//    SEL myaddSel = @selector(addDasen:forKeyPath:options:context:);
//    
//    Method systemRemoveMethod = class_getClassMethod([self class],removeSel);
//    Method DasenRemoveMethod = class_getClassMethod([self class], myRemoveSel);
//    Method systemAddMethod = class_getClassMethod([self class],addSel);
//    Method DasenAddMethod = class_getClassMethod([self class], myaddSel);
//    
//    method_exchangeImplementations(systemRemoveMethod, DasenRemoveMethod);
//    method_exchangeImplementations(systemAddMethod, DasenAddMethod);
//}


#pragma mark - 第一种方案，利用@try @catch
//// 交换后的方法
//- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath
//{
//    @try {
//        [self removeDasen:observer forKeyPath:keyPath];
//    } @catch (NSException *exception) {}
//
//}

//// 交换后的方法
//- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
//{
//    [self addDasen:observer forKeyPath:keyPath options:options context:context];
//
//}

#pragma mark - 第二种方案，利用私有属性
//// 交换后的方法
//- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath
//{
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//    ObserverData *userPathData = [self observerKeyPath:keyPath];
//    // 如果有该key值那么进行删除
//    if (userPathData) {
//        [Observers removeObject:userPathData];
//        [self removeDasen:observer forKeyPath:keyPath];
//    }
//    return;
//}
//
//// 交换后的方法
//- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
//{
//    ObserverData *userPathData= [[ObserverData alloc]initWithObjc:self key:keyPath];
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//
//    // 如果没有注册，那么才进行注册
//    if (![self observerKeyPath:keyPath]) {
//        [Observers addObject:userPathData];
//        [self addDasen:observer forKeyPath:keyPath options:options context:context];
//    }
//
//}
//
//// 进行检索，判断是否已经存储了该Key值
//- (ObserverData *)observerKeyPath:(NSString *)keyPath
//{
//    NSMutableArray *Observers = [DSObserver sharedDSObserver];
//    for (ObserverData *data in Observers) {
//        if ([data.objc isEqual:self] && [data.keyPath isEqualToString:keyPath]) {
//            return data;
//        }
//    }
//    return nil;
//}

#pragma mark - 第三种方案，利用私有属性
// 交换后的方法
- (void)removeDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if ([self observerKeyPath:keyPath observer:observer]) {
        [self removeDasen:observer forKeyPath:keyPath];
    }
}

// 交换后的方法
- (void)addDasen:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (![self observerKeyPath:keyPath observer:observer]) {
        [self addDasen:observer forKeyPath:keyPath options:options context:context];
    }
}


// 进行检索获取Key
- (BOOL)observerKeyPath:(NSString *)key observer:(id )observer
{
    id info = self.observationInfo;
    NSArray *array = [info valueForKey:@"_observances"];
    for (id objc in array) {
        id Properties = [objc valueForKeyPath:@"_property"];
        id newObserver = [objc valueForKeyPath:@"_observer"];
        
        NSString *keyPath = [Properties valueForKeyPath:@"_keyPath"];
        if ([key isEqualToString:keyPath] && [newObserver isEqual:observer]) {
            return YES;
        }
    }
    return NO;
}

@end


//@implementation NSObject (OOKVO)
//
//+ (void)load {
//
//    Method originAddM = class_getInstanceMethod([self class], @selector(addObserver:forKeyPath:options:context:));
//    Method swizzAddM = class_getInstanceMethod([self class], @selector(swizz_addObserver:forKeyPath:options:context:));
//
//    Method originRemoveM = class_getInstanceMethod([self class], @selector(removeObserver:forKeyPath:context:));
//    Method swizzRemoveM = class_getInstanceMethod([self class], @selector(swizz_removeObserver:forKeyPath:context:));
//
//    IMP originAddMIMP = class_getMethodImplementation([self class], @selector(addObserver:forKeyPath:options:context:));
//    IMP originRemoveIMP = class_getMethodImplementation([self class], @selector(removeObserver:name:object:));
//
//    BOOL hasAddM = class_addMethod([self class], @selector(addObserver:forKeyPath:options:context:), originAddMIMP, method_getTypeEncoding(originAddM));
//
//
//    BOOL hasRemoveM = class_addMethod([self class], @selector(removeObserver:forKeyPath:context:), originRemoveIMP, method_getTypeEncoding(originRemoveM));
//
//    // excute once
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (!hasAddM) {
//            method_exchangeImplementations(originAddM, swizzAddM);
//        }
//        if (!hasRemoveM) {
//            method_exchangeImplementations(originRemoveM, swizzRemoveM);
//        }
//    });
//}
//
//- (void)swizz_addObserver:(nonnull NSObject *)observer forKeyPath:(nonnull NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
//    if (![self hasKey:keyPath]) {
//        // 调用系统的添加observer 方法
//        [self swizz_addObserver:observer forKeyPath:keyPath options:options context:context];
//    }
//}
//- (void)swizz_removeObserver:(nonnull NSObject *)observer forKeyPath:(nonnull NSString *)keyPath context:(nullable void *)context {
//    if ([self hasKey:keyPath]) {
//        [self swizz_removeObserver:observer forKeyPath:keyPath context:context];
//    }
//}
//
//- (void)removeAllObserverdKeyPath {
//    id info = self.observationInfo;
//    NSArray *arr = [info valueForKeyPath:@"_observances._property._keyPath"];
//    for (NSString *keyPath in arr) {
//        // TODO context 需要考虑值不为nil的时候
//        [self removeObserver:self forKeyPath:keyPath context:nil];
//    }
//}
//
//- (BOOL)hasKey:(NSString *)kvoKey {
//    BOOL hasKey = NO;
//    id info = self.observationInfo;
//    NSArray *arr = [info valueForKeyPath:@"_observances._property._keyPath"];
//    for (id keypath in arr) {
//        // 存在kvo 的key
//        if ([keypath isEqualToString:kvoKey]) {
//            hasKey = YES;
//            break;
//        }
//    }
//    return hasKey;
//}
//
//@end
