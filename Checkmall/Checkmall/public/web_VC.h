//
//  web_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/4.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "BaseViewController.h"

@interface web_VC : BaseViewController

@property (weak, nonatomic) IBOutlet UIWebView *web_V;

@property (nonatomic, strong)NSString   *str_URL;

@end
