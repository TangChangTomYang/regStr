//
//  NSString+EmojiRegex.h
//  TextReg
//
//  Created by yangrui on 2018/5/18.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EmojiRegex)




/** 给定字符串和正则表达式，匹配出所有满足条件的字符串
 返回值： 满足 正则表达式样式的 subString 的NSArray
 参数：regPattern 正则表达式的样式
 */
-(NSArray<NSString *> *)subStringArrWithPattern:(NSString *)regPattern;

/** 给定字符串和正则表达式，匹配出所有满足条件的字符串的位置字符串
 返回值： 满足 正则表达式样式的 subString 的NSRange
 参数：regPattern 正则表达式的样式
 */
-(NSArray<NSString *> *)subStringRangeArrWithPattern:(NSString *)regPattern;
    
    
@end
