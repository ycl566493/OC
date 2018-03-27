//
//  Image_Lunbo.m
//  轮播
//
//  Created by 信码互通 on 2016/10/14.
//  Copyright © 2016年 杨成龙. All rights reserved.
//

#import "Image_Lunbo.h"
#define view_kuan self.frame.size.width
#define view_gao self.frame.size.height
#define frame_1 CGRectMake(0, 0, view_kuan , view_gao)//位置一
#define frame_2 CGRectMake(view_kuan, 0, view_kuan, view_gao)//位置二
#define frame_3 CGRectMake(view_kuan * 2, 0, view_kuan, view_gao)//位置三

@interface Image_Lunbo ()<UIScrollViewDelegate>
{
    UIScrollView *scrollV;//轮播背景s
    UIImageView *imageV_1;//图片1
    UIImageView *imageV_2;//图片1
    UIImageView *imageV_3;//图片1
    NSInteger           int_DQ;//当前第几个图片
//    NSInteger           int_ZJ;//中间显示的第几个
    NSTimer         *myTimer ;
    UIPageControl* pageCtrl;//小白点
    
}
@property (nonatomic,assign) NSInteger          int_ZJ;

@end


@implementation Image_Lunbo

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)dealloc{
    [myTimer invalidate];
    myTimer = nil;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    _arr_data = nil;
}

#pragma mark 计时器事件
-(void)timerFired:(NSTimer*)T{
    [UIView animateWithDuration:.3 animations:^{
        scrollV.contentOffset = CGPointMake(view_kuan * 2, 0);
    } completion:^(BOOL finished) {
        //加一个
        [self if_Int_DQ:YES];
        if (self.arr_data.count == 2) {
            if (self.int_ZJ ==1) {
                imageV_1.frame = frame_3;
                imageV_2.frame = frame_2;
                self.int_ZJ = 2;
            }else{
                imageV_2.frame = frame_3;
                imageV_1.frame = frame_2;
                self.int_ZJ = 1;
            }
        }else{
            if (self.int_ZJ ==1) {
                imageV_1.frame = frame_1;
                imageV_2.frame = frame_2;
                imageV_3.frame = frame_3;
                self.int_ZJ = 2;
            }else if (self.int_ZJ == 2){
                imageV_2.frame = frame_1;
                imageV_3.frame = frame_2;
                imageV_1.frame = frame_3;
                self.int_ZJ = 3;
            }else{
                imageV_3.frame = frame_1;
                imageV_1.frame = frame_2;
                imageV_2.frame = frame_3;
                self.int_ZJ = 1;
            }
        }
    
        scrollV.contentOffset = CGPointMake(view_kuan, 0);
    }];
    
}

#pragma mark 小白点
- (void)xiaoBaiDian{
    
    pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((ScreenWidth-20*self.arr_data.count)/2, view_gao - 30, 20*self.arr_data.count, 10)];  //创建UIPageControl，位置在屏幕最下方。
    pageCtrl.numberOfPages = self.arr_data.count;//总的图片页数
    pageCtrl.currentPage = 0; //当前页
//    pageCtrl.backgroundColor = [UIColor blackColor];
    pageCtrl.alpha = 1;
    pageCtrl.layer.cornerRadius = 5;
    pageCtrl.userInteractionEnabled = YES;
    [self addSubview:pageCtrl];  //将UIPageControl添加到主界面上。
}


#pragma mark 赋值图片时执行
-(void)setArr_data:(NSArray *)arr_data{
    _arr_data = arr_data;
    if (scrollV !=nil) {
        [self Stop];
        //重构显示
        [self XS];
    }
    //初始化界面
    [self initUI];
    //启动计时器
    [self start];
    if (self.arr_data.count == 2) {
        imageV_3.hidden = YES;
    }
    
    //一张图没有小白点
    if (arr_data.count <= 1) {
        pageCtrl.hidden = YES;
    }else{
        pageCtrl.hidden = NO;
    }
}

#pragma mark 重构显示
- (void)XS{
    //移除原有图片
    for(UIView *myview in [self subviews]){

        if ([myview isKindOfClass:[UIButton class]]) {
            return;
        }
//        if ([myview isKindOfClass:[UIImageView class]]) {
            [myview removeFromSuperview];
//        }


    }
}

#pragma mark 点击事件
- (void)scrollV_Action{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(Image_Lunbo_delegate_Action:)]) {
        [self.delegate Image_Lunbo_delegate_Action:int_DQ - 1];
    }

}

