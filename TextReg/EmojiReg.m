//
//  EmojiReg.m
//  TextReg
//
//  Created by yangrui on 2018/5/18.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "EmojiReg.h"

@implementation EmojiReg


/** 给定字符串和正则表达式，匹配出所有满足条件的字符串 */
-(NSArray<NSString *> *)patternStrArrInStr:(NSString *)rawStr withPattern:(NSString *)regPattern{
    NSArray *rangeStrArr = [self rangeStrArrInStr:rawStr withPattern:regPattern];
    
    NSMutableArray *patternStrArrM = [NSMutableArray array];
    for (NSString *rangeStr in rangeStrArr) {
        NSRange range = NSRangeFromString(rangeStr);
        NSString *str = [rawStr substringWithRange:range];
        [patternStrArrM addObject:str];
    }
    
    
    return patternStrArrM;
}

/** 给定字符串和正则表达式，匹配出所有满足条件的字符串的位置字符串
 rawStr 需要匹配的字符串
 regPattern 正则表达式的样式
 */
-(NSArray<NSString *> *)rangeStrArrInStr:(NSString *)rawStr withPattern:(NSString *)regPattern{

    NSError *err = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc]initWithPattern:regPattern options:kNilOptions error:&err];
    
    if (err != nil) {
        NSLog(@"创建正则表达式失败");
        return nil;
    }
    
    
   NSArray<NSTextCheckingResult *> *resultArr= [regExp matchesInString:rawStr options:kNilOptions range:NSMakeRange(0, rawStr.length)];
    
    NSMutableArray *rangeStrArrM = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = [result range];
        ;
        [rangeStrArrM addObject:NSStringFromRange(range)];
        
    }
    return rangeStrArrM;
}
@end
