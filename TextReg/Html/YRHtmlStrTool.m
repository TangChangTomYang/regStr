//
//  YRHtmlStrTool.m
//  TextReg
//
//  Created by edz on 2020/8/28.
//  Copyright © 2020 yangrui. All rights reserved.
//

#import "YRHtmlStrTool.h"

@implementation YRHtmlStrTool

// 匹配字符串中所有的 成对 a标签 <a> </a>
+(NSMutableArray<NSDictionary *> *)aTagArrOfString:(NSString *)string{
    if (string.length == 0) {
        return nil;
    }
    
    NSString *regPattern = @"<\\s*a[^>]*>(.*?)<\\s*/\\s*a>";
    NSMutableArray<NSDictionary *> *dicM = [string subDicArrWithPattern:regPattern];
    return dicM;
}

+(NSMutableArray<NSDictionary *> *)pTagArrOfString:(NSString *)string{
    if (string.length == 0) {
        return nil;
    }
    
    NSString *regPattern = @"<\\s*p[^>]*>(.*?)<\\s*/\\s*p>";
    NSMutableArray<NSDictionary *> *dicM = [string subDicArrWithPattern:regPattern];
    return dicM;
}


// <a.+?href=\"(.+?)\".*>(.+)</a>

@end