#pragma mark  初始化视图
- (void)initUI{
    
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, view_kuan, view_gao)];
    scrollV.contentSize  = CGSizeMake(view_kuan * 3, 0);
    scrollV.delegate = self;
    // 是否分页
    scrollV.pagingEnabled = YES;
    scrollV.backgroundColor = [UIColor whiteColor];
    scrollV.showsVerticalScrollIndicator = FALSE;
    scrollV.showsHorizontalScrollIndicator = FALSE;
    scrollV.bounces = YES;
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollV_Action)];
    [scrollV addGestureRecognizer:singleTap1];
    [self addSubview:scrollV];
    
    imageV_1 = [[UIImageView alloc]initWithFrame:CGRectMake(view_kuan, 0, view_kuan, view_gao)];
//    imageV_1.backgroundColor = [UIColor redColor];
    imageV_1.userInteractionEnabled = YES;
    imageV_1.contentMode = UIViewContentModeScaleAspectFill;
    imageV_1.clipsToBounds = YES;
    [scrollV addSubview:imageV_1];
    
    imageV_2 = [[UIImageView alloc]initWithFrame:CGRectMake(view_kuan * 2, 0, view_kuan, view_gao)];
//    imageV_2.backgroundColor = [UIColor blueColor];
    imageV_2.userInteractionEnabled = YES;
    imageV_2.contentMode = UIViewContentModeScaleAspectFill;
    imageV_2.clipsToBounds = YES;
    [scrollV addSubview:imageV_2];
    
    imageV_3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view_kuan, view_gao)];
//    imageV_3.backgroundColor = [UIColor orangeColor];
    imageV_3.userInteractionEnabled = YES;
    imageV_3.contentMode = UIViewContentModeScaleAspectFill;
    imageV_3.clipsToBounds = YES;
    [scrollV addSubview:imageV_3];
    
    scrollV.contentOffset = CGPointMake(view_kuan, 0);
    
    //中间显示第几个图片
    int_DQ = 1;
    
    //中间显示第几个image
    self.int_ZJ = 1;
    
    [self xiaoBaiDian];
    
    //小于三个的情况
    if (self.arr_data.count == 1 ) {
        scrollV.contentSize = CGSizeMake(0, 0);
        scrollV.contentOffset = CGPointMake(0, 0);
    }else if(self.arr_data.count == 2 ){
    }


   
}

#pragma mark //开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    //停止计时器
    [self Stop];
}

#pragma mark 刷新数据
-(void)setInt_ZJ:(NSInteger)int_ZJ{
    _int_ZJ = int_ZJ;
    //左边图片
    NSInteger TP_L = int_DQ == 1 ? self.arr_data.count - 1 : int_DQ -2;
    //中间图片
    NSInteger TP_C = int_DQ -1;
    //右边图片
    NSInteger  TP_R =  int_DQ == self.arr_data.count ? 0 : int_DQ ;
    
    if (self.arr_data.count == 0) {
         [self imageV_JT:imageV_1 string_URL:self.arr_data[0]];
    }else if (self.arr_data.count == 2) {
         [self imageV_JT:imageV_1 string_URL:self.arr_data[0]];
        [self imageV_JT:imageV_2 string_URL:self.arr_data[1]];

    }else{
        if (self.int_ZJ == 1) {
//            imageV_1.image = [UIImage imageNamed:self.arr_data[TP_C]];
             [self imageV_JT:imageV_1 string_URL:self.arr_data[TP_C]];
             [self imageV_JT:imageV_2 string_URL:self.arr_data[TP_R]];
            [self imageV_JT:imageV_3 string_URL:self.arr_data[TP_L]];
        }else if (self.int_ZJ == 2){
            [self imageV_JT:imageV_1 string_URL:self.arr_data[TP_L]];
            [self imageV_JT:imageV_2 string_URL:self.arr_data[TP_C]];
            [self imageV_JT:imageV_3 string_URL:self.arr_data[TP_R]];
        }else{
             [self imageV_JT:imageV_1 string_URL:self.arr_data[TP_R]];
             [self imageV_JT:imageV_2 string_URL:self.arr_data[TP_L]];
            [self imageV_JT:imageV_3 string_URL:self.arr_data[TP_C]];
        }
    }
    //更新小白点
    [pageCtrl setCurrentPage:int_DQ - 1];
}

