//
//  OOCommonMacro.h
//  OOCategories
//
//  Created by 曹绍奇 on 2018/12/17.
//  Copyright © 2018 Once. All rights reserved.
//

#ifndef OOCommonMacro_h
#define OOCommonMacro_h



// 颜色相关
#define OOColorFromHexAlpha(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]
#define OOColorFromHex(hexValue)            UIColorFromHexWithAlpha(hexValue,1.0)
#define OOColorFromRGBA(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define OOColorFromRGB(r,g,b)               UIColorFromRGBA(r,g,b,1.0)


//NSNumber
#define OONUN_INT(int) [NSNumber numberWithInt:int]
#define OONUN_FLOAT(float) [NSNumber numberWithFloat:float]
#define OONUN_BOOL(bool) [NSNumber numberWithBool:bool]

//NSIndexPath
#define OOIndex_path(a,b) [NSIndexPath indexPathWithIndexes:(NSUInteger[]){a,b} length:2]


//尺寸
#define OOSCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define OOSCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define OOWIDTH(view) view.frame.size.width
#define OOHEIGHT(view) view.frame.size.height
#define OOX(view) view.frame.origin.x
#define OOY(view) view.frame.origin.y
#define OOLeft(view) view.frame.origin.x
#define OOTop(view) view.frame.origin.y
#define OOBOttom(view) (view.frame.origin.y + view.frame.size.height)
#define OORight(view) (view.frame.origin.x + view.frame.size.width)
#define OOCenterBInA(A,B) (A-B)/2//控件居中位置
#define OOCircleDegreeToRadian(d) ((d)*M_PI)/180.0//角度转换为弧度
#define OOStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height//状态栏高度
#define OONavBarHeight self.navigationController.navigationBar.frame.size.height//导航栏高度
#define OOTabBarHeight [[UITabBarController alloc] init].tabBar.frame.size.height//底部tabbar高度
#define OOTabBarSafeHeight SafeBottomMargin()//安全距离

#define OOHeight_StatusBar ((OO_isIphoneX==YES || OO_isIphoneXr ==YES || OO_isIphoneXs== YES || OO_isIphoneXsMax== YES) ? 44.0 : 20.0)
#define OOHeight_NavBar ((OO_isIphoneX==YES || OO_isIphoneXr ==YES || OO_isIphoneXs== YES || OO_isIphoneXsMax== YES) ? 88.0 : 64.0)
#define OOHeight_TabBar ((OO_isIphoneX==YES || OO_isIphoneXr ==YES || OO_isIphoneXs== YES || OO_isIphoneXsMax== YES) ? 83.0 : 49.0)
#define OOHeight_TopBar (OOHeight_StatusBar + OOHeight_NavBar)


//iOS Version

#define OO_is_DSFourInch ([UIScreen mainScreen].bounds.size.height >= 568.0)//是否为4inch
#define OO_IS_iOS(num) ([[UIDevice currentDevice].systemVersion doubleValue] >= num)//是否为iOS某个系统



#define OO_isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)//判断是否是ipad
#define OO_isPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhone4系列
#define OO_isPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhone5系列
#define OO_isPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhone6系列
#define OO_isPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iphone6+系列
#define OO_isIphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhoneX
#define OO_isIphoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPHoneXr
#define OO_isIphoneXs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhoneXs
#define OO_isIphoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !OO_isPad : NO)//判断iPhoneXs Max


//图片
#define OOMainImageName(name) [UIImage imageNamed :name]// 自定义视图 图片路径


//将NSUserDefaults的实例化定义成宏
#define OO_USER_DEFAULT [NSUserDefaults standardUserDefaults]


//NSNotificationCenter
#define OO_NSREMOVENotification [[NSNotificationCenter defaultCenter]removeObserver:self]
#define OO_NSPOSTNotification(name,obj,userinfo) [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:userinfo]
#define OO_NSAddObjectrver(selectorStr,keyName) [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectorStr) name:keyName object:nil]

#pragma mark - 忽略 iOS 13 KVC 访问私有属性限制

/// 将 KVC 代码包裹在这个宏中，可忽略系统的  KVC 访问限制
#define BeginIgnoreUIKVCAccessProhibited if (@available(iOS 13.0, *)) NSThread.currentThread.qmui_shouldIgnoreUIKVCAccessProhibited = YES;
#define EndIgnoreUIKVCAccessProhibited if (@available(iOS 13.0, *)) NSThread.currentThread.qmui_shouldIgnoreUIKVCAccessProhibited = NO;






//兼容旧版












/**
 *  颜色相关
 */
//颜色
#define DSRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]//随机色
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//16进制颜色
#define RGB_A(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]//RGB带透明度颜色
#define RGB_B(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]//RGB带透明度颜色


/**
 *  系统先关
 */
#define DSFourInch ([UIScreen mainScreen].bounds.size.height >= 568.0)//是否为4inch
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)//是否为iOS7
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)//是否为iOS8及以上系统
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)//是否为iOS9及以上系统
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)//是否为iOS8及以上系统
#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)//是否为iOS8及以上系统

//判断是否是ipad
#define isIpad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

