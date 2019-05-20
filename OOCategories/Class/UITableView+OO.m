//
//  UITableView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UITableView+OO.h"
#import "OOCommonMacro.h"
#import <objc/runtime.h>

static char UITableViewEmptyView;

@implementation UITableView (OO)

@dynamic emptyTabView;

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

/**
 添加空白页面
 
 @param img 展位图
 @return 无
 */
-(void)addEmptyViewWithTabPositionType:(UIImage *)img{
    
    if (!self.emptyTabView){
        
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
        UIView* noMessageView = [[UIView alloc] initWithFrame:frame];
        noMessageView.backgroundColor = [UIColor clearColor];
        
        UIImageView *carImageView = [[UIImageView alloc] init];
        [noMessageView addSubview:carImageView];
        
        [self addSubview:noMessageView];
        
        [carImageView setImage:img];
        carImageView.frame=CGRectMake((frame.size.width-img.size.width)/2, ((frame.size.height-img.size.height)/2) * 0.6, CONTROL_W(360), CONTROL_W(376));
        
        self.emptyView = noMessageView;
        
    }
}
- (UIView *)emptyView
{
    return objc_getAssociatedObject(self, &UITableViewEmptyView);
}
- (void)setEmptyView:(UIView *)emptyView
{
    [self willChangeValueForKey:@"OOTabEmptyView"];
    objc_setAssociatedObject(self, &UITableViewEmptyView,
                             emptyView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"OOTabEmptyView"];
}



@end
