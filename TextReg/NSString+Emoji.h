//
//  NSString+Emoji.h
//  TextReg
//
//  Created by yangrui on 2018/5/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+EmojiRegex.h"

@interface NSString (Emoji)



-(NSMutableAttributedString *)convert2EmojiStr;

@end
