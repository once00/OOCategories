//
//  UIImage+OO.m
//  Baitaner
//
//  Created by 曹绍奇 on 2021/2/4.
//  Copyright © 2021 北京桀骜文化传媒有限公司. All rights reserved.
//

#import "UIImage+OO.h"

@implementation UIImage (OO)

//给图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image

{

    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);

    

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);

    

    CGContextScaleCTM(ctx, 1, -1);

    CGContextTranslateCTM(ctx, 0, -area.size.height);

    

    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);

    

    CGContextSetAlpha(ctx, alpha);

    

    CGContextDrawImage(ctx, area, image.CGImage);

    

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    

    UIGraphicsEndImageContext();

    

    return newImage;

}

//view转成image
+ (UIImage*)OO_imageWithUIView:(UIView*) view{
    UIImage *imageRet = [[UIImage alloc]init];
    //开启上下文 参数1：CGSize size 尺寸, 参数2：BOOL opaque 透明度, 参数3：CGFloat scale 比例
        UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    //获取图像
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        imageRet = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
    return imageRet;
}

@end
