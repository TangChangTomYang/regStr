//
//  YRLabelViewController.m
//  YRLabel
//
//  Created by yangrui on 2018/5/20.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRLabelViewController.h"
#import "YRLabel.h"

@interface YRLabelViewController ()
@property (weak, nonatomic) IBOutlet YRLabel *demoLabel;
@end

@implementation YRLabelViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.demoLabel.linkCallBack = ^(YRLabel *lb, NSString *tapStr, NSRange range) {
        
        NSLog(@"%@", lb);
        NSLog(@"%@", tapStr);
        NSLog(@"%@", NSStringFromRange(range));
    };
    
    
    self.demoLabel.usrCallBack = ^(YRLabel *lb, NSString *tapStr, NSRange range) {
        NSLog(@"%@", lb);
        NSLog(@"%@", tapStr);
        NSLog(@"%@", NSStringFromRange(range));
    };
    
    self.demoLabel.topicCallBack = ^(YRLabel *lb, NSString *tapStr, NSRange range) {
        NSLog(@"%@", lb);
        NSLog(@"%@", tapStr);
        NSLog(@"%@", NSStringFromRange(range));
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.demoLabel.text = @"作者:@Tomyang 话题:#Label字符串识别# 网址:http://www.520it.com ";
    
    
    //       self.demoLabel.text = @"作者:@cod";
    
}
@end
