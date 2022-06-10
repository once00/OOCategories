//
//  NSMutableAttributedString+OO.m
//  YAuction
//
//  Created by 曹绍奇 on 2022/6/10.
//

#import "NSMutableAttributedString+OO.h"
#import "OOCategories.h"

@implementation NSMutableAttributedString (OO)

/**
 添加控件

 @param inview 需要添加的控件
 */
+(NSAttributedString *)OO_attributedStringWithAttachmentInview:(UIView *)inview{
    
    //创建Image的富文本格式
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.bounds = CGRectMake(0, 0, inview.frame.size.width, inview.frame.size.height);
    //调用方法，转化成Image
    
    UIView *tempview=[UIView new];
    tempview=inview;
    tempview.frame=CGRectMake(0, 0, inview.frame.size.width, inview.frame.size.height);
    
    UIImage *image = [UIImage OO_imageWithUIView:tempview];
    attach.image = image;
    //添加到富文本对象里
    NSAttributedString * imageStr = [NSAttributedString attributedStringWithAttachment:attach];
    
    return imageStr;
}

//获取内容
- (NSArray *)ranges:(NSString *)subString {
    NSMutableArray *ranges = [NSMutableArray new];
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:subString options:NSRegularExpressionCaseInsensitive error:nil];
    NSRange range = NSMakeRange(0, self.length);
    NSArray *matches = [regex matchesInString:self.string options:NSMatchingReportCompletion range:range];
    for (NSTextCheckingResult *result in matches) {
       [ranges addObject:[NSValue valueWithRange:result.range]];
    }
    return ranges;
}

//添加换行
- (void)OO_setAddLineFeed{
    NSMutableAttributedString *addStr = [[NSMutableAttributedString alloc]initWithString:@"\n"];
    [self appendAttributedString:addStr];
}

// 字体大小
- (void)OO_setFontSize:(UIFont *)fontSize textRange:(NSRange)textRange {
    [self addAttribute:NSFontAttributeName value:fontSize range:textRange];
}

// 字体大小
- (void)OO_setFontSize:(UIFont *)fontSize subText:(NSString *)text; {
    NSArray *ranges = [self ranges:text];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSFontAttributeName value:fontSize range:range];
    }
}

// 字体颜色
- (void)OO_setColor:(UIColor *)color textRange:(NSRange)textRange {
    [self addAttribute:NSForegroundColorAttributeName value:color range:textRange];
}

// 字体颜色
- (void)OO_setColor:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

// 字体大小/颜色
- (void)OO_setFontSize:(UIFont *)fontSize color:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSFontAttributeName value:fontSize range:range];
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

// 字体背景色
- (void)OO_setBackgroupColor:(UIColor *)color textRange:(NSRange)textRange {
    [self addAttribute:NSForegroundColorAttributeName value:color range:textRange];
}

// 字体背景色
- (void)OO_setBackgroupColor:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

// 字距
- (void)OO_setCharcterDistance:(CGFloat)distance textRange:(NSRange)textRange {
    [self addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:distance] range:textRange];
}

// 字距
- (void)OO_setCharcterDistance:(CGFloat)distance subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:distance] range:range];
    }
}

// 对齐方式
- (void)OO_setAlignment:(int)alignmentType {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByCharWrapping;
    switch (alignmentType) {
        case 0:
            style.alignment = NSTextAlignmentLeft;
            break;
        case 1:
            style.alignment = NSTextAlignmentCenter;
            break;
        case 2:
            style.alignment = NSTextAlignmentRight;
            break;
        case 3:
            style.alignment = NSTextAlignmentJustified;
            break;
        default:
            style.alignment = NSTextAlignmentNatural;
            break;
    }
    NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
}

// 行间距 + 段落间距
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
     NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
}


// 行间距 + 段落间距
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace subText:(NSString *)subText{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
}

// 字距 + 行间距 + 段落间距
- (void)OO_setLineSpace:(CGFloat)lineSpace paragraphSpace:(CGFloat)paragraphSpace chacterSpace:(CGFloat)chacterSpace {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.paragraphSpacing = paragraphSpace;
    
    NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
        [self addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:chacterSpace] range:range];
    }
}

