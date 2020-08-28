//
//  YRHtmlStrTool.h
//  TextReg
//
//  Created by edz on 2020/8/28.
//  Copyright © 2020 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+reg.h"



@interface YRHtmlStrTool : NSObject

// 获取所有的a标签,
//1. 待匹配的数据,如:  "亲爱的用户 <a href=\"http://baidu.com\" target=\"_blank\" >百度一下</a> 你好<a href=\"http://weixin.com\" target=\"_blank\" >weixinn一下</a>啊";
// 2. 匹配到的数据:
//        <a href=\"http://baidu.com\" target=\"_blank\" >百度一下</a>
//        <a href=\"http://weixin.com\" target=\"_blank\" >weixinn一下</a>
//
//        3. 正则样式: <\s*a[^>]*>(.*?)<\s*/\s*a>
// 因为 \ 是转义字符, 为了表示\ 我们需要再添一个\, 即在书写字符串时用 \\ 表示 \
// 因此匹配 a标签 的正则应写为:  @"<\\s*a[^>]*>(.*?)<\\s*/\\s*a>";
+(NSMutableArray<NSDictionary *> *)aTagArrOfString:(NSString *)string;



+(NSMutableArray<NSDictionary *> *)pTagArrOfString:(NSString *)string;
@end

