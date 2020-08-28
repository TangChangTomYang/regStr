//
//  YRHtmlViewController.m
//  TextReg
//
//  Created by edz on 2020/8/28.
//  Copyright © 2020 yangrui. All rights reserved.
//

#import "YRHtmlViewController.h"
#import "YRHtmlStrTool.h"

@interface YRHtmlViewController ()

@end

@implementation YRHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *str = self.lb.text;
    NSArray *aTagArr = [YRHtmlStrTool aTagArrOfString:str];
    NSLog(@"%@",aTagArr );
    
    NSArray *pTagArr = [YRHtmlStrTool pTagArrOfString:str];
    NSLog(@"%@",pTagArr );
    
}
 

@end
