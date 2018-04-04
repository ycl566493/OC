//
//  web_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/4.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "web_VC.h"

@interface web_VC ()

@end

@implementation web_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:self.str_URL];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建
    [self.web_V loadRequest:request];//加载

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
