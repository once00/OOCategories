//
//  UIButton+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UIButton+OO.h"
#import "OOCommonMacro.h"

#define OO_Button_IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)
//#define OO_Button_WW [[UIScreen mainScreen] bounds].size.width/375

@implementation UIButton (OO)

+(UIButton *)button_OO_With1normalTitle:(NSString *)title
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
    OO_Button_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:CONTROL_W(font)] ): (fontP = [UIFont systemFontOfSize:CONTROL_W(font)]);
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
    OO_Button_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:CONTROL_W(font)] ): (fontP = [UIFont systemFontOfSize:CONTROL_W(font)]);
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

@end