/**
 *  适配先关
 */
//距离屏幕两边
#define HG_EDGE 12
#define O_WIDTH(s) s * [[UIScreen mainScreen] bounds].size.width / 375
#define O_HEIGHT(s) s * [[UIScreen mainScreen] bounds].size.height / 1136
#define FRAME(x,y,width,height) (O_WIDTH(x)),(O_HEIGHT(y)),(O_WIDTH(width)),(O_HEIGHT(height))
#define CONTROL_W(stance) ((HG_WIDTH/375) * (float)stance)// 适配屏幕比例
#define CONTROL_W_ADAPTER(stance) (414.0f / 1242 * stance * (1 + ([[UIScreen mainScreen] bounds].size.width / 414 - 1) / 2))// 适配屏幕比例


#define CONTROL_H(stance) (((HG_HEIGHT-Height_NavBar-TabbarSafeBottomMargin)/(2208-192)) * (CGFloat)stance)// 适配屏幕比例

#define CONTROL_NoNav_H(stance) (((HG_HEIGHT-TabbarSafeBottomMargin)/(2208-192)) * (CGFloat)stance)// 适配屏幕比例

#define RESOURCE_PATH [[NSBundle mainBundle] resourcePath]// 适配屏幕比例
#define SCALE [[UIScreen mainScreen] bounds].size.width/375
#define HEIGHTNEW [UIScreen mainScreen].bounds.size.height
//#define WeakSelf __weak typeof(self) wself = self
//#define WEAKSELF(A) __weak typeof(A) weakSelf = A;
#define HG_Size CGSize Size = [[UIScreen mainScreen] bounds].size// 获取屏幕宽高
#define HG_WIDTH  [[UIScreen mainScreen] bounds].size.width// 获取屏幕宽
#define HG_HEIGHT [[UIScreen mainScreen] bounds].size.height// 获取屏幕宽高
#define CenterOriginBInA(A,B) (A-B)/2//控件居中位置
#define CircleDegreeToRadian(d) ((d)*M_PI)/180.0//角度转换为弧度
#define StatusRectHH [UIApplication sharedApplication].statusBarFrame.size.height//状态栏高度
#define NavRectHH self.navigationController.navigationBar.frame.size.height//导航栏高度
#define TabBarRectHH [[UITabBarController alloc] init].tabBar.frame.size.height//底部tabbar高度
#define SafeAreaTopHeight (kWJScreenHeight == 812.0 ? 88 : 64)//导航栏高度
#define NavHeight (NavRectHH+StatusRectHH) //导航栏高度
/// 底部宏，吃一见长一智吧，别写数字了(iphonex适配)
#define SafeAreaBottomHeight (kWJScreenHeight == 812.0 ? 34 : 0)

#define  TabbarSafeBottomMargin SafeBottomMargin()

//#define  TabbarSafeBottomMargina ((@available(iOS 11.0, *)) ? ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom) : 0)

//(([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0) ? ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom) : 0)
/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}
/// 高度系数 812.0 是iPhoneX的高度尺寸，667.0表示是iPhone 8 的高度，如果你觉的它会变化，那我也很无奈
#define kWJHeightCoefficient (kWJScreenHeight == 812.0 ? 667.0/667.0 : kWJScreenHeight/667.0)
#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT*2)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT 260
#define SCROLL_DOWN_LIMIT 100
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

//iPhoneX系列
#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
#define Height_TopBar (Height_StatusBar + Height_NavBar)

/**
 *  图片相关
 */
#define MainImageName(name) [UIImage imageNamed :name]// 自定义视图 图片路径
#define kPlaceholderImageColor [UIImage yy_imageWithColor:[UIColor groupTableViewBackgroundColor]]

/** 字符串是否为空*/
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

/**
 *  日至输出
 */
#ifdef DEBUG
#   define DDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DDLogFunction  NSLog((@"%s [Line %d] " ), __PRETTY_FUNCTION__, __LINE__);
//#   define DDLog NSLog(__VA_ARGS__)
#else
#   define DDLog(fmt, ...);
#   define DDLogFunction
#endif


//将NSUserDefaults的实例化定义成宏
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]


/**
 *  NSNotificationCenter
 */
#define NSREMOVENotification [[NSNotificationCenter defaultCenter]removeObserver:self]
#define NSPOSTNotification(name,obj,userinfo) [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:userinfo]
#define NSAddObjectrver(selectorStr,keyName) [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectorStr) name:keyName object:nil]





//字符串是否为空
#define OtringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define OArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define ODictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define OObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))





//宏定义
#define FONT_SIZE(size) ([UIFont systemFontOfSize:FontSize(size))

/**
 *  字体适配 我在PCH文件定义了一个方法
 */
static inline CGFloat FontSize(CGFloat fontSize){
    if (HG_WIDTH==320) {
        return fontSize-2;
    }else if (HG_WIDTH==375){
        return fontSize;
    }else{
        return fontSize+2;
    }
}

static inline CGFloat SafeBottomMargin(){
    if (iOS11) {
        return ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom);
    }else{
        return 0;
    }
}


#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif



#endif /* OnceCommonMacro_h */