// 下划线
- (void)OO_setUnderLine:(UIColor *)color {
    NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
        [self addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
    }
}

// 下划线
- (void)OO_setUnderLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
        [self addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
    }
}

// 下划线
- (void)OO_setUnderLine:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSUnderlineColorAttributeName value:color range:range];
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSMutableParagraphStyle new] range:range];
}

// 删除线 - 实线
- (void)OO_setThroughLine:(UIColor *)color {
    NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    }
}

// 删除线 - 实线
- (void)OO_setThroughLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    }
}

// 删除线 - 虚线
- (void)OO_setDashDotThroughLine:(UIColor *)color {
    NSArray *ranges = [self ranges:self.string];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
    }
}

// 删除线 - 虚线
- (void)OO_setDashDotThroughLine:(UIColor *)color subText:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
        [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
    }
}

// 删除线 - 虚线
- (void)OO_setDashDotThroughLine:(UIColor *)color range:(NSRange)range {
    [self addAttribute:NSStrikethroughColorAttributeName value:color range:range];
    [self addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:NSUnderlinePatternDashDot] range:range];
}

// 字体阴影
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha {
    NSArray *ranges = [self ranges:self.string];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSShadowAttributeName value:shadowColor range:range];
    }
}

// 字体阴影
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha subString:(NSString *)subText {
    NSArray *ranges = [self ranges:subText];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSShadowAttributeName value:shadowColor range:range];
    }
}

// 字体阴影
- (void)OO_setShadowStringWithoffSize:(CGSize)offSize shadowColor:(UIColor *)shadowColor alpha:(CGFloat)alpha range:(NSRange)range {
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowOffset = offSize;
    shadow.shadowColor = shadowColor;
    shadow.shadowBlurRadius = alpha;
    
    [self addAttribute:NSShadowAttributeName value:shadowColor range:range];
}

// 字体横竖
- (void)OO_setIsVertical:(BOOL)isVertical {
    NSArray *ranges = [self ranges:self.string];
    
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
    }
}

// 字体横竖
- (void)OO_setIsVertical:(BOOL)isVertical subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
    }
    
}

// 字体横竖
- (void)OO_setIsVertical:(BOOL)isVertical range:(NSRange)range {
    NSNumber *isVerticalNumber = isVertical == YES ? [NSNumber numberWithInt:1] : [NSNumber numberWithInt:0];
    
    [self addAttribute:NSVerticalGlyphFormAttributeName value:isVerticalNumber range:range];
}

// 设置字体描边宽度这样就能使"文字空心"
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth {
    NSArray *ranges = [self ranges:self.string];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
    }
}

// 设置字体描边宽度这样就能使"文字空心"
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
    }
}

// 设置字体描边宽度这样就能使"文字空心"
- (void)OO_setWordsStrokeWidth:(CGFloat)wordsStrokeWidth range:(NSRange)range {
    [self addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:wordsStrokeWidth] range:range];
}

// 文字下沉偏移其他文字
- (void)OO_setBaselineOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self.string];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字下沉偏移其他文字
- (void)OO_setBaselineOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字下沉偏移其他文字
- (void)OO_setBaselineOffset:(CGFloat)offSet range:(NSRange)range {
    
    [self addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
}

// 文字倾斜
- (void)OO_setSkewOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self.string];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字倾斜
- (void)OO_setSkewOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字倾斜
- (void)OO_setSkewOffset:(CGFloat)offSet range:(NSRange)range {
    
    [self addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    
}

// 文字扁平
- (void)OO_setExpansionOffset:(CGFloat)offSet {
    NSArray *ranges = [self ranges:self.string];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字扁平
- (void)OO_setExpansionOffset:(CGFloat)offSet subText:(NSString *)subText{
    NSArray *ranges = [self ranges:subText];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
    }
}

// 文字扁平
- (void)OO_setExpansionOffset:(CGFloat)offSet range:(NSRange)range {
    
    [self addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:offSet] range:range];
}

// 超链接样式
- (void)OO_setlinkMarkup:(NSString *)urlString {
    NSArray *ranges = [self ranges:urlString];
    
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        [self addAttribute:NSLinkAttributeName value:urlString range:range];
    }
}

@end

