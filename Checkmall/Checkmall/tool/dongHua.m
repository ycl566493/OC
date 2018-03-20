//
//  dongHua.m
//  动画
//
//  Created by 信码互通 on 16/3/3.
//  Copyright © 2016年 信码互通. All rights reserved.
//

#import "dongHua.h"

static dongHua *dH = nil;

@interface dongHua ()
{
    bool            jiaZaiGuo;
    UIView          *view_F;
}

@end

@implementation dongHua

+ (instancetype)addDongHua{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dH = [[dongHua alloc]init];
    });
//    [dH addImage];
    return dH;
}

-(void)btn_Action{
    NSLog(@"self点击");
}

-(void)addImage{
    UIView *view_BJ = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth - 100)/2, (ScreenHeight - 100 - 64) / 2 , 100, 100)];
    view_BJ.backgroundColor = RGBA(255, 255, 255, 1);
    view_BJ.layer.masksToBounds = YES;
    view_BJ.layer.cornerRadius = 5;
    view_BJ.layer.borderColor = RGBA(155, 155, 155, .3).CGColor;
    view_BJ.layer.borderWidth = .5;
    [dH addSubview:view_BJ];
    
   UIImageView  *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 70)/2, (ScreenHeight - 60 - 64) / 2 , 70, 60)];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [dH addSubview:imageView];

    NSString *str_imageName;

//    //创建CAKeyframeAnimation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    animation.duration = imageView.animationDuration;
    animation.delegate = self;
    return;
//
//    //存放图片的数组
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 1;i < 16 ;i++) {
        if (i>9) {
            //动画的图片名称
            str_imageName =[NSString stringWithFormat:@"jiaz00%i",i];
        }else{
            str_imageName =[NSString stringWithFormat:@"jiaz000%i",i];
        }
        UIImage *image = [UIImage imageNamed:str_imageName];
//        [arr addObject:image];
        
        
//        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:"image_%d.png",i]];
        CGImageRef cgimg = image.CGImage;
        [array addObject:(__bridge UIImage *)cgimg];
    }
    
    animation.values = array;
    animation.duration = 1.5;
    animation.repeatCount = 1000;
//
    [imageView.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
    //结束事件
    [self yinChang];
}

- (void)xianShi:(UIView*)view{
    if (jiaZaiGuo == NO) {
        NSLog(@"%@",dH);
        dH.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//        dH.backgroundColor = RGBA(0, 0, 0, .7);

//        [view addSubview:dH];
        [self addImage];
        jiaZaiGuo = YES;
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:dH];
    }

}
- (void)yinChang{
    
    [dH removeFromSuperview];
    jiaZaiGuo = NO;
}

-(void)initWithFrameS:(CGRect)frame{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
