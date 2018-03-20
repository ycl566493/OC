//
//  TC_KDDZ.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_KDDZ.h"
#import "My_PickerView.h"//地区

@interface TC_KDDZ()

@property(nonatomic,weak)My_PickerView *pickerV;

@end

@implementation TC_KDDZ

- (void)layoutSubviews {
    [super layoutSubviews];
    [self init_UI];
    
}

-(void)init_UI{
    
}

- (IBAction)DQ_Action:(id)sender {
    NSLog(@"地区点击");
    NSArray *arr = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"8"],@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h"],@[@"A",@"B",@"C",@"D",@"F"],@[@"99",@"98",@"97",@"96"]];
    
    self.pickerV.arr_Data = arr;
}

-(My_PickerView *)pickerV{
    if (!_pickerV) {
        My_PickerView *picker = [My_PickerView init_Xib];
        _pickerV = picker;
        _pickerV.Lie_H = 46;
        _pickerV.frame = self.bounds;
        [self addSubview:_pickerV];
    }
    return _pickerV;
}

#pragma mark- 关闭
- (IBAction)btn_GB:(UIButton *)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
