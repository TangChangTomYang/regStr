//
//  YRLabel.h
//  YRLabel
//
//  Created by yangrui on 2018/5/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TapHandleType_none,
    TapHandleType_usr,
    TapHandleType_topic,
    TapHandleType_link
    
}TapHandleType;

@class YRLabel;
typedef void (^YRLabelCallBack)(YRLabel *lb, NSString *tapStr, NSRange range);

@interface YRLabel : UILabel


/** 匹配文字的颜色*/
@property(nonatomic, strong)UIColor *matchTextColor;

@property(nonatomic, copy)YRLabelCallBack linkCallBack;
@property(nonatomic, copy)YRLabelCallBack usrCallBack;
@property(nonatomic, copy)YRLabelCallBack topicCallBack;
@end
