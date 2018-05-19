//
//  ViewController.m
//  TextReg
//
//  Created by yangrui on 2018/4/2.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "NSString+regStr.h"

#import "NSString+EmojiRegex.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *filed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.filed addTarget:self action:@selector(fieldChange) forControlEvents:UIControlEventEditingChanged];
}

-(void)fieldChange{
//    BOOL isValid = [self.filed.text isValidChineseStr];
//    BOOL isValid = [self.filed.text isValidChinesePunctuationStr];
//    BOOL isValid = [self.filed.text isValidCN_CNPunctuation_Eng_EngPunctuation_NumStr];
//    BOOL isValid = [self.filed.text isValidSpaceStr];
    BOOL isValid = [self.filed.text isValidChinesePunctuationStr];
    
    
    if(isValid){
        NSLog(@"有效---%@---->",self.filed.text);
    }
    else{
        NSLog(@"=========无效====%@",self.filed.text);
    }
   
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    /** 表情  [吃惊] [好爱哦]
     */
    NSString *rawStr = @"@zhangsan:【成都新闻】 #春熙路#宁夏街[偷笑]，@张老五：老西门，城东们[吃惊]@西门吹雪：皮读取#碧波园#白桥[好爱哦]~~~http://baidu.com.news";
    NSString *pattern = @"\\[.*?\\]";
 
 
    
    /** 匹配字符串 */
    NSArray *subStrArr = [rawStr subStringArrWithPattern:pattern];
   
    if (subStrArr.count > 0) {
        NSLog(@"匹配结果如下：");
    
        for (NSString *subStr in subStrArr) {
            NSLog(@"%@",subStr);
        }
    }
    else{
        NSLog(@"-------匹配 失败了--------");
    }
    
     /** 匹配字符串 range*/
    NSArray *rangArr = [rawStr subStringRangeArrWithPattern:pattern];
    
    if (rangArr.count > 0) {
        for (NSString *rangStr in rangArr) {
            NSLog(@"rangStr:%@",rangStr);
        }
    }
    else{
        NSLog(@"---rangStr----匹配 失败了--------");
    }
    
    
}


@end
