//
//  ShangPin_TuPian_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/10.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_TuPian_V.h"


@interface ShangPin_TuPian_V()<UIScrollViewDelegate>{
    
    UIView              *view_SPTP;//视频图片背景
    UIButton            *btn_SP;//视频
    UIButton            *btn_TP;//图片
    
    BOOL                bool_SPTP;//视频图片
    UILabel             *lbl_Index;//当前坐标
    UIImageView         *image_SP;//播放视频
}

@end

@implementation ShangPin_TuPian_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

#pragma mark- 初始化
- (void)init_UI{
    self.scrollV= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    // 8. pagingEnabled 按页滚动
    self.scrollV.pagingEnabled = YES;
    // 10. showsHorizontalScrollIndicator 是否显示水平滚动指示器
    self.scrollV.showsHorizontalScrollIndicator = YES;
    // 11. showsVerticalScrollIndicator 是否显示垂直滚动的指示器
    self.scrollV.showsVerticalScrollIndicator = YES;
       self.scrollV.delegate = self;
    [self addSubview:self.scrollV];
    self.scrollV.contentSize =CGSizeMake(self.scrollV.width * 9,0);
    
    view_SPTP = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth - 130) / 2, self.scrollV.height - 60, 130, 30)];
    [self addSubview:view_SPTP];
    
    btn_SP = [[UIButton alloc]initWithFrame:CGRectMake((view_SPTP.width - 47*2) / 3, 3, 47, 23)];
    [btn_SP setImage:[UIImage imageNamed:@"ShiPinNo"] forState:UIControlStateNormal];
    [btn_SP setImage:[UIImage imageNamed:@"ShiPinYes"] forState:UIControlStateSelected];
    btn_SP.tag = 1;
    [btn_SP addTarget:self action:@selector(btn_TP_Action:) forControlEvents:UIControlEventTouchUpInside];
    [view_SPTP addSubview:btn_SP];
    
    btn_TP = [[UIButton alloc]initWithFrame:CGRectMake(btn_SP.right + (view_SPTP.width - 47*2) / 3, btn_SP.top, btn_SP.width, btn_SP.height)];
    [btn_TP setImage:[UIImage imageNamed:@"TuPianNo"] forState:UIControlStateNormal];
    [btn_TP setImage:[UIImage imageNamed:@"TuPianYes"] forState:UIControlStateSelected];
    btn_TP.tag = 2;
    [btn_TP addTarget:self action:@selector(btn_TP_Action:) forControlEvents:UIControlEventTouchUpInside];
    [view_SPTP addSubview:btn_TP];
    
    
    lbl_Index = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth - 15 - 30, view_SPTP.top, 30, 23)];
    lbl_Index.layer.masksToBounds = YES;
    lbl_Index.layer.cornerRadius = lbl_Index.height / 2;
    lbl_Index.backgroundColor = UIColorFromHex(0xb2b2b2);
    lbl_Index.textColor = [UIColor whiteColor];
    lbl_Index.hidden = YES;
    lbl_Index.textAlignment = 1;
    lbl_Index.font = font12;
    [self addSubview:lbl_Index];
    
    [self if_SPTP];
//    [self init_Data];

}

-(void)setModel:(ShangPin_Model_RootClass *)model{
    _model = model;
    
    if ([model.data.video isEqualToString:@""]) {
        self.bool_SP = NO;
    }else{
        self.bool_SP = YES;
    }
    [self init_Data];
}
-(void)setModel_JL:(JLXQ_Model_RootClass *)model_JL{
    _model_JL = model_JL;
    if ([model_JL.data.video isEqualToString:@""]) {
        self.bool_SP = NO;
    }else{
        self.bool_SP = YES;
    }
    [self init_Data];
}

-(void)if_SP{
    if (self.bool_SP) {
        view_SPTP.hidden = YES;
    }
}

#pragma mark- 切换
-(void)btn_TP_Action:(UIButton*)btn{
    if (btn_SP == btn) {
        //视频
        bool_SPTP = 0;
        if (self.scrollV.contentOffset.x != 0) {
            [UIView animateWithDuration:.3 animations:^{
                self.scrollV.contentOffset = CGPointMake(0, 0);
            }];
        }
    }else{
        //图片
        bool_SPTP = 1;
        if (self.scrollV.contentOffset.x != self.scrollV.width) {
            [UIView animateWithDuration:.3 animations:^{
                self.scrollV.contentOffset = CGPointMake(self.scrollV.width, 0);
            }];
        }
    }
    [self if_SPTP];
    [self UP_lbl];
}

