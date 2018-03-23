//
//  FenLei_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "FenLei_Cell.h"

@interface FenLei_Cell(){
    UIView      *view_FGX;//分割线
    UILabel     *lbl_Title;//标题
    UIView      *View_XZ;//选中
}
@end

@implementation FenLei_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    
    self.backgroundColor = [UIColor clearColor];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 90, .5)];
    view_FGX.backgroundColor = RGBA(214, 214, 214, 1);
    [self addSubview:view_FGX];
    
    lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 40)];
    lbl_Title.font = font14;
    lbl_Title.textColor = UIColorFromHex(0x333333);
    lbl_Title.text = @"";
    lbl_Title.textAlignment = 1;
    [self addSubview:lbl_Title];
    
    View_XZ = [[UIView alloc]initWithFrame:CGRectMake(0, 12, 2.5, self.height - 12 *  2)];
    View_XZ.backgroundColor = RGBA(74, 168, 60, 1);
    [self addSubview:View_XZ];
}

-(void)setModel:(FenLeiLieBiao_Model_Data *)model{
    lbl_Title.text = model.name;
}

-(void)iF_Select:(BOOL)select{
    if (select) {
        self.backgroundColor = [UIColor whiteColor];
        View_XZ.hidden = NO;
    }else{
        self.backgroundColor = [UIColor clearColor];
        View_XZ.hidden = YES;
    }
}

+ (CGFloat)get_H:(id)data{
    return 40.5;
}

@end
