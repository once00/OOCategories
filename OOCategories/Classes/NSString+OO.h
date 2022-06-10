//
//  NSString+OO.h
//  qm
//
//  Created by 作作有芒1 on 2021/5/20.
//  Copyright © 2021 谢元潮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (OO)

/*
 startStr 要从哪几个字符开始截取,如果从第0个字符开始截,输入nil或@""
 endStr   要从哪几个字符结束,如果截到最后输入nil或@""
 例: 我喜欢abc123还有跳跳跳舞  startStr:欢a  endStr:有跳跳   输出结果是:bc123还
 */
- (NSString *)selcteStringWithSelectSatrt:(NSString *)startStr selecteEnd:(NSString *)endStr;

/*
 URL拼接参数
 startStr 要从哪几个字符开始截取,如果从第0个字符开始截,输入nil或@""
 endStr   要从哪几个字符结束,如果截到最后输入nil或@""
 例: 我喜欢abc123还有跳跳跳舞  startStr:欢a  endStr:有跳跳   输出结果是:bc123还
 */
//拼接参数
-(NSString *)urlAddCompnentForValue:(NSString *)value key:  (NSString *)key;

/**
 手机号转星号

 @param aPhoneNum 手机号
 @return 手机号固定为11位
 */
//
+ (NSString *)OO_phoneNumToAsterisk:(NSString*)aPhoneNum;

/**
 身份证号转星号

 @param aIdCardNum 身份证号
 @return 取身份证号第四位开始的后面十个字符转为星号 身份证号固定为18位
 */
+ (NSString*)OO_idCardToAsterisk:(NSString *)aIdCardNum;

@end

NS_ASSUME_NONNULL_END
