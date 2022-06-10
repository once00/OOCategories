//
//  UITableView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (OO)

@property (nonatomic, strong, readonly) UIView *emptyTabView;

/**
 样式,是否滚动,背景颜色,分割线样式,cell,cellID

 @param style 样式
 @param scroll 是否滚动
 @param color 背景颜色
 @param type 分割线样式
 @param cell cell
 @param cellID cellID
 @return 无
 */
+ (UITableView *)table_OO_withStyle:(UITableViewStyle)style
                  withScrollEnabled:(BOOL)scroll
           tableviewbackgroundColor:(UIColor *)color
                     separatorStyle:(UITableViewCellSeparatorStyle)type
                      tableviewCell:(id)cell
                    tableviewCellID:(NSString *)cellID;
/**
 添加空白页面
 
 @param img 展位图
 @return 无
 */
-(void)addEmptyViewWithTabPositionType:(UIImage *)img;

@end

NS_ASSUME_NONNULL_END
