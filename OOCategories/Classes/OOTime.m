//
//  OOTime.m
//  OOCategories
//
//  Created by 曹绍奇 on 2018/11/22.
//  Copyright © 2018 Once. All rights reserved.
//

#import "OOTime.h"

@implementation OOTime

//计算2个时间差值
+ (NSDictionary *)OO_datepleaseInsertStarTimeo:(NSString *)starttime andInsertEndTime:(NSString *)endtime{
    // 1.将时间转换为date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date1 = [formatter dateFromString:starttime];
    NSDate *date2 = [formatter dateFromString:endtime];
    // 2.创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 3.利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [calendar components:type fromDate:date1 toDate:date2 options:0];
    // 4.输出结果
    
    NSMutableDictionary * timdic=[NSMutableDictionary dictionary];
    
    if (cmps.year) {
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.year] forKey:@"year"];
    }
    if (cmps.month){
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.month] forKey:@"month"];
    }
    if (cmps.day){
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.day] forKey:@"day"];
    }
    if (cmps.hour){
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.hour] forKey:@"hour"];
    }
    if (cmps.minute){
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.minute] forKey:@"minute"];
    }
    if (cmps.second){
        [timdic setObject:[NSString stringWithFormat:@"%ld",cmps.second] forKey:@"second"];
    }
    
    
    NSLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒", cmps.year, cmps.month, cmps.day, cmps.hour, cmps.minute, cmps.second);
    return timdic;
}

//比较两个日期的大小  日期格式为2016-08-14 08：46：20
+ (NSInteger)OO_datecompareDate:(NSString*)aDate withDate:(NSString*)bDate dateformat:(NSString*)type{
    NSInteger aa;
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
//    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateformater setDateFormat:type];
    NSDate *dta = [[NSDate alloc] init];
    NSDate *dtb = [[NSDate alloc] init];
    
    dta = [dateformater dateFromString:aDate];
    dtb = [dateformater dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];
    
    switch (result) {
        case NSOrderedSame:
        {
            //相等
            aa=0;
        }
            break;
        case NSOrderedAscending:
        {
            //bDate比aDate大
            aa=1;
        }
            break;
        case NSOrderedDescending:
        {
            //bDate比aDate小
            aa=2;
        }
            break;
            
        default:
            break;
    }
    
    return aa;
}



+(NSArray *)OO_GetDayarr:(NSInteger)year{
    NSMutableArray * dataarr=[NSMutableArray array];
    
    for (int i=1; i<=12; i++) {
        
        NSInteger dayNum2 = [self DaysfromYear:year andMonth:i];
        for (NSInteger j=1; j<=dayNum2; j++) {
            
            //转换英文为中文
            NSString *chinaStr =[self OO_getGetthedate:[NSString stringWithFormat:@"%ld-%02d-%02ld",year,i,j]];
            
            [dataarr addObject:[NSString stringWithFormat:@"%02d月%02ld日 %@",i,j,chinaStr]];
        }
        
    }
    
    
    return dataarr;
}

#pragma mark --------------- 通过年月求每月天数(year=1028  month=02)-----------------------
//通过年月求每月天数
+ (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self setdayArray:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self setdayArray:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self setdayArray:29];
                return 29;
            }else{
                [self setdayArray:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}
//设置每月的天数数组
+ (NSArray *)setdayArray:(NSInteger)num
{
    NSMutableArray * _dayArray=[NSMutableArray array];
    [_dayArray removeAllObjects];
    for (int i=1; i<=num; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    
    return _dayArray;
}
#pragma mark --------------- 根据日期转换星期(2018-09-22)-----------------------
+(NSString *)OO_getGetthedate:(NSString *)data{
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
    
    NSDate*date =[dateFormat dateFromString:data];
    
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周天", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/SuZhou"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

//通过年月求每月天数
+ (NSInteger)OO_DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self setdayArray:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self setdayArray:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self setdayArray:29];
                return 29;
            }else{
                [self setdayArray:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}

#pragma mark - 将某个时间戳转化成 时间

+(NSString *)OO_timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    return confromTimespStr;
    
}


#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)OO_timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
    
}

//获取当前时间戳有两种方法(以秒为单位)
+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
    
}

//获取当前时间戳  （以毫秒为单位）
+(NSString *)getNowTimeTimestamp3{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
    
}

+(NSString *) compareCurrentTime:(NSString *)str
{

    NSTimeInterval time22=[str doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate22=[NSDate dateWithTimeIntervalSince1970:time22];
    NSDateFormatter *dateFormatter22 = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter22 setDateFormat:@"yyyy-MM-dd HH:mm:ss SS"];
    NSString *currentDateStr22 = [dateFormatter22 stringFromDate: detailDate22];
    
    NSDate *timeDate = [dateFormatter22 dateFromString:currentDateStr22];
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:timeDate];
    long temp = 0;
    NSString *result;
    if (timeInterval/60 < 1)
    {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

//将时间数据（毫秒）转换为天和小时
+ (NSString*)getOvertime:(NSString*)mStr isDaya:(BOOL)isday{
        long msec = [mStr longLongValue];
          
        if (msec <= 0)
        {
            return @"";
        }
          
        NSInteger d = msec/1000/60/60/24;
        NSInteger h = msec/1000/60/60%24;
        NSInteger  m = msec/1000/60%60;
        NSInteger  s = msec/1000%60;
          
        NSString *_tStr = @"";
        NSString *_dStr = @"";
        NSString *_hStr = @"";
        NSString *_mStr = @"";
        NSString *_sStr = @"";
          
        if (d > 0)
        {
            _dStr = [NSString stringWithFormat:@"%ld天",d];
        }
          
        if (h > 0)
        {
            _hStr = [NSString stringWithFormat:@"%ld",h];
        }
        
        if (m > 0)
        {
            _mStr = [NSString stringWithFormat:@":%ld",m];
        }
        
        if (s > 0)
        {
            _sStr = [NSString stringWithFormat:@"%ld秒",s];
        }
          
          
    
    if (isday) {
        _tStr = _dStr;
    }else{
        _tStr = [NSString stringWithFormat:@"%@%@%@",_dStr,_hStr,_mStr];
    }
    return _tStr;
}

@end
