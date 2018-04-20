//
//  ShangPin_XiaDan_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_XiaDan_Cell.h"

@interface ShangPin_XiaDan_Cell(){
    UIImageView         *imageV_TX;//头像
    UILabel             *lbl_Name;//姓名
    UILabel             *lbl_XDSJ;//下单时间
    UILabel             *lbl_XDSL;//下单数量
    UIView              *view_FGX;//分割线
}
@end

@implementation ShangPin_XiaDan_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    imageV_TX = [[UIImageView alloc]initWithFrame:CGRectMake(15, ([ShangPin_XiaDan_Cell get_H:nil] - 44) / 2, 44, 44)];
    imageV_TX.layer.masksToBounds = YES;
    imageV_TX.layer.cornerRadius = imageV_TX.width / 2;
    imageV_TX.layer.borderColor = UIColorFromHex(0xc5c5c5c).CGColor;
    imageV_TX.layer.borderWidth = .5;
//    imageV_TX.backgroundColor = [UIColor redColor];
    [self addSubview:imageV_TX];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TX.right + 10,  imageV_TX.top,200, imageV_TX.height  )];
    lbl_Name.font = font15;
    lbl_Name.text = @"";
    lbl_Name.textColor = UIColorFromHex(0x333333);
    [self addSubview:lbl_Name];
    
    lbl_XDSJ = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth - 15 - 200, imageV_TX.top+4, 200, 20)];
    lbl_XDSJ.font = font13;
    lbl_XDSJ.textAlignment = 2;
    lbl_XDSJ.text = @"2月14日";
    lbl_XDSJ.textColor = UIColorFromHex(0x333333);
    [self addSubview:lbl_XDSJ];
    
    lbl_XDSL = [[UILabel alloc]initWithFrame:CGRectMake(lbl_XDSJ.left, lbl_XDSJ.bottom, lbl_XDSJ.width, lbl_XDSJ.height)];
    lbl_XDSL.font = [UIFont systemFontOfSize:11];
    lbl_XDSL.textColor = UIColorFromHex(0x8c8c8c);
    lbl_XDSL.textAlignment = 2;
    [self addSubview:lbl_XDSL];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 62.5 , ScreenWidth, .5)];
    view_FGX.backgroundColor = UIColorFromHex(0xeeeeee);
    [self addSubview:view_FGX];
    
}

-(void)setModel_PT:(PTZFCG_Model_Group *)model_PT{
    _model_PT = model_PT;
    [imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model_PT.path view:imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    lbl_Name.text = model_PT.username;
    lbl_XDSJ.text = [NSString stringWithFormat:@"%@下单",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model_PT.created]]];

}

-(void)setModel:(ShangPin_Model_GroupUserInfo *)model{
    _model = model;
    [imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model.bulkImageUrl view:imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    lbl_Name.text = model.bulkNickname;
    lbl_XDSJ.text = [NSString stringWithFormat:@"%@下单",model.orderTime];

    
}

-(void)setModel_JL:(JLCG_Model_Group *)model_JL{
    _model_JL = model_JL;
    [imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model_JL.path view:imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    lbl_Name.text = model_JL.username;
    lbl_XDSJ.text = [NSString stringWithFormat:@"%@下单",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model_JL.created]]];
}

-(void)setModel_JLXQ:(JLXQ_Model_Buyuser *)model_JLXQ{
    _model_JLXQ = model_JLXQ;
    
    [imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model_JLXQ.headimgurl view:imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    lbl_Name.text = model_JLXQ.nickname;
    lbl_XDSJ.text = [NSString stringWithFormat:@"%@下单",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model_JLXQ.created]]];
}

-(void)setTag:(NSInteger)tag{
    lbl_XDSL.text = [NSString stringWithFormat:@"第%li位用户",tag +1];
}

+(CGFloat)get_H:(id)data{
    return 63;
}

@end
