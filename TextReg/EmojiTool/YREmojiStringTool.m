//
//  YREmojiStringTool.m
//  TextReg
//
//  Created by yangrui on 2018/5/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YREmojiStringTool.h"
#import "NSString+reg.h"

YREmojiStringTool *_emoiTool = nil;
@implementation YREmojiStringTool


+(instancetype)share{
    
    if (!_emoiTool) {
        _emoiTool = [[self alloc]init];
    }
    return _emoiTool;
    
}


-(NSMutableAttributedString *)emojiStr:(NSString *)str lineHeight:(CGFloat)lineHeight{
    NSString *pattern = @"\\[.*?\\]";
    
    NSMutableArray<NSDictionary *> *dicArrM =  [str subDicArrWithPattern:pattern];
    
    
    if (dicArrM.count == 0) {
        return nil;
    }
    
    NSMutableAttributedString *emojiStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    NSInteger emojiCount = dicArrM.count;
    for (NSInteger i = emojiCount - 1; i >= 0; i--) {
        NSDictionary *dic = dicArrM[i];
       
        NSString *imgStr = dic[ksubStr];
        UIImage *emoji = [self.delegate  emojiOfName:imgStr];
        
        if (emoji != nil) {
            NSRange imgStrRange = NSRangeFromString(dic[ksubRange]);
            
            NSTextAttachment *attachMent = [[NSTextAttachment alloc]init];
            attachMent.image = emoji;
            attachMent.bounds = CGRectMake(0, -4, lineHeight, lineHeight);
            NSAttributedString *attStr = [NSAttributedString attributedStringWithAttachment:attachMent];
            
            [emojiStr replaceCharactersInRange:imgStrRange withAttributedString:attStr];
        }
        
        
    }
    
    
    return emojiStr;
    
}



@end
