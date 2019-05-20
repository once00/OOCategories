//
//  UICollectionView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UICollectionView+OO.h"
#import "OOCommonMacro.h"
#import <objc/runtime.h>

static char UICollectionViewEmptyView;

@implementation UICollectionView (OO)

@dynamic emptyCollView;

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


/**
 添加空白页面
 
 @param img 展位图
 @return 无
 */
-(void)addEmptyViewWithCollPositionType:(UIImage *)img{
    
    if (!self.emptyCollView){
        
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
    return objc_getAssociatedObject(self, &UICollectionViewEmptyView);
}
- (void)setEmptyView:(UIView *)emptyView
{
    [self willChangeValueForKey:@"OOcollEmptyView"];
    objc_setAssociatedObject(self, &UICollectionViewEmptyView,
                             emptyView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"OOcollEmptyView"];
}


@end
