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
    
    NSString *rawStr = @"asdfghjkl;qwertyuiop";
    NSString *pattern = @"";
    
    /**
     练习1： 匹配，abc
     练习1： 匹配，包含一个a~z，后面必须是0~9--> [a-z][0-9] 或者[a-z]\d
     练习1： 匹配，必须第一个是字母，第二个是数字--> ^[a-z][0-9]$ 或者 ^[a-z]\d$
     练习1： 匹配，必须第一个是字母，字母后面跟4~9个数字--> ^[a-z][0-9]{4,9}$或者^[a-z]\d{4,9}$
     练习1： 匹配，不能是数字0~9 -->
     练习1： 匹配，QQ (5-12位数字)匹配-->^[1-9][0-9]{4,11}$ 或者 ^[1-9]\d{4,11}$
     练习1： 匹配，手机，以 13、15、17、18 打头 --> ^1[3578][0-9]{9}$
     */
    
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
    
}


@end
