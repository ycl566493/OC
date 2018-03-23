//
//  TC_TJDZ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_TJDZ_V.h"
#import "My_PickerView.h"//地区
#import "DiQu_Model_RootClass.h"//地区列表
#import "MenDian_Model_RootClass.h"//门店

@interface TC_TJDZ_V()<My_PickerView_Delegate,My_PickerView_DataSource>{
    DiQu_Model_RootClass *model_DQ;//地区modle
    NSInteger           int_slect;//地区
    NSInteger            str_DQ_ID;//地区id
    NSInteger            str_MD_ID;//门店id
    NSString            *str_Q;//区的名称

    MenDian_Model_RootClass     *model_MD;//门店model
    BOOL                    bool_DQ;//是否是地区
    
}

@property(nonatomic,weak)My_PickerView *pickerV;

@end

@implementation TC_TJDZ_V

- (void)layoutSubviews {
    [super layoutSubviews];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];

}
-(void)init_UI{
    str_Q = @"";
    str_DQ_ID = 0;
    str_MD_ID = 0;
    self.lbl_MDDZ.text = @" ";
    self.view_H.constant = self.btn_BC.bottom +15;
    
    [self init_data_DQ];
}
#pragma mark- 获取门店地址
- (void)init_data_MD:(NSInteger)code_id{
    [NetRequest postWithUrl:address_getStoreInfo params:@{@"code":[NSString stringWithFormat:@"%li",(long)code_id]} showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
        NSLog(@"获取门店 = = %@",dict);
        model_MD  = [[MenDian_Model_RootClass alloc]initWithDictionary:dict];
        if (model_MD.code == 1) {
            if (self.model) {
                for (NSInteger i = 0; i< model_MD.data.count; i ++) {
                    MenDian_Model_Data *MMMM  = model_MD.data[i];
                    
                    if (MMMM.idField == self.model.merchantId ) {
                        
                        self.lbl_MD.text = MMMM.name;
                        self.lbl_MDDZ.text = MMMM.address;
                        str_MD_ID = MMMM.idField;
                        [self layoutIfNeeded];
                        self.view_H.constant = self.btn_BC.bottom +15;
                    }
                }
            }
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 提交
- (IBAction)btn_BC_Action:(id)sender {
    NSLog(@"提交");
    if (![MyHelper isPhone:self.txtF_SJH.text]){
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else if(self.txtF_XM.text.length == 0){
        [MyHelper showMessage:@"请输入收货姓名！"];
    }else if(!str_DQ_ID){
        [MyHelper showMessage:@"请选着地区！"];
    }else if(!str_MD_ID){
        [MyHelper showMessage:@"请选着门店！"];
    }else{
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                    @"username":self.txtF_XM.text,//姓名
                                                                                    @"phone":self.txtF_SJH.text,//手机号
                                                                                    @"addr":self.lbl_MDDZ.text,//详细地址
                                                                                    @"merchanid":[NSString stringWithFormat:@"%li",(long)str_MD_ID],//门店id
                                                                                    @"provincecode":@"110000",//省id
                                                                                    @"citycode":@"110100",//市id
                                                                                    @"countycode":[NSString stringWithFormat:@"%li",(long)str_DQ_ID],//geo_code唯一码
                                                                                    @"province":@"北京市",//省的名称
                                                                                    @"city":@"市辖区",//市的名称
                                                                                    @"county":str_Q,//区的名称
                                                                                    @"token":[kUserDefaults objectForKey:MYtoken]//用户token
                                                                                    }];
        
        if (self.model) {
            [dic setObject:[NSString stringWithFormat:@"%li",self.model.idField] forKey:@"id"];
        }
        [NetRequest postWithUrl:address_addAdderssByNameId params:dic showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
            
            NSLog(@"添加 == %@",dict);
            if ([dict[@"code"] integerValue] == 1) {
                if (self.delegate && [self.delegate respondsToSelector:@selector(TC_TJDZ_V_Delegate_CG)]) {
                    [self.delegate TC_TJDZ_V_Delegate_CG];
        
                }
                self.hidden = YES;
                [self removeFromSuperview];
            }
            
        } fail:^(id error) {
            
        }];
    }
}

#pragma mark- 编辑
-(void)setModel:(DiZhiLieBiao_Model_Data *)model{
    _model = model;
    self.txtF_XM.text = model.username;
    self.txtF_SJH.text = model.phone;
    [self init_data_DQ];
//    self init_data_MD:<#(NSInteger)#>
}


#pragma mark- 获取地区
- (void)init_data_DQ{
    [NetRequest postWithUrl:address_getArea params:@{} showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
        NSLog(@"获取地区");
        model_DQ = [[DiQu_Model_RootClass alloc]initWithDictionary:dict];
        if (model_DQ.code == 1) {
            if (self.model) {
                for (NSInteger i = 0; i< model_DQ.data.count; i ++) {
                    DiQu_Model_Data *MMMM  = model_DQ.data[i];
                    
                    if (MMMM.geoId == [self.model.geoCode integerValue]) {
                        self.lbl_DZ.text = [NSString stringWithFormat:@"北京市 市辖区 %@",MMMM.geoName];
                        str_Q = MMMM.geoName;
                        str_DQ_ID = MMMM.geoId;
                        [self init_data_MD:str_DQ_ID];
                    }
                }
            }
        }
    
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 门店点击
- (IBAction)MD_Action:(id)sender {
    [self.txtF_XM resignFirstResponder];
    [self.txtF_SJH resignFirstResponder];
    
    NSLog(@"门店点击");
    if (!str_DQ_ID) {
        [MyHelper showMessage:@"请先选着地区"];
    }else{
        bool_DQ = NO;
        int_slect= 0;
        [self.pickerV UP_PickerView:0];
    }

}
#pragma mark- 地区点击
- (IBAction)btn_DQ:(id)sender {
    [self.txtF_XM resignFirstResponder];
    [self.txtF_SJH resignFirstResponder];
    
    NSLog(@"地区点击");
    bool_DQ = YES;
    int_slect= 0;
    [self.pickerV UP_PickerView:0];
    
}

#pragma mark- 地区选中
-(void)My_PickerView_Delegate_QD{
    if (bool_DQ) {
        DiQu_Model_Data *model = model_DQ.data[int_slect];
        self.lbl_DZ.text = [NSString stringWithFormat:@"北京市 市辖区 %@",model.geoName];
        str_Q = model.geoName;
        str_DQ_ID = model.geoId;
        [self init_data_MD:str_DQ_ID];
        
        str_MD_ID = 0;
        self.lbl_MD.text = @"";
        self.lbl_MDDZ.text = @"";
    }else{
        MenDian_Model_Data *model = model_MD.data[int_slect];
        self.lbl_MD.text = model.name;
        self.lbl_MDDZ.text = model.address;
        str_MD_ID = model.idField;
        [self layoutIfNeeded];
        self.view_H.constant = self.btn_BC.bottom +15;

    }
}

-(My_PickerView *)pickerV{
    if (!_pickerV) {
        My_PickerView *picker = [My_PickerView init_Xib];
        _pickerV = picker;
        _pickerV.Lie_H = 46;
        _pickerV.frame = self.bounds;
        _pickerV.delegate = self;
        _pickerV.dataSource = self;
        [self addSubview:_pickerV];
    }
    return _pickerV;
}

-(void)My_PickerView_DelegateRow:(NSInteger)row inComponent:(NSInteger)component{
    if (bool_DQ) {
        if (component == 2) {
            int_slect = row;
        }
    }else{
        int_slect = row;
    }
  
    NSLog(@"点击 ==  %li",(long)int_slect);
}
-(NSInteger)My_PickerView_DataSource_Lie{
    if (bool_DQ) {
        return 3;
    }else{
        return 1;
    }
}
-(NSInteger)My_PickerView_DataSource_Hang:(NSInteger)component{
    if (bool_DQ) {
        if (component == 2) {
            return model_DQ.data.count;
        }
        return 1;
    }else{
        return model_MD.data.count;
    }

}
-(NSString *)My_PickerView_DataSource_titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (bool_DQ) {
        if (component == 0) {
            return @"北京市";
        }
        if (component == 1) {
            return @"市辖区";
        }
        if (component == 2) {
            DiQu_Model_Data *model = model_DQ.data[row];
            return model.geoName;
        }
    }else{
        MenDian_Model_Data *model = model_MD.data[row];
        return model.name;
    }

    return @"";
}


#pragma mark- 关闭
- (IBAction)btn_GB:(UIButton *)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
