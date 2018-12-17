//
//  UIImageView+OO.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "UIImageView+OO.h"

@implementation UIImageView (OO)

+(UIImageView*)image_OO_ViewWithimage:(NSString*)imageName
                      ContentMode:(UIViewContentMode)contentMode
                         ToBounds:(BOOL)toBounds
                      cornerRadiu:(CGFloat)cornerRadiu
{
    UIImageView*imageView=[[UIImageView alloc]init];
    imageView.image=[UIImage imageNamed:imageName];
    [imageView setContentMode:contentMode];
    imageView.clipsToBounds = YES;
    if (cornerRadiu!=0) {
        [imageView.layer setMasksToBounds:YES];
        [imageView.layer setCornerRadius:cornerRadiu];
    }
    return imageView;
}

@end
