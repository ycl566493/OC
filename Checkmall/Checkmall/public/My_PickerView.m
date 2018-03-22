//
//  My_PickerView.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "My_PickerView.h"



@interface My_PickerView()<UIPickerViewDelegate,UIPickerViewDataSource>{
    
}

@property (nonatomic,strong)    NSMutableArray  *arr_SJ;//每列数据s
@property (nonatomic,strong)    NSMutableArray  *arr_XZ;//每列选中



@end

@implementation My_PickerView

-(void)awakeFromNib{
    [super awakeFromNib];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self init_UI];
    
}

#pragma mark- 取消
- (IBAction)btn_YinChang:(id)sender {
    self.height = YES;
    [self removeFromSuperview];
}

#pragma mark- 确定
- (IBAction)btn_QD:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(My_PickerView_Delegate_QD)]) {
        [self.delegate My_PickerView_Delegate_QD];
    }
    
    self.height = YES;
    [self removeFromSuperview];
}

-(void)UP_PickerView:(NSInteger)row{
        [self.pickerV reloadAllComponents];
    if (row == 1) {
        [self.pickerV selectRow:0 inComponent:1 animated:NO];
        [self.pickerV selectRow:0 inComponent:2 animated:NO];
        
    }else if(row == 2){
        [self.pickerV selectRow:0 inComponent:2 animated:NO];
    }
}

-(void)init_UI{
    
    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    self.pickerV.backgroundColor = [UIColor whiteColor];
}

#pragma mark pickerview function
//返回有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(My_PickerView_DataSource_Lie)]) {
        return [self.dataSource My_PickerView_DataSource_Lie];
    }
    return 0;
}

//返回指定列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(My_PickerView_DataSource_Hang:)]) {
        return [self.dataSource My_PickerView_DataSource_Hang:component];
    }
    return 0;
}

//返回指定列，行的高度，就是自定义行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return self.Lie_H;
}

//返回指定列的宽度
//- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    return  self.pickerV.width / self.arr_Data.count;
//}

// 自定义指定列的每行的视图，即指定列的每行的视图行为一致
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

//    if (!view){
//
//        view = [[UIView alloc]init];
//
//    }
//
//    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.pickerV.frame.size.width/3, 20)];
//
//    text.textAlignment = NSTextAlignmentCenter;
//
//    NSArray *arr = self.arr_Data[component];
//    NSString *str = [arr objectAtIndex:row];
//    text.text = str;
//
//    [view addSubview:text];

    //隐藏上下直线

//    [self.pickerV.subviews objectAtIndex:1].backgroundColor = [UIColor clearColor];
//
//    [self.pickerV.subviews objectAtIndex:2].backgroundColor = [UIColor clearColor];

//    return view;
//
//}

//显示的标题

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(My_PickerView_DataSource_titleForRow:forComponent:)]) {
        return [self.dataSource My_PickerView_DataSource_titleForRow:row forComponent:component];
    }
    return @"";
    
}

//显示的标题字体、颜色等属性
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *str = @"";
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(My_PickerView_DataSource_titleForRow:forComponent:)]) {
        str = [self.dataSource My_PickerView_DataSource_titleForRow:row forComponent:component];
    }
    
    NSMutableAttributedString *AttributedString = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName:UIColorFromHex(0x666666)} range:NSMakeRange(0, [AttributedString  length])];
    return AttributedString;
}



//被选择的行

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.delegate && [self.delegate respondsToSelector:@selector(My_PickerView_DelegateRow:inComponent:)]) {
        [self.delegate My_PickerView_DelegateRow:row inComponent:component];
    }

}

@end
