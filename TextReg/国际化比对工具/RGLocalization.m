//
//  RGLocalization.m
//  TextReg
//
//  Created by yangrui on 2018/12/18.
//  Copyright © 2018 yangrui. All rights reserved.
//

#import "RGLocalization.h"

#import "NSString+reg.h"

@implementation RGLocalization

/**
 检查前面的键有没有重复的, 重复的将被打印出来
 "debug"="debug";
 "isChina"="isChina";
 "Setup failed"="Setup failed";
 "Next"="Next";
 "Hubs"="Hubs";
 "Search"="Add";
 "debug"="debug";
 "isChina"="isChina";
 "Setup failed"="Setup failed";
 "Next"="Next";
 "Hubs"="Hubs";
 "Search"="Add";
 */
+(void)compareRepeatPath:(NSString *)path{
    NSString *fileStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // 将 本地语言一句句的 正则取出来
    NSString *pattern = @"[\"]{1}.*[\"]{1}[=]{1}[\"]{1}.*[\"]{1};?";
    NSArray *arr = [fileStr subStringArrWithPattern:pattern];
    NSMutableArray *newArrM = [NSMutableArray array];
    for(int i = 0; i < arr.count; i++){
        NSString *prefixStr = [[arr[i] componentsSeparatedByString:@"="] firstObject];
        [newArrM addObject:prefixStr];
    }
     
    for (int a = 0 ; a< newArrM.count ; a++){
        NSString *temA = newArrM[a];
        if (a < newArrM.count - 1) {
            for (int b = a+1; b < newArrM.count; b++) {
                NSString *tempB = newArrM[b];
                if ([temA isEqualToString:tempB]) {
                    // 将重复的key  打印出来
                    NSLog(@"重复===> %@",temA);
                    break;
                }
            }
        }
        
    }
}

+(void)replaceValuePath:(NSString *)path toSPath:(NSString *)toPath{
    NSString *fileStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // 将 本地语言一句句的 正则取出来
    //  "debug"="debug";
    NSString *pattern = @"[\"]{1}.*[\"]{1}[=]{1}[\"]{1}.*[\"]{1};?";
    NSArray *arr = [fileStr subStringArrWithPattern:pattern];
    
    
    
    NSMutableArray *replaceStrArrM = [NSMutableArray array];
    for(int i = 0; i < arr.count; i++){
        NSString *prefixStr = [[arr[i] componentsSeparatedByString:@"="] firstObject];
       
        NSString *str = [NSString stringWithFormat:@"%@=%@;",prefixStr,prefixStr];
        [replaceStrArrM addObject:str];
        
        
    }
    
    
    NSMutableString *longStrM = [NSMutableString string];
    for (int i = 0 ; i < replaceStrArrM.count; i++) {
        [longStrM appendString:replaceStrArrM[i]];
        [longStrM appendString:@"\n"];
    }
    
    [longStrM writeToFile:toPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
  
}

@end
