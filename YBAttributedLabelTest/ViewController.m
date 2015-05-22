//
//  ViewController.m
//  YBAttributedLabelTest
//
//  Created by 杨彬 on 15/4/29.
//  Copyright (c) 2015年 macbook air. All rights reserved.
//

#import "ViewController.h"
#import "YBAttrbutedLabel.h"

@interface ViewController ()<YBAttrbutedLabelDelegate>

@property (weak, nonatomic) IBOutlet YBAttrbutedLabel *test_label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.test_label.delegate = self;
    
    NSMutableArray *range_array = [[NSMutableArray alloc]init];
    
    NSString *text_label_text = @"";
    
    NSString *string = @"测试888";
    
    NSRange text_range1 = NSMakeRange(text_label_text.length, string.length);
    YBAttrbutedModel *model1 = [[YBAttrbutedModel alloc]init];
    model1.text = string;
    model1.range = text_range1;
    [range_array addObject:model1];
    
    
    text_label_text = [NSString stringWithFormat:@"%@%@一下下嘛,别这么",text_label_text,string];
    
    NSString *string2 = @"凶";
    NSRange text_range2 = NSMakeRange(text_label_text.length, string2.length);
    YBAttrbutedModel *model2 = [[YBAttrbutedModel alloc]init];
    model2.text = string2;
    model2.range = text_range2;
    [range_array addObject:model2];
    
    text_label_text = [NSString stringWithFormat:@"%@%@撒！！！",text_label_text,string2];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:text_label_text];
    
    
    self.test_label.attributedText = attributedString;
    self.test_label.link_array = range_array;
    
    
    self.test_label.font = [UIFont systemFontOfSize:16];
    self.test_label.lineBreakMode = kCTLineBreakByCharWrapping;
}


#pragma mark - YBAttrbutedLabelDelegate


- (void)YBAttrbutedLabel:(YBAttrbutedLabel *)label click:(YBAttrbutedModel *)model{
    NSLog(@"%@ %@",model.text, NSStringFromRange(model.range));
}


@end
