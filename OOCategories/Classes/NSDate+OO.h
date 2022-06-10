//
//  NSDate+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (OO)


/**
 获取当前时间

 @return 无
 */
+ (NSString *)OO_currentDateString;


/**
  按指定格式获取当前的时间

 @param formatterStr 格式
 @return 格式(YYYY-MM-dd hh:mm:ss)
 */
+ (NSString *)OO_currentDateStringWithFormat:(NSString *)formatterStr;

/**
 按指定格式获取时间

 @param formatterStr 格式
 @return 时间
 @return 格式(YYYY-MM-dd hh:mm:ss)
 */
#pragma mark - 按指定格式获取时间
+ (NSString *)OO_currentDateString:(NSDate *)currentDate WithFormat:(NSString *)formatterStr;

#pragma mark - 按指定格式获取当前的时间前几个月 后几个月(-1 前一个月  |  +1 后一个月)

/**
 按指定格式获取当前的时间前几个月 后几个月(-1 前一个月  |  +1 后一个月)

 @param formatterStr 几个月
 @return 格式()
 */
+ (NSString *)OO_currentDateStringWithAddFormat:(NSInteger)formatterStr;










@end

NS_ASSUME_NONNULL_END
