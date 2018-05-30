//
//  NSString+validStr.m
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "NSString+validStr.h"

@implementation NSString (validStr)


/**
 ^表示匹配字符开始位置,匹配输入字行首
 [\u4e00-\u9fa5] 表示匹配所有的汉字
 [a-zA-Z0-9 ] 表示匹配所有的英文字母和数字
 + 匹配前面的子表达式一次或多次(大于等于1次）。例如，“zo+”能匹配“zo”以及“zoo”，但不能匹配“z”。+等价于{1,}。
 */

#pragma mark- 私有方法
/** regStr: 匹配正则的 规则 字符串*/
-(BOOL)isValidForRegStr:(NSString *)regStr{
    
    NSPredicate* reg = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regStr];
    return [reg evaluateWithObject:self];
}



#pragma mark- 外部方法


-(BOOL)isvalid{
    
    NSString *regStr =  @"^((([\u4e00-\u9fa5]|[0-9]|[a-zA-Z]|[0-9])+)[\\s]?)+$";
    return   [self isValidForRegStr:regStr];
    
}



/** 空格*/
-(BOOL)isValidSpaceStr{
    NSString *regStr = @"^(\\s)+$";
    
    return   [self isValidForRegStr:regStr];
}


/** 中文汉字 + 数字*/
-(BOOL)isValidChineseStr{
    NSString *regStr = @"^([\u4e00-\u9fa5]|[0-9])+$";
    return   [self isValidForRegStr:regStr];
}

/** 中文标点符号 */
-(BOOL)isValidChinesePunctuationStr{
    
    // \\% 表示的是 % 符号
    NSString *regStr = @"^([\\&\\|\\\\\%\\{\\}\\（\\）\\《\\》\\：\\；\\、\\，\\。\\？\\“\\”\\<\\>\\！\\【\\】\\-\\/\\￥\\~\\#\\$\\……\\^\\@\\*\\_\\+\\=])+$";
    
    return   [self isValidForRegStr:regStr];
}

/** 中文+ 中文标点 + 数字
 */
-(BOOL)isValidChineseAndChinesePunctuationStr{
    
    //该表达式可以识别出： 。 ；  ， ： “ ”（ ） 、 ？ 《 》 这些标点符号。
    NSString *regStr = @"^([\u4e00-\u9fa5]|[0-9]|[\u3002\uff1b\uff0c\uff1a\u201c\u201d\uff08\uff09\u3001\uff1f\u300a\u300b])+$";
    return   [self isValidForRegStr:regStr];
}


/** 英语字母 + 数字*/
-(BOOL)isValidEnglishStr{
    
    NSString *regStr = @"^([a-zA-Z]|[0-9])+$";
    
    return   [self isValidForRegStr:regStr];
    
}


/** 英语 标点*/
-(BOOL)isValidEnglishPunctuationStr{
    
    NSString *regStr = @"^(['\"{}\\(\\)\\[\\]\\*&.?!,…:;])+$";
    return   [self isValidForRegStr:regStr];
    
}



/** 英语字母 + 数字 + 标点 */
-(BOOL)isValidEnglishAndEnglishPunctuationStr{
    
    NSString *regStr = @"^([a-zA-Z]|[0-9]|['\"{}\\(\\)\\[\\]\\*&.?!,…:;])+$";
    return   [self isValidForRegStr:regStr];
    
}




/** 数字*/
-(BOOL)isValidNumberStr{
    
    NSString *regStr = @"^([0-9])+$";
    return   [self isValidForRegStr:regStr];
    
}


/** 中文 英文 中文标点 英文标点 数字*/
-(BOOL)isValidCN_CNPunctuation_Eng_EngPunctuation_NumStr{
    
    NSString *regStr = @"^([\u4e00-\u9fa5]|[0-9]|[\u3002\uff1b\uff0c\uff1a\u201c\u201d\uff08\uff09\u3001\uff1f\u300a\u300b]|[a-zA-Z]|[0-9]|['\"{}\\(\\)\\[\\]\\*&.?!,…:;])+$";
    
    
    return   [self isValidForRegStr:regStr];
    
}

@end
