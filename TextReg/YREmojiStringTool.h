//
//  YREmojiStringTool.h
//  TextReg
//
//  Created by yangrui on 2018/5/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YREmojiStringTool;
@protocol YREmojiStringToolDelegate <NSObject>

@required
-(UIImage *)emojiOfName:(NSString *)name;

@end
@interface YREmojiStringTool : NSObject

@property(nonatomic, strong)id<YREmojiStringToolDelegate>  delegate;
+(instancetype)share;
-(NSMutableAttributedString *)emojiStr:(NSString *)str lineHeight:(CGFloat)lineHeight;

/** 使用4个步骤
 step1: 创建单例对象
 step2: 设置代理
 step3: 实现代理方法
 step4: 调用方法
 */

@end
