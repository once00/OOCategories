//
//  NSMutableAttributedString+OO.h
//  YAuction
//
//  Created by 曹绍奇 on 2022/6/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (OO)

/**
 添加控件

 @param inview 需要添加的控件
 @return 富文本
 */
+(NSAttributedString *)OO_attributedStringWithAttachmentInview:(UIView *)inview;

/**
 添加换行

 */
- (void)OO_setAddLineFeed;
    
/**
 字体大小

 @param fontSize 大小
 @param textRange 区间
 */
- (void)OO_setFontSize:(UIFont *)fontSize textRange:(NSRange)textRange ;

/**
 字体大小

 @param fontSize 大小
 @param text 文字
 */
- (void)OO_setFontSize:(UIFont *)fontSize subText:(NSString *)text;

/**
 字体颜色

 @param color 颜色
 @param textRange 区间
 */
- (void)OO_setColor:(UIColor *)color textRange:(NSRange)textRange;

/**
 字体颜色

 @param color 颜色
 @param subText 文字
 */
- (void)OO_setColor:(UIColor *)color subText:(NSString *)subText;

/**
 字体大小/颜色

 @param fontSize 大小
 @param color 颜色
 @param subText 文字
 */
- (void)OO_setFontSize:(UIFont *)fontSize color:(UIColor *)color subText:(NSString *)subText;

/**
 字体背景色

 @param color 颜色
 @param textRange 区间
 */
- (void)OO_setBackgroupColor:(UIColor *)color textRange:(NSRange)textRange;

/**
 字体背景色

 @param color 颜色
 @param subText 文字
 */
- (void)OO_setBackgroupColor:(UIColor *)color subText:(NSString *)subText;

/**
 字距

 @param distance 距离
 @param textRange 区间
 */
- (void)OO_setCharcterDistance:(CGFloat)distance textRange:(NSRange)textRange;

/**
 字距

 @param distance 距离
 @param subText 文字
 */
- (void)OO_setCharcterDistance:(CGFloat)distance subText:(NSString *)subText;

/**
 对齐方式

 @param alignmentType 方式
 */
- (void)OO_setAlignment:(int)alignmentType;

/**
 行间距 + 段落间距

 @param lineSpace 行间距
 @param paragraphSpace 段落间距
 */
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace;

/**
 行间距 + 段落间距

 @param lineSpace 行间距
 @param paragraphSpace 段落间距
 @param subText 文字
 */
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace subText:(NSString *)subText;

/**
 字距 + 行间距 + 段落间距

 @param lineSpace 字距
 @param paragraphSpace 行间距
 @param chacterSpace 段落间距
 */
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace chacterSpace:(CGFloat)chacterSpace;

/**
 下划线

 @param color 颜色
 */
- (void)OO_setUnderLine:(UIColor *)color;

/**
 下划线

 @param color 颜色
 @param subText 文字
 */
- (void)OO_setUnderLine:(UIColor *)color subText:(NSString *)subText;

/**
 下划线

 @param color 颜色
 @param range 区间
 */
- (void)OO_setUnderLine:(UIColor *)color range:(NSRange)range;

/**
 删除线 - 实线

 @param color 颜色
 */
- (void)OO_setThroughLine:(UIColor *)color;


/**
 删除线 - 实线

 @param color 颜色
 @param subText 文字
 */
- (void)OO_setThroughLine:(UIColor *)color subText:(NSString *)subText;

/**
 删除线 - 虚线

 @param color 颜色
 */
- (void)OO_setDashDotThroughLine:(UIColor *)color;

/**
 删除线 - 虚线

 @param color 颜色
 @param subText 文字
 */
- (void)OO_setDashDotThroughLine:(UIColor *)color subText:(NSString *)subText;

/**
 删除线 - 虚线

 @param color 颜色
 @param range 区间
 */
- (void)OO_setDashDotThroughLine:(UIColor *)color range:(NSRange)range;

/**
 字体阴影

 @param offSize 区域
 @param shadowColor 颜色
 @param alpha 透明度
 */
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha;

/**
 字体阴影

 @param offSize 区域
 @param shadowColor 颜色
 @param alpha 透明度
 @param subText 文字
 */
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha subString:(NSString *)subText;

/**
 字体阴影

 @param offSize 区域
 @param shadowColor 颜色
 @param alpha 透明度
 @param range 区间
 */
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha range:(NSRange)range;

/**
 字体横竖

 @param isVertical 字体横竖
 */
//
- (void)OO_setIsVertical:(BOOL)isVertical;

/**
 字体横竖

 @param isVertical 字体横竖
 @param subText 文字
 */
//
- (void)OO_setIsVertical:(BOOL)isVertical subText:(NSString *)subText;

/**
 字体横竖

 @param isVertical 字体横竖
 @param range 区域
 */
//
- (void)OO_setIsVertical:(BOOL)isVertical range:(NSRange)range;


/**
 设置字体描边宽度这样就能使"文字空心"

 @param wordsStrokeWidth 宽度
 */
//
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth;

/**
 设置字体描边宽度这样就能使"文字空心"

 @param wordsStrokeWidth 宽度
 @param subText 文字
 */
//
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth subText:(NSString *)subText;

/**
 设置字体描边宽度这样就能使"文字空心"

 @param wordsStrokeWidth 宽度
 @param range 区域
 */
//
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth range:(NSRange)range;

/**
 文字下沉偏移其他文字

 @param offSet 偏移量
 */
//
- (void)OO_setBaselineOffset:(CGFloat)offSet;

/**
 文字下沉偏移其他文字

 @param offSet 偏移量
 @param subText 文字
 */
//
- (void)OO_setBaselineOffset:(CGFloat)offSet subText:(NSString *)subText;

/**
 文字下沉偏移其他文字

 @param offSet 偏移量
 @param range 区域
 */
//
- (void)OO_setBaselineOffset:(CGFloat)offSet range:(NSRange)range;

/**
 文字倾斜

 @param offSet 角度
 */
//
- (void)OO_setSkewOffset:(CGFloat)offSet;

/**
 文字倾斜

 @param offSet 偏移量
 @param subText 文字
 */
//
- (void)OO_setSkewOffset:(CGFloat)offSet subText:(NSString *)subText;

/**
 文字倾斜

 @param offSet 偏移量
 @param range 区域
 */
//
- (void)OO_setSkewOffset:(CGFloat)offSet range:(NSRange)range;

/**
 文字扁平

 @param offSet 量
 */
//
- (void)OO_setExpansionOffset:(CGFloat)offSet;

/**
 文字扁平

 @param offSet 偏移量
 @param subText 文字
 */
//
- (void)OO_setExpansionOffset:(CGFloat)offSet subText:(NSString *)subText;

/**
 文字扁平

 @param offSet 偏移量
 @param range 区域
 */
//
- (void)OO_setExpansionOffset:(CGFloat)offSet range:(NSRange)range;

/**
 超链接样式

 @param urlString 文字
 */
//
- (NSMutableAttributedString *)linkMarkup:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
