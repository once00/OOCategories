//
//  UITextField+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UITextField+OO.h"


#define OO_UITextField_IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)
#define OO_UITextField_WW [[UIScreen mainScreen] bounds].size.width/375

@implementation UITextField (OO)

+(UITextField*)textField_OO_WithkeyboardType:(UIKeyboardType)borderStyle
                       placeholderString:(NSString*)placeholderString
                   placeholderStringFont:(UIFont*)placeFont
                        placeholderColor:(UIColor*)placeholderColor
                               textColor:(UIColor*)textColor
                                textFont:(UIFont*)textFont
                           textAlignment:(NSTextAlignment)alignment{
    UITextField* field=[[UITextField alloc]init];
    field.keyboardType=borderStyle;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:placeholderString];
    //    [placeholder addAttribute:NSForegroundColorAttributeName
    //                        value:placeholderColor
    //                        range:NSMakeRange(0, placeholderString.length)];
    //    [placeholder addAttribute:NSFontAttributeName
    //                        value:[UIFont systemFontOfSize:placeFont*SCALE]
    //                        range:NSMakeRange(0, placeholderString.length)];
    //
    
//    UIFont *fontP ;
//    OO_UITextField_IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:placeFont*OO_UITextField_WW] ): (fontP = [UIFont systemFontOfSize:placeFont*OO_UITextField_WW]);
    
    
    [placeholder setAttributes:[NSDictionary dictionaryWithObjectsAndKeys: placeholderColor,
                                NSForegroundColorAttributeName,
                                placeFont,
                                NSFontAttributeName, nil] range:NSMakeRange(0, placeholderString.length)];
    
//    UIFont*textFontP;
//    OO_UITextField_IS_IOS9 ?( textFontP = [UIFont fontWithName:@"PingFangSC-Regular" size:textFont*OO_UITextField_WW] ): (textFontP = [UIFont systemFontOfSize:textFont*OO_UITextField_WW]);
    
    field.font=textFont;
    
    
    field.attributedPlaceholder = placeholder;
    field.textColor=textColor;
    field.textAlignment = alignment;
    return field;
}

@end