#pragma mark- 校验是图片或者是视频
- (void)if_SPTP{
    if (!bool_SPTP) {
        btn_SP.selected = YES;
        btn_TP.selected = NO;
       
    }else{
        btn_SP.selected = NO;
        btn_TP.selected = YES;
    }
}

#pragma mark- 校验第几个图片显示
- (void)UP_lbl{
    if (!self.bool_SP) {
        lbl_Index.hidden = NO;
        NSInteger iiii = self.scrollV.contentOffset.x / self.scrollV.width;

        if (self.model) {
            lbl_Index.text = [NSString stringWithFormat:@"%li/%li",iiii+1,self.model.data.slidsUrlList.count];
        }else{
            lbl_Index.text = [NSString stringWithFormat:@"%li/%li",iiii+1,self.model_JL.data.path.count];
        }
        lbl_Index.width = [MyHelper strWidth:lbl_Index.text andFont:lbl_Index.font andHeight:lbl_Index.height] + 15;
        lbl_Index.mj_x = ScreenWidth - 15 - lbl_Index.width;
    }else{
        NSInteger iiii = self.scrollV.contentOffset.x / self.scrollV.width;

        if (iiii == 0) {
            lbl_Index.hidden = YES;

        }else{
            lbl_Index.hidden = NO;

            if (self.model) {
                lbl_Index.text = [NSString stringWithFormat:@"%li/%li",iiii,self.model.data.slidsUrlList.count];

            }else{
                lbl_Index.text = [NSString stringWithFormat:@"%li/%li",iiii,self.model_JL.data.path.count];

            }
            lbl_Index.width = [MyHelper strWidth:lbl_Index.text andFont:lbl_Index.font andHeight:lbl_Index.height] + 15;
            lbl_Index.mj_x = ScreenWidth - 15 - lbl_Index.width;
        }
    }
}


-(void)init_Data{
    view_SPTP.hidden = YES;
    
    NSMutableArray *arr;
    if (self.model) {
        arr = [[NSMutableArray alloc]initWithArray:self.model.data.slidsUrlList];
    }else{
        arr = [[NSMutableArray alloc]initWithArray:self.model_JL.data.path];
    }
    if (self.bool_SP && arr.count >0) {
        [arr insertObject:arr[0] atIndex:0];
    }
    
    for (NSInteger i = 0; i < arr.count; i ++) {
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.scrollV.width, 0, self.scrollV.width, self.scrollV.height)];
        imageV.userInteractionEnabled = YES;

        if (self.model) {
            ShangPin_Model_SlidsUrlList *MMMM = arr[i];
            [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%.0f",MMMM.path,imageV.width*2]] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
        }else{
            [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%.0f",arr[i],imageV.width*2]] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];

        }

 
        
        if (i == 0 &&self.bool_SP) {
            UIImageView *image_BF = [[UIImageView alloc]initWithFrame:CGRectMake((imageV.width - 65) / 2, (imageV.height - 65) / 2, 65, 65)];
            image_BF.image = [UIImage imageNamed:@"ShiPinBoFang"];
            image_BF.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
            [image_BF addGestureRecognizer:singleTap];
            
            [imageV addSubview:image_BF];
            image_SP = imageV;
            view_SPTP.hidden = NO;
        }
        [self.scrollV addSubview:imageV];
        self.scrollV.contentSize = CGSizeMake(self.scrollV.width * arr.count, 0);
    }
    [self UP_lbl];
}

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    //播放视频
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShangPin_TuPian_V_Delegate_PF)]) {
        [self.delegate ShangPin_TuPian_V_Delegate_PF];
    }
}


// 滚动视图滚动, 就会执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}
// 已经结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger iiii = scrollView.contentOffset.x / scrollView.width;
    if (self.bool_SP) {
        if (iiii > 0) {
            //图片
            bool_SPTP = 1;
    
        }else{
            //视频
            bool_SPTP = 0;
        }
    }else{
        //图片
        bool_SPTP = 1;
    }
        [self if_SPTP];
    [self UP_lbl];
}



+ (CGFloat)get_H:(id)data{
    return 370;
}



-(void)dealloc{

}





@end
