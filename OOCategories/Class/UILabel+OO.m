//
//  UILabel+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UILabel+OO.h"

#define OO_Label_IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)
#define OO_Label_WW [[UIScreen mainScreen] bounds].size.width/375

@implementation UILabel (OO)

+(UILabel*)label_OO_WithText:(NSString*)text
                textFont:(CGFloat)font
               textColor:(UIColor*)textColor
           TextAlignment:(NSTextAlignment)alignment
           numberOfLines:(BOOL)Lines{
    UILabel*label=[[UILabel alloc]init];
    
    label.text=text;
    
    UIFont*fontP;
    OO_Label_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font] ): (fontP = [UIFont systemFontOfSize:font]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    
    if (Lines==YES) {
        label.numberOfLines = 0;
        [label sizeToFit];
    }
    
    return label;
}


+ (void)change_OO_LineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)change_OO_WordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)change_OO_SpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}


- (void)add_OO_BezierPathsMoveToPoint:(CGPoint)movecorners LineToPoint:(CGPoint)addcorners lineWidth:(CGFloat)widh strokeColor:(UIColor *)color{
//    CGRect size = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.font.pointSize]} context:nil];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] initWithLayer:self.layer];
    shapeLayer.lineWidth = widh;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:movecorners];//开始点
    [path addLineToPoint:addcorners];//结束点
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
}


@end
