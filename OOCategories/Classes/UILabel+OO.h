//
//  UILabel+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (OO)

/**
 
 和UIbutton相似，内边距属性
 
 控制字体与控件边界的间隙
 
 */

@property (nonatomic, assign) UIEdgeInsets contentInsets;

/**
 *  内容,字体颜色,字体大小,字体位置,是否N行自适应
 *  @param  text    内容
 *  @param  font    字体大小
 *  @param  textColor    字体颜色
 *  @param  alignment    字体位置
 *  @param  Lines    是否N行自适应
 */
+(UILabel*)label_OO_WithText:(NSString*)text
                textFont:(UIFont *)font
               textColor:(UIColor*)textColor
           TextAlignment:(NSTextAlignment)alignment
               numberOfLines:(BOOL)Lines;

/**
 改变行间距

 @param label 那个label
 @param space 距离
 */
+ (void)change_OO_LineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 改变字间距

 @param label 那个label
 @param space 距离
 */
+ (void)change_OO_WordSpaceForLabel:(UILabel *)label WithSpace:(float)space;


/**
 改变行间距和字间距

 @param label 那个label
 @param lineSpace 行距离
 @param wordSpace 字距离
 */
+ (void)change_OO_SpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


/**
 *  给label划线
 *  @param  movecorners    开始点
 *  @param  addcorners    结束点
 *  @param  widh    宽度
 *  @param  color    颜色
 */
- (void)add_OO_BezierPathsMoveToPoint:(CGPoint)movecorners LineToPoint:(CGPoint)addcorners lineWidth:(CGFloat)widh strokeColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
