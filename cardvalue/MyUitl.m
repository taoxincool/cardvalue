//
//  UserUitl.m
//  cardvalue
//
//  Created by taoxin on 15/3/22.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import "MyUitl.h"
#import "WeUserModel.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "MBProgressHUD.h"


@implementation MyUitl

#pragma mark 沙盒中获取对象
+(id)getUser {
    WeUserModel *user  = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"loginUser"];
    return user;
}

#pragma mark 沙盒中存放对象
+(void)setDatafromTosandbox : (id) value AndKey : (id) key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults rm_setCustomObject:value forKey:key];
}

#pragma mark 沙盒中获取对象
+(id)getDatafromTosandbox : (id) key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    return [defaults rm_customObjectForKey:key];
}

#pragma mark 自动消失弹出框，系统内置白色主题
+ (void)timerFireMethod:(NSTimer*)theTimer{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert = NULL;
}
+ (void)showAlert : (NSString *)  inpuTitle : (NSString *) inputMessage  {
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:inpuTitle message:inputMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    promptAlert.tintColor = [UIColor redColor];
    promptAlert.backgroundColor = [UIColor blackColor];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFireMethod:)userInfo:promptAlert repeats:NO];
    [promptAlert show];
}

#pragma mark HUB样式弹出框
+(void)alert : (UIView *) targetView content : (NSString *) content {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:targetView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = content;
    hud.margin = 14;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

@end
