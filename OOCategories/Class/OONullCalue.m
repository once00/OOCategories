//
//  OONullCalue.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "OONullCalue.h"

@implementation OONullCalue

NSString *OO_SafeValue(id value) {
    if(!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"]) {
            return @"";
        }
        if ([value isEqualToString:@"(null)"]) {
            return @"";
        }
        return value;
    }else {
        return [NSString stringWithFormat:@"%@",value];
    }
}

NSString *OO_SafeUrl(NSString* urlHead, NSString* urlBody) {
    if(!urlHead
       || [urlHead isEqualToString:@"<null>"]
       || [urlHead isEqualToString:@"(null)"]
       || [urlHead isEqualToString:@""]) {
        return @"";
    }
    
    if(!urlBody
       || [urlBody isEqualToString:@"<null>"]
       || [urlBody isEqualToString:@"(null)"]
       || [urlBody isEqualToString:@""]) {
        return @"";
    }
    
    return [[NSString alloc] initWithFormat:@"%@%@", urlHead, urlBody];
}

//判断是否全是空格

+ (BOOL) isEmpty:(NSString *) str {
    
    if (!str) {
        
        return true;
        
    } else {
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            
            return true;
            
        } else {
            
            return false;
            
        }
        
    }
    
}

@end
