//
//  ViewController.m
//  TextReg
//
//  Created by yangrui on 2018/4/2.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "NSString+regStr.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *filed;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.filed addTarget:self action:@selector(fieldChange) forControlEvents:UIControlEventEditingChanged];
//    self.filed.delegate = self;
}

-(void)fieldChange{
    
    ;
    
//    BOOL isValid = [self.filed.text isValidChineseStr];
//    BOOL isValid = [self.filed.text isValidChinesePunctuationStr];
    BOOL isValid = [self.filed.text isValidCN_CNPunctuation_Eng_EngPunctuation_NumStr];
    if(isValid){
        
        NSLog(@"有效---%@---->",self.filed.text);
    }
    else{
        
        NSLog(@"=========无效====%@",self.filed.text);
    }
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//['\"{}\\(\\)\\[\\]\\*&.?!,…:;]

@end
