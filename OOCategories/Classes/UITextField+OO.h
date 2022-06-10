//
//  UITextField+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (OO)
/**
 *  内容,字体颜色,字体大小,字体位置,一行长度自适应
 *  @param  borderStyle    键盘模式
 *  @param  placeholderString    提示字体
 *  @param  placeFont    提示字体大小
 *  @param  placeholderColor    提示字体颜色
 *  @param  textColor    字体颜色
 */
+(UITextField*)textField_OO_WithkeyboardType:(UIKeyboardType)borderStyle
                       placeholderString:(NSString*)placeholderString
                   placeholderStringFont:(UIFont*)placeFont
                        placeholderColor:(UIColor*)placeholderColor
                               textColor:(UIColor*)textColor
                                textFont:(UIFont*)textFont
                               textAlignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