#pragma mark 赋值裁剪图片
- (void)imageV_JT:(UIImageView *)imageV string_URL:(NSString *)S_URL{

    [imageV sd_setImageWithURL:[MyHelper imaeg_URL:S_URL view:imageV] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
}

#pragma mark 判断是否超出界限
-(void)if_Int_DQ:(BOOL)JJ{
    //yes 为加1  no 为减1
    if (JJ) {
        //判断是否为最后一张图片
//        NSLog(@"加");
        if (int_DQ == self.arr_data.count) {
            int_DQ = 1;
        }else{
            int_DQ +=1;
        }
    }else{
        //判断是否为 第一张图片
//        NSLog(@"减");
        if (int_DQ == 1) {
            int_DQ = self.arr_data.count;
        }else{
            int_DQ -= 1;
        }
    }
}

#pragma mark //只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    if (self.arr_data.count == 1 ) {
        scrollV.contentSize = CGSizeMake(0, 0);
        scrollV.contentOffset = CGPointMake(0, 0);
        [self Stop];
    }else if(self.arr_data.count == 2 ){
        if (scrollV.contentOffset.x < view_kuan) {
            if (self.int_ZJ ==1) {
                imageV_2.frame = frame_1;
            }else{
                imageV_1.frame = frame_1;
            }
        }else if (scrollV.contentOffset.x >view_kuan){
            if (self.int_ZJ ==1) {
                imageV_2.frame = frame_3;
            }else{
                imageV_1.frame = frame_3;
            }
        }
    }
}

#pragma mark // scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //就一张图片
    if (self.arr_data.count == 1 ) {
        scrollV.contentSize = CGSizeMake(0, 0);
        scrollV.contentOffset = CGPointMake(0, 0);
        [self Stop];
        
        //两张图片
    }else if(self.arr_data.count == 2 ){
        
        if (scrollV.contentOffset.x == view_kuan){
        }else{
            //判断当前是那张图片
            if (self.int_ZJ ==1) {
                imageV_2.frame = frame_2;
                imageV_1.frame = frame_3;
                self.int_ZJ = 2;
                int_DQ = 2;
            }else{
                imageV_2.frame = frame_3;
                imageV_1.frame = frame_2;
                self.int_ZJ = 1;
                int_DQ =1;
            }
            scrollV.contentOffset = CGPointMake(view_kuan, 0);
        }

    }else{
        if (scrollV.contentOffset.x == 0) {
            //减一个
            [self if_Int_DQ:NO];
            if (self.int_ZJ ==1) {
                imageV_2.frame = frame_1;
                imageV_3.frame = frame_2;
                imageV_1.frame = frame_3;
                self.int_ZJ = 3;
            }else if (self.int_ZJ == 2){
                imageV_3.frame = frame_1;
                imageV_1.frame = frame_2;
                imageV_2.frame = frame_3;
                self.int_ZJ = 1;
            }else{
                imageV_1.frame = frame_1;
                imageV_2.frame = frame_2;
                imageV_3.frame = frame_3;
                self.int_ZJ = 2;
            }
        }else if (scrollV.contentOffset.x == view_kuan){
            //不变
        }else{
            //加一个
            [self if_Int_DQ:YES];
            if (self.int_ZJ ==1) {
                imageV_1.frame = frame_1;
                imageV_2.frame = frame_2;
                imageV_3.frame = frame_3;
                self.int_ZJ = 2;
            }else if (self.int_ZJ == 2){
                imageV_2.frame = frame_1;
                imageV_3.frame = frame_2;
                imageV_1.frame = frame_3;
                self.int_ZJ = 3;
            }else{
                imageV_3.frame = frame_1;
                imageV_1.frame = frame_2;
                imageV_2.frame = frame_3;
                self.int_ZJ = 1;
            }
        }
        
        scrollV.contentOffset = CGPointMake(view_kuan, 0);
        
        //计时器开始
        [self start];

    }
}

#pragma mark //计时器终止
-(void)Stop{
    [myTimer invalidate];//关闭计时器
    myTimer = nil;//释放资源
}

#pragma mark //计时器开始
-(void)start{
    if (myTimer == nil && self.arr_data.count != 1) {
        if (self.arr_data.count == 0) {
            return;
        }
        myTimer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:myTimer forMode:NSDefaultRunLoopMode];
    }
}



- (void)initSearchView{


}



@end
