//
//  NSString+validStr.h
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (validStr)

/** 匹配空格*/
-(BOOL)isValidSpaceStr;

/** 中文汉字 + 数字*/
-(BOOL)isValidChineseStr;

/** 中文标点符号 */
-(BOOL)isValidChinesePunctuationStr;

/** 中文+ 中文标点 + 数字*/
-(BOOL)isValidChineseAndChinesePunctuationStr;

/** 英语字母 + 数字*/
-(BOOL)isValidEnglishStr;

/** 英语 标点*/
-(BOOL)isValidEnglishPunctuationStr;

/** 英语字母 + 数字 + 标点 */
-(BOOL)isValidEnglishAndEnglishPunctuationStr;

/** 数字*/
-(BOOL)isValidNumberStr;

/** 中文 英文 中文标点 英文标点 数字*/
-(BOOL)isValidCN_CNPunctuation_Eng_EngPunctuation_NumStr;
@end
