//
//  LYWPickerView.m
//  同文同书
//
//  Created by 信码互通 on 2017/6/28.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "LYWPickerView.h"

/*** 屏幕宽 ***/
#define kS_creenWidth ([UIScreen mainScreen].bounds.size.width)
/*** 屏幕高 ***/
#define kS_creenHeight ([UIScreen mainScreen].bounds.size.height) - 64

// 超级紫色
#define PURPLECOLOR [UIColor colorWithRed:155 / 255.0 green:132 / 255.0 blue:188 / 255.0 alpha:1]
#define GREENCOLOR [UIColor colorWithRed:94 / 255.0 green:224 / 255.0 blue:180 / 255.0 alpha:1]

#define BlueColor [UIColor colorWithRed:20/255.0 green:124/255.0 blue:235/255.0 alpha:1]


@interface LYWPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong)UIView *pickerView;
@property (nonatomic, strong)UIView *back;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *str;
@property (nonatomic, assign)NSInteger IdNum;

@end

@implementation LYWPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.tag = 0;
        [self creatCaverView];
        [self creatAnimation];
        
    }
    return self;
}


- (void)creatAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        _back.alpha = 0.3;
        _picker.frame = CGRectMake(0, kS_creenHeight - kS_creenWidth / 2., kS_creenWidth, kS_creenWidth / 2.);
        _pickerView.frame = CGRectMake(0, kS_creenHeight - kS_creenWidth / 2. - 30, kS_creenHeight, 30);
    }];
}


//添加遮盖层
- (void)creatCaverView
{
    //添加一个遮盖UIView
    _back = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _back.backgroundColor = [UIColor blackColor];
    _back.alpha = 0;
    [self addSubview:_back];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPicker)];
    tap.numberOfTapsRequired = 1;
    [_back addGestureRecognizer:tap];
    [self creatPickView];
}

//picker上面的取消和确定按钮
- (void)creatPickView
{
    _pickerView = [[UIView alloc] initWithFrame:CGRectMake(0, kS_creenHeight, kS_creenWidth, 30)];
    _pickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_pickerView];
    UIView *headLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kS_creenWidth, 1)];
    headLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:headLine];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(10, 10, 80, 20);
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    leftButton.titleLabel.font = font1;
    [_pickerView addSubview:leftButton];
    [leftButton addTarget:self action:@selector(cancelPicker) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(kS_creenWidth - 30 - 60, 10, 80, 20);
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [rightButton setTitleColor:BlueColor forState:UIControlStateNormal];
    rightButton.titleLabel.font = font1;
    [_pickerView addSubview:rightButton];
    [rightButton addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    
    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kS_creenHeight + 30, kS_creenWidth, kS_creenWidth / 2.0)];
    _picker.delegate = self;
    _picker.dataSource = self;
    _picker.backgroundColor = [UIColor whiteColor];
    CALayer *layer_DJ2 = [CALayer layer];
    layer_DJ2.frame = CGRectMake(0, 10, _picker.width,.5);
    layer_DJ2.backgroundColor = [UIColor lightGrayColor].CGColor;
    [_picker.layer addSublayer:layer_DJ2];

    [self addSubview:_picker];
}

// picker确定按钮点击事件
- (void)confirm
{
    if (!_str) {
        _str = self.NumberArr[0];
        if([_delegate respondsToSelector:@selector(pickViewSureBtnClick:)])
            [_delegate pickViewSureBtnClick:_str];
        if([_delegate respondsToSelector:@selector(pickViewSureBtnClick: tag:)])
            [_delegate pickViewSureBtnClick:_str tag:self.tag];
    }
    else
    {
        if([_delegate respondsToSelector:@selector(pickViewSureBtnClick:)])
            [_delegate pickViewSureBtnClick:_str];
        if([_delegate respondsToSelector:@selector(pickViewSureBtnClick: tag:)])
            [_delegate pickViewSureBtnClick:_str tag:self.tag];
    }
    
    [self cancelPicker];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}

// 弹回picker
- (void)cancelPicker
{
    [UIView animateWithDuration:0.25 animations:^{
        _back.alpha = 0;
        _picker.frame = CGRectMake(0, kS_creenHeight + 30, kS_creenWidth, kS_creenWidth / 2.);
        _pickerView.frame = CGRectMake(0, kS_creenHeight, kS_creenWidth, 30);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.NumberArr.count;
}


#pragma mark - UIPickerViewDelegate
// 告诉系统每一行显示什么内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%@",self.NumberArr[row]];
}

// 监听pickerView的选中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.tag= row;
    _str = [self.NumberArr objectAtIndex:row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:font1];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


@end
