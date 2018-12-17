//
//  UITextView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (OO)


/**
 给placeholdStr

 @param placeholdStr 提示语
 @param placeholdColor 字体颜色
 */
-(void)set_OO_Placeholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;

@end

NS_ASSUME_NONNULL_END
