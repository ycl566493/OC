//
//  TC_TJDZ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_TJDZ_V.h"
#import "My_PickerView.h"//地区

@interface TC_TJDZ_V()

@property(nonatomic,weak)My_PickerView *pickerV;

@end

@implementation TC_TJDZ_V

- (void)layoutSubviews {
    [super layoutSubviews];
    [self init_UI];

}
-(void)init_UI{
    self.lbl_MDDZ.text = @"九分裤圣诞节疯狂拉丝机";
    self.view_H.constant = self.btn_BC.bottom +15;
}

#pragma mark- 门店点击
- (IBAction)MD_Action:(id)sender {
    NSLog(@"门店点击");

}
#pragma mark- 地区点击

- (IBAction)btn_DQ:(id)sender {
    NSArray *arr = @[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"8"],@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h"],@[@"A",@"B",@"C",@"D",@"F"],@[@"99",@"98",@"97",@"96"]];
    self.pickerV.Lie_H = arr.count;
    self.pickerV.arr_Data = arr;
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
