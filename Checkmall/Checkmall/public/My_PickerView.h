//
//  My_PickerView.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@interface My_PickerView : MyUIView

@property (weak, nonatomic) IBOutlet UIButton *btn_QX;//取消

@property (weak, nonatomic) IBOutlet UIButton *btn_QD;//确定

@property (weak, nonatomic) IBOutlet UIPickerView *pickerV;//列表

@property (nonatomic,assign) NSInteger          Lie;//几列

@property (nonatomic,strong) NSArray            *arr_Data;//每列的数据 有几列就有几个元素 每个元素必须是数组

@property (nonatomic,assign)CGFloat             Lie_H;//每行高度

@end
