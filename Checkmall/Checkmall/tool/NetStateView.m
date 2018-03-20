//
//  NetStateView.m
//  ArtToGo_Artist
//
//  Created by  on 2017/6/23.
//
//

#import "NetStateView.h"

@implementation NetStateView

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imgName tipMsg:(NSString *)msg reloadBtnHiden:(BOOL)isHidden{

    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor blueColor];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, -44, ScreenWidth, ScreenHeight)];
        backView.backgroundColor = [UIColor whiteColor];

        [self addSubview:backView];

        UIImageView *empty = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75,96)];
        empty.center = backView.center;
        [empty setImage:[UIImage imageNamed:imgName]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth - 160) / 2, empty.bottom, 160, 40)];
        label.text = msg;
        label.numberOfLines = 0;
       // label.textColor = ;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        if (!isHidden) {
            UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [actionBtn setFrame:CGRectMake(label.left, label.bottom+5, label.width, label.height)];
            //    actionBtn.backgroundColor = [UIColor redColor];
            actionBtn.layer.cornerRadius = 4;
//            actionBtn.layer.borderColor = MAIN_COLOR.CGColor;
            actionBtn.layer.borderWidth = 0.3;
            [actionBtn setTitle:@"重试" forState:UIControlStateNormal];
//            [actionBtn setTitleColor: forState:UIControlStateNormal];
            [actionBtn addTarget:nil action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [backView addSubview:actionBtn];
        }
        [backView addSubview:label];
        [backView addSubview:empty];
    }
    return self;
}

- (void)actionBtnAction:(id)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadNetwork:)]) {
        [self.delegate reloadNetwork:sender];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
