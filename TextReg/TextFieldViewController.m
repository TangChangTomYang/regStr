//
//  TextFieldViewController.m
//  TextReg
//
//  Created by yangrui on 2018/5/30.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "TextFieldViewController.h"
#import "NSString+validStr.h"
#import "NSString+reg.h"

@interface TextFieldViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *field;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.field.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change) name:UITextFieldTextDidChangeNotification object:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSString * str = @"asd fas";
    NSString * str = @"asd fas 234😯23423, 张 ";
    str = [str validStr];
    NSLog(@"--->%@<----len:%ld",str, str.length);
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"textField:%@,--s:%ld, e:%ld, str: %@",textField.text, range.location, range.length, string );
    
    return YES;
}

-(void)change{
    NSLog(@"%@",self.field.text);
    
   self.field.text = [self.field.text validStr];
    
    NSLog(@"=====>%@<=======len:%ld",self.field.text,self.field.text.length);
}




@end
