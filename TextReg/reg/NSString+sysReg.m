//
//  NSString+sysReg.m
//  TextReg
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "NSString+sysReg.h"

@implementation NSString (sysReg)



-(NSMutableArray<NSString *> *)urlStrArrM{
    return   [self strArrWithType:NSTextCheckingTypeLink];
    
}

-(NSMutableArray<NSString *> *)dateStrArrM{
    return   [self strArrWithType:NSTextCheckingTypeDate];
    
}

-(NSMutableArray<NSString *> *)phoneNumStrArrM{
    
    return   [self strArrWithType:NSTextCheckingTypePhoneNumber];
}




-(NSMutableArray<NSString *> *)strArrWithType:(NSTextCheckingType)type{
    
    NSError *err = nil;
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:type error:&err];
    if (err != nil) {
        return nil;
    }
    
    NSArray<NSTextCheckingResult *> * resultArr = [dataDetector matchesInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    
    if (resultArr.count == 0) {
        return nil;
    }
    
    NSMutableArray *strArrM = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        [strArrM addObject:[self substringWithRange:result.range]];
        
    }
    
    return strArrM;
}


@end
