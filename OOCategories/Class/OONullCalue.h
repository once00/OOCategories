//
//  OONullCalue.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OONullCalue : NSObject

/**
  过滤value中的空值

 @param value 值
 @return 无
 */
NSString *OO_SafeValue(id value);

NSString *OO_SafeUrl(NSString* urlHead, NSString* urlBody);

//判断是否全是空格

+ (BOOL) isEmpty:(NSString *) str;

@end

NS_ASSUME_NONNULL_END
