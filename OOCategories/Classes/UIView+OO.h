//
//  UIView+OO.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OOTouchCallBackBlock)(void);

@interface UIView (OO)

@property (readonly) CGPoint origin;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

+ (instancetype)viewFromeXib;

+ (instancetype)viewFromBgColor:(UIColor *)bgColor;

//渐变色
- (UIImage *)imageWithColors:(NSArray *)colors;

/**
 添加上下跳动动画
 */
- (void)addbeatinganimation;

/**
 移除此view上的所有子视图
 */
- (void)remove_OO_AllSubviews;

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)add_OO_RoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)add_OO_RoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;


@property (nonatomic, copy) OOTouchCallBackBlock touchCallBackBlock;

/**
 添加点击事件(block形式)
 */
- (void)addActionWithblock:(OOTouchCallBackBlock)block;


/**
 添加点击事件
 */
- (void)addTarget:(id)target action:(SEL)action;

/**
 *  设置圆角、边框
 *
 *  @param radius 圆角大小
 *  @param width  边框大小
 *  @param color  边框颜色
 */
- (void)cornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color;

/**
 *  设置左上右上圆角
 * */
- (void)setLeftRightCornerRadius:(CGSize)size;
/**
 *  设置左下右下圆角
 * */
- (void)setDownLeftRightCornerRadius:(CGSize)size;


/**
 *  设置左下左上圆角
 * */
- (void)setLeftTopBottomCornerRadius:(CGSize)size;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;


/**
 获取当前视图的控制器
 @return 控制器
 */
- (UIViewController *)ap_viewController;


/**
 获取顶层控制器
 @return 控制器
 */
- (UIViewController *)jp_topViewController;
+ (UIViewController *)jp_getTopViewController;

/**
 获取顶层导航控制器控制器
 @return 控制器
 */
- (UINavigationController *)jp_topNavigationController;


/**
 * setCornerRadius   给view设置圆角
 * @param value      圆角大小
 * @param rectCorner 圆角位置
 **/
- (void)setCornerRadius:(CGFloat)value addRectCorners:(UIRectCorner)rectCorner;

/**
 *  //缩放动画
 * */
- (void)addZoomAnimation;

@end

NS_ASSUME_NONNULL_END
