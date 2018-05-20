//
//  YRLabel.m
//  YRLabel
//
//  Created by yangrui on 2018/5/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "YRLabel.h"




@interface YRLabel ()

/** NSMutableAttributedString 的子类 */
@property(nonatomic, strong)NSTextStorage *textStorage;
/** 布局管理者 */
@property(nonatomic, strong)NSLayoutManager *layoutMgr;
/**容器，需要设置容器的大小*/
@property(nonatomic, strong)NSTextContainer *textContainer;

// 用于记录小标值
@property(nonatomic, strong)NSMutableArray<NSValue *> *linkRangeArrM;
@property(nonatomic, strong)NSMutableArray<NSValue *> *usrRangeArrM;
@property(nonatomic, strong)NSMutableArray<NSValue *> *topicRangeArrM;

/**记录用户选中的range*/
@property(nonatomic, strong)NSValue *selectedRange;
/**用户记录点击还是松开*/
@property(nonatomic, assign)BOOL isSelected ;


/** 用于标记点击的是哪种类型的连接,
 比如: 话题##  ,@用户, http://
 */
@property(nonatomic, assign)TapHandleType tapType;

@end


@implementation YRLabel


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self prepareTextSystem];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self prepareTextSystem];
    }
    return self;
}

//-(void)awakeFromNib{
//    [super awakeFromNib];
//
//    [self prepareTextSystem];
//
//}

-(void)layoutSubviews{
    [super layoutSubviews];
    // 设置容器的大小为 Label的尺寸
    self.textContainer.size = self.frame.size;
}



#pragma mark- 重写drawTestInRect 方法
-(void)drawTextInRect:(CGRect)rect{

    //1. 绘制背景
    if(self.selectedRange != nil){

        //2. 确定选中的背景颜色
        UIColor *selectedColor = self.isSelected == YES ? [UIColor colorWithWhite:0.7 alpha:0.2] : [UIColor clearColor];
        
        //2.1 设置颜色
        [self.textStorage addAttribute:NSBackgroundColorAttributeName value:selectedColor range:[self.selectedRange rangeValue]];

        //2.2 绘制背景
        [self.layoutMgr drawBackgroundForGlyphRange:[self.selectedRange rangeValue] atPoint:CGPointZero];
    }

    //2. 绘制字型
    // 需要绘制的范围
    NSRange range = NSMakeRange(0, self.textStorage.length);
    [self.layoutMgr drawGlyphsForGlyphRange:range atPoint:CGPointZero];

}

/** 准备文本系统 */
-(void)prepareTextSystem{
    self.tapType = TapHandleType_none;
    
    //0. 准备文本
    [self prepareText];
    
    //1.将布局添加到storeage 中
    [self.textStorage addLayoutManager:self.layoutMgr];
    
    //2. 将容器添加到布局中
    [self.layoutMgr addTextContainer:self.textContainer];
    
    //3. 让label 可交互
    self.userInteractionEnabled = YES;
    
    //4. 设置间距为0
    self.textContainer.lineFragmentPadding = 0;
    
}


