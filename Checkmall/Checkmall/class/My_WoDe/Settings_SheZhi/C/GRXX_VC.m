//
//  GRXX_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "GRXX_VC.h"
#import "SheZhi_Cell.h"
#import <AVFoundation/AVFoundation.h>//相机的库
#import "WenBenShuRu_VC.h"


#define AUTHORIZATION_MSG_PHOTO @"请在iPhone的“设置-隐私-相册”中允许访问相册。" //访问权限提示


@interface GRXX_VC ()<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,WenBenShuRu_VC_delegate>{
    NSData *H_Data;//数据流
}

@end

@implementation GRXX_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人资料";
    [self init_UI];


}
-(void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    self.tableV.backgroundColor = UIColorFromHex(0xeeeeee);
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"SheZhi_Cell" bundle:nil] forCellReuseIdentifier:@"SheZhi_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}


#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 85;
    }
    return [SheZhi_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SheZhi_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"SheZhi_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SheZhi_Cell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            [cell SetTitle:@"头像" NR:@"" ImageV:NO];
            cell.imageVT.layer.masksToBounds = YES;
            cell.imageVT.layer.cornerRadius = cell.imageVT.height / 2;
            cell.imageV_W.constant = cell.imageVT.height;
            [cell.imageVT sd_setImageWithURL:[MyHelper imaeg_URL:[kUserDefaults objectForKey:TouXiang] view:cell.imageVT] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
        }else if (indexPath.row == 1){
            [cell SetTitle:@"手机号" NR:[kUserDefaults objectForKey:YongHuMing] ImageV:YES];
        }else if (indexPath.row == 2){
            [cell SetTitle:@"昵称" NR:[kUserDefaults objectForKey:NiCheng] ImageV:YES];
        }else if (indexPath.row == 3){
            [cell SetTitle:@"性别" NR:[kUserDefaults objectForKey:XingBie] ImageV:YES];
        }
  
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self JYXJ];
    }else if(indexPath.row == 2){
//        [self NC];
        WenBenShuRu_VC *vc = [[WenBenShuRu_VC alloc]init];
        vc.title = @"昵称";
        vc.delegate = self;

        [self.navigationController pushViewController:vc animated:YES];

        vc.str_title = @"请输入昵称";
        vc.str_NR = [kUserDefaults objectForKey:NiCheng];
    }else if (indexPath.row == 3){
       
    }
}

- (void)WenBenShuRu_VC_delegate_XX:(NSString *)xx tag:(NSInteger)tag{

    [NetRequest postWithUrl:User_updateNickname params:@{@"nickname":xx,@"token":[MyHelper toToken]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"昵称 == %@",dict);
    } fail:^(id error) {
        
    }];
}

#pragma mark  校验相机
- (void)JYXJ{
    NSLog(@"扫码");
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:AUTHORIZATION_MSG_PHOTO preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * action) {
                                                       }];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        
        // 1、 获取摄像设备
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if (device) {
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (status == AVAuthorizationStatusNotDetermined) {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                    } else {
                    }
                }];
            } else if (status == AVAuthorizationStatusAuthorized) {
                // 用户允许当前应用访问相机
                
                [self callActionSheetFunc];
                
            } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                
            } else if (status == AVAuthorizationStatusRestricted) {
                NSLog(@"因为系统原因, 无法访问相册");
            }
        } else {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
        }
    }
    
}

#pragma mark  选择图片选择方式
- (void)callActionSheetFunc{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择图像" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        //来源:相册
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }]];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮的响应事件；
            //来源:相机
            NSUInteger sourceType = UIImagePickerControllerSourceTypeCamera;
            // 跳转到相机或相册页面
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = sourceType;
            
            [self presentViewController:imagePickerController animated:YES completion:^{
                
            }];
        }]];
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    
}

#pragma mark- 收回相机
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark 相机相册回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (image) {
        NSData *H_Data = UIImageJPEGRepresentation(image, .5);
        NSDictionary *dic = @{@"file":[Base64codeFunc base64EncodedStringFrom:H_Data],@"token":[MyHelper toToken]};
        [NetRequest postWithUrl:User_userHeadImage params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"上传结果 == %@",dict);
        } fail:^(id error) {
            
        }];
    }else{
        [MyHelper showMessage:@"拍摄异常"];
    }
    
}

@end
