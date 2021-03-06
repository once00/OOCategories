//
//  UIButton+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CDMImagePosition) {
    CDMImagePositionLeft = 0,              //图片在左，文字在右，默认
    CDMImagePositionRight = 1,             //图片在右，文字在左
    CDMImagePositionTop = 2,               //图片在上，文字在下
    CDMImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (OO)


/**
 *  标题,标题颜色,标题大小,标题圆角,控件背景颜色,点击的背景颜色,边框线宽度,点击方法
 *  @param  title    标题
 *  @param  titleColor    标题颜色
 *  @param  font    标题大小
 *  @param  cornerRadiu    标题圆角
 *  @param  backGroundColor    控件背景颜色
 */
+(UIButton *)button_OO_WithnormalTitle:(NSString *)title
                  normalTitleColor:(UIColor *)titleColor
                  normalTiltleFont:(CGFloat)font
                       cornerRadiu:(CGFloat)cornerRadiu
                   backGroundColor:(UIColor*)backGroundColor
             backSelectGroundColor:(UIColor*)backSelectGroundColor
                       BorderWidth:(float)width
                       BorderColor:(UIColor*)bordercolor
                            target:(id)target selector:(SEL)selector;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)set_OO_ImagePosition:(CDMImagePosition)postion spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
