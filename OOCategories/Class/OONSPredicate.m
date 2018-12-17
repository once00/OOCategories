//
//  OONSPredicate.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/26.
//  Copyright © 2018 Once. All rights reserved.
//

#import "OONSPredicate.h"

@implementation OONSPredicate

+(NSArray *)OOComparisonOperatorObj:(NSString *)obj operator:(NSString *)op value:(NSString *)vl QuerySource:(id)qs{
    NSMutableArray *results=[NSMutableArray array];
    
    //定义谓词对象,谓词对象中包含了过滤条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ %@ %@",obj,op,vl];
    //使用谓词条件过滤数组中的元素,过滤之后返回查询的结果
    NSArray *array = [qs filteredArrayUsingPredicate:predicate];
    
    [results removeAllObjects];
    [results addObjectsFromArray:array];
    
    return results;
}

+(NSArray *)OOUpperLimitLowerLimitObj:(NSString *)obj UpperLimit:(NSString *)up LowerLimit:(NSString *)ll QuerySource:(id)qs{
    NSMutableArray *results=[NSMutableArray array];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ BETWEEN {%@, %@}",obj,up,ll];
    //使用谓词条件过滤数组中的元素,过滤之后返回查询的结果
    NSArray *array = [qs filteredArrayUsingPredicate:predicate];
    
    [results removeAllObjects];
    [results addObjectsFromArray:array];
    
    return results;
}

@end
