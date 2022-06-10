//
//  UIImageView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (OO)

/**
 *  大小,图片,图片的显示方式,是否裁剪图片
 *
 *  @param imageName    图片
 *  @param contentMode    图片的显示方式
 *  @param toBounds    是否裁剪图片
 */
+(UIImageView*)image_OO_ViewWithimage:(NSString*)imageName
                      ContentMode:(UIViewContentMode)contentMode
                         ToBounds:(BOOL)toBounds
                      cornerRadiu:(CGFloat)cornerRadiu;

/**
*  播放GIF
*
*  @param imageName    图片
*  @param cont    图片个数
*  @param framesPerSecond    图片播放间隔时间
 *  @param loop    是否无线循环
*/
- (void)playGifAnimImageName:(NSString *)imageName Imagecount:(int)cont andFPS:(CGFloat)framesPerSecond loop:(BOOL)loop;

/**
*  停止播放GIF
*/
- (void)stopGifAnim;

/**
*  生成一张毛玻璃图片
*/
- (UIImage*)fuzzyImage:(UIImage*)theImage numberWithFloat:(double)floa;

@end

NS_ASSUME_NONNULL_END
