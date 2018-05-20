//
//  ViewController+sysReg.m
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController+sysReg.h"
#import "NSString+sysReg.h"

@implementation ViewController (sysReg)

- (IBAction)sysRegBtnClick:(id)sender {
    
    NSString * string = @"欢迎访问http://www.jianshu.com/users/72ee5da886ff/latest_articles. 咱的电话是012-1304445928.ps:电话:15828282814随便写 2015年12月20日的哟.今天是2016-10-25,天气(weather)不错";
    
    
    /** 电话要注意,
     电话: 15828282814
     电话: 2016-10-25
     */
    NSArray *phones =  [string phoneNumStrArrM];
    for (NSString *phone in phones) {
        NSLog(@"----------------------------");
        NSLog(@"电话: %@",phone);
    }
    
    NSArray *urls =  [string urlStrArrM];
    for (NSString *url in urls) {
        NSLog(@"----------------------------");
        NSLog(@"url: %@",url);
    }
//
//    NSArray *dates =  [string dateStrArrM];
//    for (NSString *date in dates) {
//        NSLog(@"date: %@",date);
//    }
    
    
}





@end
