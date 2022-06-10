//
//  UIButton+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UIButton+OO.h"
#import "OOCommonMacro.h"
#import <objc/runtime.h>

#define OO_Button_IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)
//#define OO_Button_WW [[UIScreen mainScreen] bounds].size.width/375

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

@implementation UIButton (OO)

+(UIButton *)button_OO_With1normalTitle:(NSString *)title
                       normalTitleColor:(UIColor *)titleColor
                       normalTiltleFont:(UIFont*)font
                            cornerRadiu:(CGFloat)cornerRadiu
                        backGroundColor:(UIColor*)backGroundColor
                  backSelectGroundColor:(UIColor*)backSelectGroundColor
                            BorderWidth:(float)width
                            BorderColor:(UIColor*)bordercolor
                                 target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
    }
    [button setTitle:title forState:UIControlStateNormal];
//    UIFont *fontP ;//这个是9.0以后自带的平方字体
//    OO_Button_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font] ): (fontP = [UIFont systemFontOfSize:font]);
    [button.titleLabel setFont:font];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (button.selected==YES) {
        [button setBackgroundColor:backSelectGroundColor];
    }else{
        [button setBackgroundColor:backGroundColor];
    }
    [button.layer setBorderWidth:width];
    [button.layer setBorderColor:bordercolor.CGColor];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

+(UIButton *)button_OO_WithnormalTitle:(NSString *)title
                  normalTitleColor:(UIColor *)titleColor
                  normalTiltleFont:(CGFloat)font
                       cornerRadiu:(CGFloat)cornerRadiu
                   backGroundColor:(UIColor*)backGroundColor
             backSelectGroundColor:(UIColor*)backSelectGroundColor
                       BorderWidth:(float)width
                       BorderColor:(UIColor*)bordercolor
                            target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
    }
    [button setTitle:title forState:UIControlStateNormal];
    UIFont *fontP ;//这个是9.0以后自带的平方字体
    OO_Button_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font] ): (fontP = [UIFont systemFontOfSize:font]);
    [button.titleLabel setFont:fontP];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (button.selected==YES) {
        [button setBackgroundColor:backSelectGroundColor];
    }else{
        [button setBackgroundColor:backGroundColor];
    }
    [button.layer setBorderWidth:width];
    [button.layer setBorderColor:bordercolor.CGColor];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}


/**
 *  背景图,点击方法
 *  @param  def    默认图
 *  @param  selecr    点击图
 *  @param   selector   点击方法
 */
+(UIButton *)button_OO_WithbackGroundImgDef:(UIImage *)def
                           backGroundImgDef:(UIImage *)selecr
                                     target:(id)target selector:(SEL)selector{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:def forState:UIControlStateNormal];
    [button setImage:selecr forState:UIControlStateHighlighted];
    [button setImage:selecr forState:UIControlStateSelected];

    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}


//设置图片位置
- (void)set_OO_ImagePosition:(CDMImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case CDMImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case CDMImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case CDMImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case CDMImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
    
}


- (void)setIsImageadaptive:(BOOL)isive{
    
    if (isive==YES) {
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [[self imageView] setContentMode:UIViewContentModeScaleAspectFill];
        self.contentHorizontalAlignment= UIControlContentHorizontalAlignmentFill;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    }
}

- (void)setEnlargeEdgeWithMargin:(CGFloat)margin
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:margin], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithEdge:(UIEdgeInsets)edge
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:edge.top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:edge.right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:edge.bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:edge.left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)setUnderlineColor:(UIColor *)underlineColor{
 
    CGRect textRect = self.titleLabel.frame;
    CGContextRef contextRef = UIGraphicsGetCurrentContext();

    CGFloat descender = self.titleLabel.font.descender;
    if([underlineColor isKindOfClass:[UIColor class]]){
        CGContextSetStrokeColorWithColor(contextRef, underlineColor.CGColor);
    }

    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender+1);
    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender+1);

    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke);
    
    [self setNeedsDisplay];
}
//
//- (void) drawRect:(CGRect)rect {
//    CGRect textRect = self.titleLabel.frame;
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//
//    CGFloat descender = self.titleLabel.font.descender;
//    if([underlineColortemp isKindOfClass:[UIColor class]]){
//        if (self.underlineColor) {
//            CGContextSetStrokeColorWithColor(contextRef, underlineColortemp.CGColor);
//        }
//    }
//
//    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender+1);
//    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender+1);
//
//    CGContextClosePath(contextRef);
//    CGContextDrawPath(contextRef, kCGPathStroke);
//}
@end
