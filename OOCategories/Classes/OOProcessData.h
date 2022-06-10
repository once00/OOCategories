//
//  OOProcessData.h
//  Encourage
//
//  Created by 曹绍奇 on 2019/4/18.
//  Copyright © 2019 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OOProcessData : NSObject

/**
 *  处理数据筛选(面向数组对象)
 *
 *  @param arrA 总数组
 *  @param arrB 筛选数组
 *  @param ID 根据谁过滤
 */
+ (NSMutableArray *)DealWithTheData:(NSMutableArray *)arrA DataB:(NSMutableArray *)arrB screeningID:(NSString *)ID;

@end

NS_ASSUME_NONNULL_END
