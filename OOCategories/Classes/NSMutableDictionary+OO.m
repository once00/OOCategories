//
//  NSMutableDictionary+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "NSMutableDictionary+OO.h"

@implementation NSMutableDictionary (OO)

//字典转KEY Value
-(void)OO_SetObject:(id)anObject forKey:(id<NSCopying>)aKey;
{
    if (anObject == nil) {
        return;
    }
    if ([anObject isKindOfClass:[NSNull class]]) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end
