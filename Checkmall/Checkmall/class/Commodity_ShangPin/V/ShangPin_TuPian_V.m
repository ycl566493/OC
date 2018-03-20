//
//  ShangPin_TuPian_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/10.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_TuPian_V.h"
#import "SBPlayer.h"


@interface ShangPin_TuPian_V()<UIScrollViewDelegate>{
    UIScrollView        *scrollV;//滑动背景
    
    UIView              *view_SPTP;//视频图片背景
    UIButton            *btn_SP;//视频
    UIButton            *btn_TP;//图片
    
    BOOL                bool_SPTP;//视频图片
    UILabel             *lbl_Index;//当前坐标
}

@property(nonatomic,strong)SBPlayer *player;
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
    scrollV= [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    // 8. pagingEnabled 按页滚动
    scrollV.pagingEnabled = YES;
    // 10. showsHorizontalScrollIndicator 是否显示水平滚动指示器
    scrollV.showsHorizontalScrollIndicator = YES;
    // 11. showsVerticalScrollIndicator 是否显示垂直滚动的指示器
    scrollV.showsVerticalScrollIndicator = YES;
       scrollV.delegate = self;
    [self addSubview:scrollV];
    scrollV.contentSize =CGSizeMake(scrollV.width * 9,0);
    
    view_SPTP = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth - 130) / 2, scrollV.height - 35, 130, 30)];
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
        if (scrollV.contentOffset.x != 0) {
            [UIView animateWithDuration:.3 animations:^{
                scrollV.contentOffset = CGPointMake(0, 0);
            }];
        }
    }else{
        //图片
        bool_SPTP = 1;
        if (scrollV.contentOffset.x != scrollV.width) {
            [UIView animateWithDuration:.3 animations:^{
                scrollV.contentOffset = CGPointMake(scrollV.width, 0);
            }];
        }
    }
    [self if_SPTP];
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


-(void)init_Data{
    for (NSInteger i = 0; i < 10; i ++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i*scrollV.width, 0, scrollV.width, scrollV.height)];
        imageV.userInteractionEnabled = YES;

        if (i % 2 == 0) {
            imageV.backgroundColor = [UIColor redColor];
        }else{
            imageV.backgroundColor = [UIColor yellowColor];
        }
        if (i == 0) {
            UIImageView *image_BF = [[UIImageView alloc]initWithFrame:CGRectMake((imageV.width - 65) / 2, (imageV.height - 65) / 2, 65, 65)];
            image_BF.image = [UIImage imageNamed:@"ShiPinBoFang"];
            image_BF.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
            [image_BF addGestureRecognizer:singleTap];
            
            [imageV addSubview:image_BF];
            


        }
        [scrollV addSubview:imageV];
    }
}

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    //播放视频
//    self.player.hidden = NO;
//    [imageV addSubview:self.player];
    //            self.player.hidden = YES;
}


-(SBPlayer *)player{
    if (!_player) {
        _player = [[SBPlayer alloc]initWithUrl:[NSURL URLWithString:@"http://download.3g.joy.cn/video/236/60236937/1451280942752_hd.mp4"]];
        //设置标题
        [_player setTitle:@"这是一个标题"];
        //设置播放器背景颜色
        _player.backgroundColor = [UIColor blackColor];
        //设置播放器填充模式 默认SBLayerVideoGravityResizeAspectFill，可以不添加此语句
        _player.mode = SBLayerVideoGravityResizeAspect;
        //添加播放器到视图
        //约束，也可以使用Frame
        //    [self.player mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.right.left.height.mas_equalTo(self);
        //        make.height.mas_equalTo(@250);
        //    }];
        _player.frame = self.bounds;
    }
    return _player;
}

// 滚动视图滚动, 就会执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}
// 已经结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger iiii = scrollView.contentOffset.x / scrollView.width;
//    if (self.bool_SP) {
        if (iiii > 0) {
            //图片
            bool_SPTP = 1;
            lbl_Index.hidden = NO;
            
            lbl_Index.text = [NSString stringWithFormat:@"%li/9",iiii];
            lbl_Index.width = [MyHelper strWidth:lbl_Index.text andFont:lbl_Index.font andHeight:lbl_Index.height] + 15;
            lbl_Index.mj_x = ScreenWidth - 15 - lbl_Index.width;
        }else{
            //视频
            bool_SPTP = 0;
            lbl_Index.hidden = YES;
        }
        [self if_SPTP];
//    }else{
    
//    }
}



+ (CGFloat)get_H:(id)data{
    return 370;
}



-(void)dealloc{
    [self.player pause];
    [self.player stop];
}





@end
