//
//  RGLocalization.h
//  TextReg
//
//  Created by yangrui on 2018/12/18.
//  Copyright © 2018 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGLocalization : NSObject
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
+(void)compareRepeatPath:(NSString *)path;


/**
 "china"="中国";
 "english"="英国";
 
 ==>
 
 "china"="china";
 "english"="english";
 */
+(void)replaceValuePath:(NSString *)path toSPath:(NSString *)toPath;

@end

