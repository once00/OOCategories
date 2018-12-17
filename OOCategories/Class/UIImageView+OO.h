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

@end

NS_ASSUME_NONNULL_END
