//
//  NSString+EmojiRegex.m
//  TextReg
//
//  Created by yangrui on 2018/5/18.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "NSString+EmojiRegex.h"

@implementation NSString (EmojiRegex)


/** 给定字符串和正则表达式，匹配出所有满足条件的字符串
 返回值： 满足 正则表达式样式的 subString 的NSArray
 参数：regPattern 正则表达式的样式
 */
-(NSArray<NSString *> *)subStringArrWithPattern:(NSString *)regPattern{
    
    NSArray *rangeStrArr = [self subStringRangeArrWithPattern:regPattern];;

    NSMutableArray *patternStrArrM = [NSMutableArray array];
    for (NSString *rangeStr in rangeStrArr) {
        NSRange range = NSRangeFromString(rangeStr);
        NSString *str = [self substringWithRange:range];
        [patternStrArrM addObject:str];
    }


    return patternStrArrM;
}

/** 给定字符串和正则表达式，匹配出所有满足条件的字符串的位置字符串
 返回值： 满足 正则表达式样式的 subString 的NSRange
 参数：regPattern 正则表达式的样式
 */
-(NSArray<NSString *> *)subStringRangeArrWithPattern:(NSString *)regPattern{
    
    NSError *err = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc]initWithPattern:regPattern options:kNilOptions error:&err];
    
    if (err != nil) {
        NSLog(@"创建正则表达式失败");
        return nil;
    }
    
    
    NSArray<NSTextCheckingResult *> *resultArr= [regExp matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    
    NSMutableArray *rangeStrArrM = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = [result range];
        
        NSString *rangStr = NSStringFromRange(range);
        [rangeStrArrM addObject:rangStr];
        
    }
    return rangeStrArrM;
}


@end
