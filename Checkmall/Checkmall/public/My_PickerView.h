//
//  My_PickerView.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@protocol My_PickerView_Delegate <NSObject>

@optional
-(void)My_PickerView_DelegateRow:(NSInteger)row inComponent:(NSInteger)component;
//选中
-(void)My_PickerView_Delegate_QD;//确定



@end
//数据
@protocol My_PickerView_DataSource <NSObject>

//几列
-(NSInteger)My_PickerView_DataSource_Lie;
//每列几行行数
-(NSInteger)My_PickerView_DataSource_Hang:(NSInteger)component;
//没每行返回什么
- (NSString *)My_PickerView_DataSource_titleForRow:(NSInteger)row forComponent:(NSInteger)component;

@end


@interface My_PickerView : MyUIView

@property (nonatomic,assign)id<My_PickerView_DataSource>    dataSource;//数据
@property (nonatomic,assign)id<My_PickerView_Delegate>      delegate;//代理

@property (weak, nonatomic) IBOutlet UIButton *btn_QX;//取消

@property (weak, nonatomic) IBOutlet UIButton *btn_QD;//确定

@property (weak, nonatomic) IBOutlet UIPickerView *pickerV;//列表

@property (nonatomic,assign)CGFloat             Lie_H;//每行高度

-(void)UP_PickerView:(NSInteger)row;

@end
