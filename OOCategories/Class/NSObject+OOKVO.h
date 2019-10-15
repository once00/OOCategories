//
//  NSObject+OOKVO.h
//  Matchmaker
//
//  Created by 曹绍奇 on 2019/8/5.
//  Copyright © 2019 Once. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSObserver : NSMutableArray

+ (instancetype)sharedDSObserver;

@end

@interface NSObject (OOKVO)

/*!
 @method
 @abstract   移除所有观察的keypath
 */
//- (void)removeAllObserverdKeyPath;

@end

NS_ASSUME_NONNULL_END
