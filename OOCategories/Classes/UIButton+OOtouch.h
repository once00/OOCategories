//
//  UIButton+OOtouch.h
//  qm
//
//  Created by 作作有芒1 on 2021/4/27.
//  Copyright © 2021 谢元潮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define defaultInterval 1  //默认时间间隔
@interface UIButton (OOtouch)
/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;
/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;

@end

NS_ASSUME_NONNULL_END
