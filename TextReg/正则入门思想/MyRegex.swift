//
//  MyRegex.swift
//  MyRegPractice
//
//  Created by yangrui on 2018/4/30.
//  Copyright © 2018年 yangrui. All rights reserved.
//

import UIKit

class MyRegex: NSObject {

    
    
    // 匹配abc
    func myReg() {
        // 使用正则表达式的主要步骤
        
        
        let rawStr = "abcaaaaabc"
        
        //1. 创建正则表达式规则
        let pattern = "abc"   // 匹配出所有的abc
        
//        //2.[]括起来的部分表示匹配其中出现的任意一个字符
//        let pattern = "[a-z]"  // 表示匹配所有的小写字符
//        let pattern = "[0-9]"  // 表示匹配所有的数字
//        let pattern = "[0-9][a-z]"  // 表示匹配一个数字后面一个字符
//        
//        
//        //3.\d 表示匹配一个数字 等价于[0-9]或者[0123456789]
//        let pattern = "\\d"
//        
//        
//        4.^ 在正在表达式样式前面表示匹配字符串开始必须是^号后面根的字符
//        let pattern = "^[a-z]" // 表示必须是必须是字符开头
//        let pattern = "^[a-z0-9]" // 表示必须是必须是字符或者数字开头
//        
//        5. {x}跟在某个字符的后面表示必须匹配 x个对应的字符
//        let pattern = "^[a-z][0-9]{2}" //  表示第二个第三个字符必须数字
//        
//        6. {x,y}跟在某个字符的后面表示必须 x到y个对应的字符
//        let pattern = "^[a-z][0-9]{2,8}" //  表示第一个字符之后必须是2到8个数字
//        
//        
//        7. $ 在样式的末尾表示匹配结尾必须是
//        let pattern = "[0-9]{2}$" // 表示结尾必须是2个数字
//        let pattern = "[5-9]{2,8}$" // 表示结尾必须是2到8个5到9之间的数字
//        
//        8. ^ 在[]中表示 匹配某个字符不能是 在对应字符前面加^
//        let pattern = "[^a-z0-4]" //表示不能是小写字母或0到4的数字
//        
//        9. 匹配QQ号码
//        let pattern = "^[1-9]\\d{5-11}$"   // 表示匹配一个数字是1-9,且必须以5-11位数字结尾
//        
//        10. 匹配电话号码 以 13 15 17 18 开头
//        let pattern = "^1[3578]\\d{9}$"
        
        
        
        
        
        guard let regex =  try? NSRegularExpression(pattern: pattern, options: []) else {
            print("创建正则表达式失败")
            return
        }
        //3. 匹配字符串中的内容
        
        let resultArr  =  regex.matches(in: rawStr, options: [], range: NSRange(location: 0, length: (rawStr as NSString).length))
        
        
        //4. 获取匹配出的结果
        for result in resultArr {
            let resultStr = (rawStr as NSString).substring(with: result.range)
            print("result:\(resultStr),result range: \(result.range)")
        }
        
        if resultArr.count == 0{
            print("匹配失败")
        }
        
    }
    

}
