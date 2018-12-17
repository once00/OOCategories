//
//  UICollectionView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UICollectionView+OO.h"

@implementation UICollectionView (OO)

+ (UICollectionView *)collview_OO_withStyle:(UICollectionViewScrollDirection)style
                    InteritemSpacin:(CGFloat)lr
                        LineSpacing:(CGFloat)tb
           collectionViewbackgroundColor:(UIColor *)color
                      collectionViewCell:(UICollectionViewCell *)cell
                    collectionViewCellID:(NSString *)cellID{

    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    //设置滚动方向
    [flowlayout setScrollDirection:style];
    //左右间距
    flowlayout.minimumInteritemSpacing = lr;
    //上下间距
    flowlayout.minimumLineSpacing = tb;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
//    collectionView.delegate = self;
//    collectionView.dataSource = self;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView setBackgroundColor:color];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    }
    //注册cell
    [collectionView registerClass:[cell class] forCellWithReuseIdentifier:cellID];
    
    return collectionView;
}

@end
