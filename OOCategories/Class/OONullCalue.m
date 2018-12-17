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

@end
