//
//  LoginController.m
//  cardvalue
//
//  Created by taoxin on 15-3-19.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import "LoginController.h"
#import "AccountController.h"
#import "MyUitl.h"
#import "WeUserModel.h"
#import "MBProgressHUD.h"
#import "ASIFormDataRequest.h"
#import "NSObject+RMArchivable.h"
#import "RMMapper.h"
#import "JsonUtil.h"
#import "NSObject+RMArchivable.h" 
#import "Constants.h"

@interface LoginController ()

@end

@implementation LoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //加载view边框
    
   // _myView.layer.borderColor = [UIColor grayColor];
    
    [_loginBtn.layer setCornerRadius:5.0];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark 返回按钮
-(IBAction)backBtn:(id)sender {
    NSLog(@"come on backBtn click event!");
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark 点击屏幕隐藏键盘
-(IBAction)hideKeyboard:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark 登录
-(IBAction)loginBtn:(id)sender {
    @try
    {
        if ([_txtUsername.text length] <= 0 || [_txtPassword.text length] <= 0 ) {
            [MyUitl alert:self.navigationController.view content:@"请输入用户名或密码"];
        } else {
            //http方式访问服务器
            NSString *postURL = [NSString stringWithFormat:@"%@%@",serviceURL,@"/app/login"];
            ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:postURL]];
            [request addPostValue:@"admin" forKey:@"username"];
            [request addPostValue:@"admin" forKey:@"password"];
            [request startSynchronous];
            NSError *error = [request error];
            if (!error) {
                NSString *data = [request responseString];
                NSLog(@"service return data is [%@]",data);
                if(data != nil && [data length] > 1) {
                    //json转对象
                    NSDictionary *dic = [JsonUtil dictionaryWithJsonString:data];
                    WeUserModel *user = [RMMapper objectWithClass:[WeUserModel class] fromDictionary:dic];
                    //储存沙盒
                    [MyUitl setDatafromTosandbox:user AndKey:@"loginUser"];
                    //返回首页
                    [self.navigationController popViewControllerAnimated:YES];
                } else {
                    [MyUitl showAlert:nil :@"用户名或密码不正确"];
                }
            } else {
               NSLog(@"move failed:%@", [error localizedDescription]);
            }
            
            
        }
    }@catch (NSException * e) {
        [MyUitl showAlert:nil :@"服务器繁忙，请稍后再试！"];
        NSLog(@"Exception: %@", e);
    }
    
}



@end
