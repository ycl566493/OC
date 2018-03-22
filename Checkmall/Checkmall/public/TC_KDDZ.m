//
//  TC_KDDZ.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_KDDZ.h"
#import "My_PickerView.h"//地区

@interface TC_KDDZ()<My_PickerView_Delegate,My_PickerView_DataSource>{
    NSMutableArray*arr_1;
    NSMutableArray*arr_2;
    NSMutableArray*arr_3;
    NSArray     *arr_data;
    NSInteger       int_1;
    NSInteger       int_2;
    NSInteger       int_3;
    
    NSString        *str_Sheng;//省市区名称
    NSString        *str_Shi;
    NSString        *str_Qu;
    
    NSInteger        int_Sheng;//省市区名称
    NSInteger        int_Shi;
    NSInteger        int_Qu;

}

@property(nonatomic,weak)My_PickerView *pickerV;

@end

@implementation TC_KDDZ

- (void)layoutSubviews {
    [super layoutSubviews];
    [self init_UI];
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    str_Sheng = @"";//省市区名称
    str_Shi = @"";
    str_Qu = @"";
}

-(void)init_UI{
    
}
#pragma mark- 提交按钮
- (IBAction)btn_TJ_Action:(id)sender {
    NSLog(@"提交");
    if (![MyHelper isPhone:self.txtF_SJH.text]){
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else if(self.txtF_XM.text.length == 0){
        [MyHelper showMessage:@"请输入收货姓名！"];
    }else if([str_Sheng isEqualToString:@""]){
        [MyHelper showMessage:@"请选着地区！"];
    }else if([self.txtV_DZ.text isEqualToString:@""]){
        [MyHelper showMessage:@"请输入详细地址！"];
    }else{
        NSDictionary *dic = @{
                              @"username":self.txtF_XM.text,//姓名
                              @"phone":self.txtF_SJH.text,//手机号
                              @"addr":self.txtV_DZ.text,//详细地址
                              @"merchanid":@"0",//门店id
                              @"provincecode":[NSString stringWithFormat:@"%li",int_Sheng],//省id
                              @"citycode":[NSString stringWithFormat:@"%li",int_Shi],//市id
                              @"countycode":[NSString stringWithFormat:@"%li",int_Qu],//geo_code唯一码
                              @"province":str_Sheng,//省的名称
                              @"city":str_Shi,//市的名称
                              @"county":str_Qu,//区的名称
                              @"token":[kUserDefaults objectForKey:MYtoken]//用户token
                              };
        [NetRequest postWithUrl:address_addAdderssByNameId params:dic showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
            
            NSLog(@"添加 == %@",dict);
            
        } fail:^(id error) {
            
        }];
    }
}


#pragma mark- 确认地址
-(void)My_PickerView_Delegate_QD{
    NSDictionary *dic = arr_1[int_1];
    str_Sheng = dic[@"name"];
    int_Sheng = [dic[@"code"] integerValue];
    
    dic = arr_2[int_2];
    str_Shi = dic[@"name"];
    int_Shi = [dic[@"code"] integerValue];
    
    dic = arr_3[int_3];
    str_Qu = dic[@"name"];
    int_Qu = [dic[@"code"] integerValue];

    self.lbl_SSQ.text= [NSString stringWithFormat:@"%@ %@ %@",str_Sheng,str_Shi,str_Qu];
}

- (IBAction)DQ_Action:(id)sender {
    NSLog(@"地区点击");
    
    int_1 = 0;
    int_2 = 0;
    int_3 = 0;
    
    //1 获得json文件的全路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area.json" ofType:nil];
    //2 加载json文件到data中
    NSData *data = [NSData dataWithContentsOfFile:path];
    //3 解析json数据//json数据中的[] 对应OC中的NSArray//json数据中的{} 对应OC中的
    arr_data =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    arr_1 = [[NSMutableArray alloc]init];
    arr_2 = [[NSMutableArray alloc]init];
    arr_3 = [[NSMutableArray alloc]init];
    for (NSDictionary*dic in arr_data) {
        if ([dic[@"level"] integerValue] == 1) {
            [arr_1 addObject:dic];
        }
        if ([dic[@"level"] integerValue] == 2 ) {
            [arr_2 addObject:dic];
        }
        if ([dic[@"level"] integerValue] == 3) {
            [arr_3 addObject:dic];
        }
    }
    [self UP_data:1];
    [self.pickerV UP_PickerView:0];
}

-(void)UP_data:(NSInteger)component{
   
    if (component == 1) {
        [arr_2 removeAllObjects];
        //市
        NSDictionary *dic1 = arr_1[int_1];
        NSString*str_Sheng_id = dic1[@"sheng"];
        for (NSDictionary*dictionart in arr_data) {
            if ([dictionart[@"level"] integerValue] == 2 && [dictionart[@"sheng"]integerValue]  == [str_Sheng_id integerValue]) {
                [arr_2 addObject:dictionart];
            }
        }
        
    }

    //区
    [arr_3 removeAllObjects];
    NSDictionary *dic = arr_2[int_2];
    NSString*str_Qu_id = dic[@"di"];
    NSString*str_Sheng_id = dic[@"sheng"];

    for (NSDictionary*dictionart in arr_data) {
        if ([dictionart[@"level"] integerValue] == 3 && [dictionart[@"di"] isEqualToString:str_Qu_id] && [dictionart[@"sheng"]integerValue]  == [str_Sheng_id integerValue]) {
            [arr_3 addObject:dictionart];
        }
    }
    
}

#pragma mark- 滚动列表
-(My_PickerView *)pickerV{
    if (!_pickerV) {
        My_PickerView *picker = [My_PickerView init_Xib];
        _pickerV = picker;
        _pickerV.Lie_H = 46;
        _pickerV.frame = self.bounds;
        _pickerV.dataSource = self;
        _pickerV.delegate = self;
        [self addSubview:_pickerV];
    }
    return _pickerV;
}
-(void)My_PickerView_DelegateRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        int_1 = row;
//        [self UP_data:1];
        int_2 =  0;
        int_3 =  0;
        [self.pickerV UP_PickerView:1];
//        [self.pickerV UP_PickerView:2];

    }
    if (component == 1) {
        int_2 = row;
        int_3 =  0;
//        [self UP_data:2];
        [self.pickerV UP_PickerView:2];
    }
    if (component == 2) {
        int_3 = row;
    }
    NSLog(@"点击 ==  %li == %li  == %li",int_1,int_2,int_3);

}
-(NSInteger)My_PickerView_DataSource_Lie{
    return 3;
}
-(NSInteger)My_PickerView_DataSource_Hang:(NSInteger)component{
    
    if (component == 0) {

        return arr_1.count;
    }
    if (component == 1) {
        [self UP_data:1];

        return arr_2.count;
    }
    if (component == 2) {
        [self UP_data:2];

        return arr_3.count;
    }
    return 0;
}
-(NSString *)My_PickerView_DataSource_titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        NSDictionary *dic_Data =arr_1[row];
        return dic_Data[@"name"];
    }
    if (component == 1) {
        NSDictionary *dic_Data =arr_2[row];
        return dic_Data[@"name"];    }
    if (component == 2) {
        NSDictionary *dic_Data =arr_3[row];
        return dic_Data[@"name"];
    }
    return @"";
}


#pragma mark- 关闭
- (IBAction)btn_GB:(UIButton *)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
