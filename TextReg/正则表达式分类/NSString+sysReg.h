//
//  NSString+sysReg.h
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (sysReg)

/** 获取字符串中包含的所有URL string, 比较靠谱*/
-(NSMutableArray<NSString *> *)urlStrArrM;


/** 获取字符串中包含的所有 date string, 注意:因为国外的日期格式不一样,因此,可能识别不出来不是特别靠谱*/
-(NSMutableArray<NSString *> *)dateStrArrM;


/** 获取字符串中包含的所有phoneNum string,注意:因为国外的电话格式不一样,因此,可能将日期识别为 电话 不是特别靠谱*/
-(NSMutableArray<NSString *> *)phoneNumStrArrM;
@end
