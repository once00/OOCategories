//
//  OOUICollectionViewFlowLayout.h
//  TUIKitDemo
//
//  Created by 纳 on 2021/11/12.
//  Copyright © 2021 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,OOUICollectionViewFlowLayoutCellAlignType){
    OOUICollectionViewFlowLayoutWithLeft,
    OOUICollectionViewFlowLayoutWithCenter,
    OOUICollectionViewFlowLayoutWithRight
};


@interface OOUICollectionViewFlowLayout : UICollectionViewFlowLayout
//两个Cell之间的距离
@property (nonatomic,assign)CGFloat betweenOfCell;
//cell对齐方式
@property (nonatomic,assign)OOUICollectionViewFlowLayoutCellAlignType cellType;

-(instancetype)initWthType : (OOUICollectionViewFlowLayoutCellAlignType)cellType;
//全能初始化方法 其他方式初始化最终都会走到这里
-(instancetype)initWithType:(OOUICollectionViewFlowLayoutCellAlignType) cellType betweenOfCell:(CGFloat)betweenOfCell;

@end

NS_ASSUME_NONNULL_END