/** 给 匹配出的range 添加 前景色 */
-(void)prepareText{
    /// 如果用户没有设置lineBreak 和 numberOfLines = 0 ,则所有内容会绘制到同一行中,因此需要主动设置
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    
    
    //1. 准备字符串
    NSMutableAttributedString *attStrM;
    
    if(self.attributedText != nil){
        attStrM =  [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    else if (self.text != nil){
        attStrM = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    else {
        
        attStrM = [[NSMutableAttributedString alloc]initWithString:@""];
    }
    
    // 设置字体
    [attStrM addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attStrM.length)];
    
    //3. 设置textStorage 的内容
    [self.textStorage setAttributedString:attStrM];
    
 
    self.selectedRange = nil;
    
    
    //4. 匹配URL
    self.linkRangeArrM = [self getLinkRanges];
    if (self.linkRangeArrM.count > 0) {
        [self textStorageAddMatchRangeArr:self.linkRangeArrM];
    }

    //5. 匹配@用户
    self.usrRangeArrM = [self getUsrRanges];
    if (self.usrRangeArrM.count > 0) {
         [self textStorageAddMatchRangeArr:self.usrRangeArrM];
    }

    //6. 匹配话题##
    self.topicRangeArrM = [self getTopicRanges];
    if(self.topicRangeArrM.count > 0){
         [self textStorageAddMatchRangeArr:self.topicRangeArrM];
    }
    
    // 刷新页面
    [self setNeedsDisplay];

}

/** 给匹配出的位置添加前景色*/
-(void)textStorageAddMatchRangeArr:(NSArray<NSValue *> *)matchRangeArr{
    for (NSValue *rangevalue in matchRangeArr) {
        NSRange range = rangevalue.rangeValue;
        [self.textStorage  addAttribute:NSForegroundColorAttributeName value:self.matchTextColor range:range];
    }
    
}


/** 匹配话题, "#.*?#"  */
-(NSMutableArray<NSValue *> *)getTopicRanges{
    
    return [self getRangesWithPattern:@"#.*?#"];
}

/** 5.匹配@用户 "@[\\u4e00-\\u9fa5a-zA-Z0-9_-]*" */
-(NSMutableArray<NSValue *> *)getUsrRanges{
    
    return [self getRangesWithPattern:@"@[\\u4e00-\\u9fa5a-zA-Z0-9_-]*"];
}


-(NSMutableArray<NSValue *> *)getLinkRanges{
    
    NSError *err = nil;
    NSDataDetector *dataDetector =  [[NSDataDetector alloc] initWithTypes:NSTextCheckingTypeLink error:&err];
    if (err != nil) {
        return nil;
    }
    
    NSArray<NSTextCheckingResult *> *resultArr = [dataDetector  matchesInString:self.textStorage.string options:kNilOptions range:NSMakeRange(0, self.textStorage.length)];
    
    return [self rangeArrMWithTextCheckingResultArr:resultArr];;
    
}



-(NSMutableArray<NSValue *> *)getRangesWithPattern:(NSString *)pattern{
    
    NSError *err = nil;
    NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:pattern options:kNilOptions error:&err];
    
    if (err != nil) {
        return nil;
    }
    
    NSArray<NSTextCheckingResult *> *resultArr = [reg matchesInString:self.textStorage.string options:kNilOptions range:NSMakeRange(0, self.textStorage.length)];
    
   return  [self rangeArrMWithTextCheckingResultArr:resultArr];
}




-(NSMutableArray<NSValue *> *)rangeArrMWithTextCheckingResultArr:(NSArray<NSTextCheckingResult *> *)resultArr{
    if (resultArr.count == 0) {
        return nil;
    }
    
    NSMutableArray *rangeArrM = [NSMutableArray array];
    for (NSTextCheckingResult *result in resultArr) {
        [rangeArrM addObject:[NSValue valueWithRange:result.range]];
        
    }
    return rangeArrM;
    
}




#pragma mark- 点击事件

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 0. 记录 点击
    self.isSelected = YES;
    
    // 1. 获取点击的位置
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    
    //2. 获取该点所在字符串的range
    self.selectedRange = [self getSelectedRangeAtPoint:touchPoint];
   
    if (self.selectedRange == nil) {
        [super touchesBegan:touches withEvent:event];
    }
    
}


-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.selectedRange == nil) {
        [super touchesEnded:touches withEvent:event];
        return;
    }
    
    // 0. 记录松开
    self.isSelected = NO;
    
    //1. 重绘刷新
    [self setNeedsDisplay];
    
    //2. 取出内容
    NSRange selectedRange = [self.selectedRange rangeValue];
    NSString *selectecStr = [self.textStorage.string substringWithRange:selectedRange];
    
    //3. 回调
    
    switch (self.tapType) {
        case TapHandleType_link:{
            if (self.linkCallBack) {
                self.linkCallBack(self, selectecStr, selectedRange);
            }
            
        } break;
        case TapHandleType_usr:{
            if (self.usrCallBack) {
                self.usrCallBack(self, selectecStr, selectedRange);
            }
        } break;
        case TapHandleType_topic:{
            if (self.topicCallBack) {
                self.topicCallBack(self, selectecStr, selectedRange);
            }
            
        } break;
            
        default:
            break;
    }
    
    
}

