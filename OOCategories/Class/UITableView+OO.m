//
//  UITableView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UITableView+OO.h"

@implementation UITableView (OO)

+ (UITableView *)table_OO_withStyle:(UITableViewStyle)style
            withScrollEnabled:(BOOL)scroll
            tableviewbackgroundColor:(UIColor *)color
            separatorStyle:(UITableViewCellSeparatorStyle)type
            tableviewCell:(id)cell
            tableviewCellID:(NSString *)cellID{
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableview.separatorStyle = type;
    tableview.showsVerticalScrollIndicator = NO;
    tableview.scrollEnabled = scroll;
    tableview.backgroundColor=color;
    tableview.tableFooterView=[UIView new];
    if (@available(iOS 11.0, *)) {
        tableview.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    }
    [tableview registerClass:[cell class] forCellReuseIdentifier:cellID];
    
    return tableview;
}

@end
