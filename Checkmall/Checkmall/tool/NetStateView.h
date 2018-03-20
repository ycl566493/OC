//
//  NetStateView.h
//  ArtToGo_Artist
//
//  Created by  on 2017/6/23.
//
//网络状态  网络不给力

#import <UIKit/UIKit.h>

@protocol NetStateViewDelegate <NSObject>

- (void)reloadNetwork:(id)sender;



@end
@interface NetStateView : UIView

@property (nonatomic, weak) id<NetStateViewDelegate>delegate;


/**  网络不给力点击重试
 *  imgName : 图片名字
 *  msg       提示文字
 *  ishiden  重试按钮是否显示
 **/
- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imgName tipMsg:(NSString *)msg reloadBtnHiden:(BOOL)isHidden;

/**
 *
 **/

@end
