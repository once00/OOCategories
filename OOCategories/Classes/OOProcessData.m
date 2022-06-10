//
//  OOProcessData.m
//  Encourage
//
//  Created by 曹绍奇 on 2019/4/18.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "OOProcessData.h"

@implementation OOProcessData


//处理数据
+ (NSMutableArray *)DealWithTheData:(NSMutableArray *)arrA DataB:(NSMutableArray *)arrB screeningID:(NSString *)ID{
    
    if (arrB.count == 0) {
        return arrA;
    }
    
    
    NSArray *oldArr = [arrA valueForKeyPath:ID];
    NSArray *newArr = [arrB valueForKeyPath:ID];
    NSArray *addIds = [newArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",oldArr]];
    NSArray *addDatas = [arrB filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.%@ IN %@",ID,addIds]];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:arrA];
    [tempArr addObjectsFromArray:addDatas];
    return tempArr;
}

@end
