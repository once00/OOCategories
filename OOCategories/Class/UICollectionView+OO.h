//
//  UICollectionView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (OO)


/**
 初始化UICollectionView

 @param style 滚动方向
 @param lr 左右间距
 @param tb 上下间距
 @param color 背景颜色
 @param cell cell
 @param cellID cellID
 @return 无
 */
+ (UICollectionView *)collview_OO_withStyle:(UICollectionViewScrollDirection)style
                            InteritemSpacin:(CGFloat)lr
                                LineSpacing:(CGFloat)tb
              collectionViewbackgroundColor:(UIColor *)color
                         collectionViewCell:(UICollectionViewCell *)cell
                       collectionViewCellID:(NSString *)cellID;

@end

NS_ASSUME_NONNULL_END
