//
//  NSString+reg.h
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#define  ksubRange  @"ksubRange"    // 通过 ksubRange 获取NSRange
#define  ksubStr    @"ksubStr"      // 通过 ksubStr 获取NSRange 对应的子串
@interface NSString (reg)


/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的 subString
 */
-(NSMutableArray<NSString *> *)subStringArrWithPattern:(NSString *)regPattern;

/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的 subString 的NSRange
 */
-(NSMutableArray<NSString *> *)subRangeArrWithPattern:(NSString *)regPattern;

/**
 参数：regPattern 正则表达式的样式
 返回值： 满足 正则表达式样式的  NSRange NSString 字典数组
 */
-(NSMutableArray<NSDictionary *> *)subDicArrWithPattern:(NSString *)regPattern;



/**
 数字 汉子 英文 空格 符号之间最多一个 空格
 */
-(NSString *)validStr;


//@"^(([\u4e00-\u9fa5]|[0-9]|[a-zA-Z]|[0-9])[\\s]?)*"
-( NSString  *)subStringWithPattern:(NSString *)regPattern;






/**
 说明：
 
 '[]'   表示匹配其中任意一个字符,@"[abc123]" 表示必须是abc123其中任意一个
 '[^]'  表示匹配不是其中任意一个字符,@"[^abc123]" 表示必须不是是abc123其中任意一个
 '\d'   表示匹配所有的数字 相当于[0-9]
 '.'    表示匹配除换行符号以外的任意字符
 '\w'   表示匹配字母或数字或下划线或汉字
 '\s'    表示匹配任意的空白符
 
 
 '^'    表示匹配必须以什么开始， @"^[a-z]" 表示第一个必须是字母
 '$'    表示匹配必须以什么结尾, @"[123][asd]$" 表示必须以asd其中任意一个字符结尾
 
 '{n}'  表示{}前的字符(字符表达式)必须出现n次, @"[0-9][a-z]{3}"表示数字后面必须有3个字母
 '{n,m}'表示{}前的字符(字符表达式)必须出现最少n次最多m次, @"[0-9][a-z]{3,6}"表示数字后面必须有3到6个字母
 '{n,}' 表示{}前的字符(字符表达式)必须出现最少n次, @"[0-9][a-z]{3,}"表示数字后面至少3个字母
 
 '*'    表示*前面的字符（字符表达式）可以重复出现0次或更多次，@"[a-z][0-9]*" 表示字母后可以有数字
 '+'    表示+前面的字符（字符表达式）可以重复出现1次或更多次
 '?'    表示?前面的字符（字符表达式）可以重复出现0次或1次
 
 
 练习1： 匹配，abc
 练习2： 匹配，包含一个a~z，后面必须是0~9           --> [a-z][0-9] 或者[a-z]\d
 @"[a-z][0-9]"; 或者@"[a-z]\\d";
 练习3： 匹配，必须第一个是字母，第二个是数字         --> ^[a-z][0-9] 或者 ^[a-z]\d
 @"^[a-z][0-9]"; 或者 @"^[a-z]\\d";
 练习4： 匹配，必须第一个是字母，字母后面跟4~9个数字   --> ^[a-z][0-9]{4,9}或者^[a-z]\d{4,9}
 @"^[a-z][0-9]{4,9}"; 或者@"^[a-z]\\d{4,9}";
 练习5： 匹配，不能是数字4~9                      -->[^4-9]
 @"[^4-9]";
 练习6： 匹配，QQ (5-12位数字)匹配                 -->^[1-9][0-9]{4,11}$ 或者 ^[1-9]\d{4,11}$
 @"^[1-9][0-9]{4,11}$"; 或者 @"^[1-9]\d{4,11}$";
 练习7： 匹配，手机，以 13、15、17、18 打头          --> ^1[3578][0-9]{9}$
 @"^1[3578][0-9]{9}$";
 练习8: 匹配,微博数据," @zhangsan:【成都新闻】 #春熙路#宁夏街[偷笑]，@张老五：老西门，城东们[吃惊]@西门吹雪：皮读取#碧波园#白桥[好爱哦]~~~http://baidu.com.news"
 1. 匹配，@xxx：   --> @.*?:
 @"@.*?"
 2. 匹配，话题 #xxx# --> #.*?#
 @"#.*?#"
 3. 匹配表情，[好爱哦] --> [.*?]
 @"\\[.*?\\]"
 
 练习9：urL正则表达式, @"http(s)?://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?"
 */


@end
