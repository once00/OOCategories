//
//  OOTime.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OOTime : NSObject


/**
 对比两个时间差

 @param starttime 开始时间
 @param endtime 结束时间
 @return 格式 (yyyy-MM-dd HH:mm:ss)
 */
+ (NSDictionary *)OO_datepleaseInsertStarTimeo:(NSString *)starttime andInsertEndTime:(NSString *)endtime;


/**
 比较两个时间大小

 @param aDate 第一个时间
 @param bDate 第二个时间
 @return 格式(yyyy-MM-dd HH:mm:ss) 0 相等 1 bDate大 2 aDate大
 */
+ (NSInteger)OO_datecompareDate:(NSString*)aDate withDate:(NSString*)bDate;



/**
 获取一年的时间数组

 @param year 年份
 @return 格式(2018) 
 */
+(NSArray *)OO_GetDayarr:(NSInteger)year;



/**
 根据日期转换星期

 @param data 具体日期
 @return 格式(yyyy-MM-dd HH:mm:ss)
 */
+(NSString *)OO_getGetthedate:(NSString *)data;



/**
 通过年月求每月天数

 @param year 年
 @param month 月
 @return 格式(year=2028  month=02)
 */
+ (NSInteger)OO_DaysfromYear:(NSInteger)year andMonth:(NSInteger)month;




/**
 将某个时间戳转化成 时间

 @param timestamp 时间戳 
 @param format 格式
 @return 格式 (YYYY-MM-dd hh:mm:ss)
 */
+(NSString *)OO_timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;




/**
 将某个时间转化成 时间戳

 @param formatTime 时间
 @param format 格式
 @return 格式 (YYYY-MM-dd hh:mm:ss)
 */
+(NSInteger)OO_timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;


@end

NS_ASSUME_NONNULL_END
