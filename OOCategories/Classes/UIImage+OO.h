//
//  UIImage+OO.h
//  Baitaner
//
//  Created by 曹绍奇 on 2021/2/4.
//  Copyright © 2021 北京桀骜文化传媒有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (OO)

/**
 给图片透明度

 @param alpha 透明度
 @param image 图片
 */
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

/**
 * setCornerRadius   view转成image
 * @param view      需要转的view
 **/
+ (UIImage*)OO_imageWithUIView:(UIView*) view;

@end

NS_ASSUME_NONNULL_END
