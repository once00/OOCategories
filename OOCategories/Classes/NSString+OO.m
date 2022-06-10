//
//  NSString+OO.m
//  qm
//
//  Created by 作作有芒1 on 2021/5/20.
//  Copyright © 2021 谢元潮. All rights reserved.
//

#import "NSString+OO.h"

@implementation NSString (OO)

/*
 startStr 要从哪几个字符开始截取,如果从第0个字符开始截,输入nil或@""
 endStr   要从哪几个字符结束,如果截到最后输入nil或@""
 例: 我喜欢abc123还有跳跳跳舞  startStr:欢a  endStr:有跳跳   输出结果是:bc123还
 */
- (NSString *)selcteStringWithSelectSatrt:(NSString *)startStr selecteEnd:(NSString *)endStr {
    
    NSString *startRegStr = [startStr stringByReplacingOccurrencesOfString:@"[" withString:@"\\["];//转义[

    NSString *endRegStr = [endStr stringByReplacingOccurrencesOfString:@"[" withString:@"\\["];//转义[

    NSString *regStr = [NSString stringWithFormat:@"%@.*?%@",startRegStr,endRegStr];//拼接正则字符
    
    
    if (endStr.length == 0 ) {
        regStr = [NSString stringWithFormat:@"%@.*",startRegStr];
    }
    
    
    if (startStr.length == 0) {
        regStr = [NSString stringWithFormat:@".*?%@",endStr];
    }
   
    
    //正则方法截取字符串
    NSRange codeRange = [self rangeOfString:regStr options:NSRegularExpressionSearch];
    
    NSString *return_code;
    
    if (codeRange.location != NSNotFound){
        
        return_code = [self substringWithRange:codeRange];
        
        
        if (startStr.length) {
            return_code = [return_code stringByReplacingOccurrencesOfString:startStr withString:@""];
        }
        
        if (endStr.length) {
            return_code = [return_code stringByReplacingOccurrencesOfString:endStr withString:@""];
        }
        
    }else{
        
        return_code = @"字符串截取失败";
    }
    
    return return_code;
}

/*
 .  元字符可以匹配包括他自己的任何字符
 \ 转义字符 可以转义 . [  字符
 [ 和]字符  [0-9] 等价于 [0123456789]
 + 字符 : 一个字符一次或者多次重复出现   [0-9]+   表示大于等于1的一堆数字,
 + 是元字符, 匹配他自己要使用转义符,  \+
 * 字符, 和+用法完全相同,表示 0个到多个 >= 0的意思
 ?字符, 匹配0个或者一个         >=0  && <= 1
 
 [ 是正则里的和字符,有特殊含义,如果文字出现这种字符需要加\变成\[转义, 但\在oc里是特殊的转义字符, 所以还需要对\进行转义,就变成了\\[
 .*?  正则里.是元字符可以匹配任何字符 .*是贪婪型字符, 如果稳重出现多次 相同字符串,他会全部匹配出来  .*?是懒惰型字符, 如果文中有多个重复字符,他只会匹配第一个出来
 例:  123uYku7 用.*匹配u 会输出两个字符串:u和u, 用.*?匹配u 会输出一个字符串:u
 */


-(NSString *)urlAddCompnentForValue:(NSString *)value key:(NSString *)key{
    
    NSMutableString *string = [[NSMutableString alloc]initWithString:self];
    @try {
        NSRange range = [string rangeOfString:@"?"];
        if (range.location != NSNotFound) {//找到了
            //如果?是最后一个直接拼接参数
            if (string.length == (range.location + range.length)) {
                NSLog(@"最后一个是?");
                string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,value]];
            }else{//如果不是最后一个需要加&
                if([string hasSuffix:@"&"]){//如果最后一个是&,直接拼接
                    string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,value]];
                }else{//如果最后不是&,需要加&后拼接
                    string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,value]];
                }
            }
        }else{//没找到
            if([string hasSuffix:@"&"]){//如果最后一个是&,去掉&后拼接
                string = (NSMutableString *)[string substringToIndex:string.length-1];
            }
            string = (NSMutableString *)[string stringByAppendingString:[NSString stringWithFormat:@"?%@=%@",key,value]];
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
    return string.copy;
}

//手机号固定为11位
+ (NSString *)OO_phoneNumToAsterisk:(NSString*)aPhoneNum{
    if (aPhoneNum.length!=11) {
        return @"";
    }
    return [aPhoneNum
    stringByReplacingCharactersInRange:NSMakeRange(3,4) withString:@"****"];
}

//取身份证号第四位开始的后面十个字符转为星号 身份证号固定为18位
+ (NSString*)OO_idCardToAsterisk:(NSString *)aIdCardNum{
    if (aIdCardNum.length!=18) {
        return @"";
    }
    return [aIdCardNum stringByReplacingCharactersInRange:NSMakeRange(4, 10) withString:@"**********"];
}

@end
