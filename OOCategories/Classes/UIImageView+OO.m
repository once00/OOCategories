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


// 播放GIF
- (void)playGifAnimImageName:(NSString *)imageName Imagecount:(int)cont andFPS:(CGFloat)framesPerSecond loop:(BOOL)loop
{
    NSMutableArray *resultarr = [NSMutableArray array];
    for (NSUInteger i = 0; i < cont; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%05ld.png",imageName,i]];
        [resultarr addObject:image];
    }
    
    if (!resultarr.count) {
        return;
    }
    //动画图片数组
    self.animationImages = resultarr;
    //执行一次完整动画所需的时长
    self.animationDuration = framesPerSecond * resultarr.count;
    //动画重复次数, 设置成0 就是无限循环
    if (loop) {
     
        self.animationRepeatCount = 0;
    }else{
    
        self.animationRepeatCount = 1;
    }
    [self startAnimating];
}
// 停止动画
- (void)stopGifAnim
{
    if (self.isAnimating) {
        [self stopAnimating];
    }
    [self removeFromSuperview];
}

//生成一张毛玻璃图片
- (UIImage*)fuzzyImage:(UIImage*)theImage numberWithFloat:(double)floa{

    if (floa<3) {
        floa=15;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
 
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:floa] forKey:@"inputRadius"];//其中数值是模糊度（3～30，越大越模糊）
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
 
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
 
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return returnImage;
}

@end
