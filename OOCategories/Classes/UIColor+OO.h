//
//  UIColor+OO.h
//  Baitaner
//
//  Created by 曹绍奇 on 2021/1/13.
//  Copyright © 2021 北京桀骜文化传媒有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (OO)

//绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;


//获取16进制颜色的方法
+ (UIColor *)colorWithHex:(NSString *)hexColor;
@end

NS_ASSUME_NONNULL_END