-(NSValue *)getSelectedRangeAtPoint:(CGPoint)touchPoint{
  
    //0. 如果该属性串为nil 则不需要查了
    if(self.textStorage.length == 0){
        return nil ;
        
    }
    
    
    //1. 获取选中点的下标值(index)
    NSInteger index = [self.layoutMgr glyphIndexForPoint:touchPoint inTextContainer:self.textContainer];
    
    //2.判断下表在什么 内
    //2.1 判断是否是一个连接
    for (NSValue *linkValue in self.linkRangeArrM) {
        NSRange linkRane = [linkValue rangeValue];
        if (index > linkRane.location && index < (linkRane.location + linkRane.length)) {
            self.tapType = TapHandleType_link;
            [self setNeedsDisplay];
            return [linkValue copy];
        }
    }
    
    // 判断是否是一个用户
    for (NSValue *usrValue in self.usrRangeArrM) {
        NSRange usrRange = [usrValue rangeValue];
        if (index > usrRange.location && index < (usrRange.location + usrRange.length)) {
            self.tapType = TapHandleType_usr;
            [self setNeedsDisplay];
            return [usrValue copy];
        }
    }
    
    // 判断是否是一个话题
    for (NSValue *topicValue in self.topicRangeArrM) {
        NSRange topicRange = [topicValue rangeValue];
        if (index > topicRange.location && index < (topicRange.location + topicRange.length)) {
            self.tapType = TapHandleType_topic;
            [self setNeedsDisplay];
            return [topicValue copy];
        }
    }
    
    return  nil;
    
}








#pragma mark- lazy
// NSMutableAttributeString的子类
-(NSTextStorage *)textStorage{
    if(!_textStorage){
        _textStorage = [[NSTextStorage alloc]init];;
    }
    return _textStorage;
}

// 布局管理者
-(NSLayoutManager *)layoutMgr{
    if(!_layoutMgr){
        _layoutMgr = [[NSLayoutManager alloc]init];
    }
    return _layoutMgr;
}

// 容器,需要设置容器的
-(NSTextContainer *)textContainer{
    if(!_textContainer){
        _textContainer = [[NSTextContainer alloc]init];
    }
    return _textContainer;
}

-(NSMutableArray<NSValue *> *)linkRangeArrM{
    
    if (!_linkRangeArrM) {
        _linkRangeArrM = [NSMutableArray array];
    }
    return _linkRangeArrM;
}
-(NSMutableArray<NSValue *> *)usrRangeArrM{
    
    if (!_usrRangeArrM) {
        _usrRangeArrM = [NSMutableArray array];
    }
    return _usrRangeArrM;
}
-(NSMutableArray<NSValue *> *)topicRangeArrM{
    
    if (!_topicRangeArrM) {
        _topicRangeArrM = [NSMutableArray array];
    }
    return _topicRangeArrM;
}

@synthesize matchTextColor = _matchTextColor;
-(UIColor *)matchTextColor{
    
    if(!_matchTextColor){
        _matchTextColor = [UIColor purpleColor];
    }
    return _matchTextColor;
}




#pragma mark- set
-(void)setText:(NSString *)text{
    
    [super setText:text];
    [self prepareText];
}

-(void)setAttributedText:(NSAttributedString *)attributedText{
    [super setAttributedText:attributedText];
    [self prepareText];
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    [self prepareText];
}

-(void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    [self prepareText];
}

//-(void)setHighlightedTextColor:(UIColor *)highlightedTextColor{
//    [super setHighlightedTextColor:highlightedTextColor];
//    [self prepareText];
//}


-(void)setMatchTextColor:(UIColor *)matchTextColor{
    _matchTextColor = matchTextColor;
    [self prepareText];
}































@end
