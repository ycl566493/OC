//
//  DuiHuanShangPin_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DuiHuanShangPin_VC.h"
#import "DiZhiXinXi_V.h"
#import "DiQuMenDian_VC.h"

@interface DuiHuanShangPin_VC ()<DiZhiXinXi_V_Delegate>{
    
}

@property (nonatomic,weak)DiZhiXinXi_V   *DZ;//地址信息


@end

@implementation DuiHuanShangPin_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"兑换商品";

    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self init_UI];
}

- (void)init_UI{
    
    NSString *str_DZ = @"";
    self.DZ.height = [DiZhiXinXi_V FS:YES str_NR:str_DZ];
    self.DZ.bool_SC =YES;
    self.DZ.str_DZ = str_DZ;
    self.DZ.bool_FS = YES;
    [self.scrollV addSubview:self.DZ];
}

- (IBAction)LJDH_Action:(id)sender {
    
}

-(void)DiZhiXinXi_V_Delegate_Action{
    DiQuMenDian_VC  *vc = [[DiQuMenDian_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(DiZhiXinXi_V *)DZ{
    if (!_DZ) {
        DiZhiXinXi_V *DZ = [DiZhiXinXi_V init_Xib];
        _DZ = DZ;
        _DZ.frame = CGRectMake(0, 0, ScreenWidth, 80);
        _DZ.delegate = self;
    }
    return _DZ;
}

@end
