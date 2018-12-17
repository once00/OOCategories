//
//  OONSPredicate.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/26.
//  Copyright © 2018 Once. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OONSPredicate : NSObject


/**
 比较运算符

 @param obj 比较的谁  (数组SELF  数组字典是对应的key)
 @param op >=，=>,<=，=<,>,<,!=,<>
 @param vl 值
 @param qs 数据源
 @return 备注
 */
+(NSArray *)OOComparisonOperatorObj:(NSString *)obj operator:(NSString *)op value:(NSString *)vl QuerySource:(id)qs;


/**
 必须满足表达式

 @param obj 比较的谁  (数组SELF  数组字典是对应的key)
 @param up 下限
 @param ll 上限
 @param qs 数据源
 @return 备注
 */
+(NSArray *)OOUpperLimitLowerLimitObj:(NSString *)obj UpperLimit:(NSString *)up LowerLimit:(NSString *)ll QuerySource:(id)qs;










@end

NS_ASSUME_NONNULL_END
