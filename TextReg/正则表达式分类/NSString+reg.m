//
//  NSString+reg.m
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "NSString+reg.h"

@implementation NSString (reg)



/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的 subString
 */
-(NSMutableArray<NSString *> *)subStringArrWithPattern:(NSString *)regPattern{
    
    NSArray *rangeArr = [self subRangeArrWithPattern:regPattern];;
    
    if (rangeArr.count == 0) {
        return nil;
    }
    
    NSMutableArray *strArrM = [NSMutableArray array];
    for (NSString *rangeStr in rangeArr) {
        NSRange range = NSRangeFromString(rangeStr);
        NSString *str = [self substringWithRange:range];
        [strArrM addObject:str];
    }
    
    return strArrM;
}

/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的 subString 的NSRange
 */
-(NSMutableArray<NSString *> *)subRangeArrWithPattern:(NSString *)regPattern{
    
    NSError *err = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc]initWithPattern:regPattern options:kNilOptions error:&err];
    
    if (err != nil) {
        NSLog(@"创建正则表达式失败");
        return nil;
    }
    
    
    NSArray<NSTextCheckingResult *> *resultArr= [regExp matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    
    if (resultArr.count == 0) {
        return nil;
    }
    
    NSMutableArray *rangeArr = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = [result range];
        
        NSString *rangStr = NSStringFromRange(range);
        [rangeArr addObject:rangStr];
        
    }
    return rangeArr;
}


/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的  NSRange NSString 字典数组
 */
-(NSMutableArray<NSDictionary *> *)subDicArrWithPattern:(NSString *)regPattern{
    NSError *err = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc]initWithPattern:regPattern options:kNilOptions error:&err];
    
    if (err != nil) {
        NSLog(@"创建正则表达式失败");
        return nil;
    }
    
    
    NSArray<NSTextCheckingResult *> *resultArr= [regExp matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    if (resultArr.count == 0) {
        return nil;
    }
    
    NSMutableArray *dicArrM = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = [result range];
        
        [dicArrM addObject:@{ksubRange:NSStringFromRange(range),
                             ksubStr:[self substringWithRange:range] }];
        
    }
    
    return dicArrM;
}


-(NSString *)validStr{
// 方案1
//  NSArray *arr = [self subStringArrWithPattern:@"^(([\u4e00-\u9fa5]|[0-9]|[a-zA-Z]|[0-9])[\\s]?)*"];
//
//    NSLog(@"-------count %ld----- ",arr.count);
//    return arr.firstObject;
    
// 方案2
    return  [self subStringWithPattern:@"^(([\u4e00-\u9fa5]|[0-9]|[a-zA-Z]|[0-9])[\\s]?)*"];
}






//@"^(([\u4e00-\u9fa5]|[0-9]|[a-zA-Z]|[0-9])[\\s]?)*" 
-( NSString  *)subStringWithPattern:(NSString *)regPattern{
    
    NSError *err = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc]initWithPattern:regPattern options:kNilOptions error:&err];
    
    if (err != nil) { 
        return nil;
    }
    
    
    NSArray<NSTextCheckingResult *> *resultArr= [regExp matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    
    if (resultArr.count == 0) {
        return nil;
    }
    
    NSMutableString *strM = [NSMutableString new];
    
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = [result range];
        
        [strM appendString:[self substringWithRange:range]];
    }
    return strM;
}



@end
