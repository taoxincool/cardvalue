//
//  LoginController.h
//  cardvalue
//
//  Created by taoxin on 15-3-19.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

@property(nonatomic,strong) IBOutlet UIView *myView;

@property(nonatomic,strong) IBOutlet UIButton *loginBtn;

@property(nonatomic,strong) IBOutlet UITextField *txtUsername;

@property(nonatomic,strong) IBOutlet UITextField *txtPassword;

-(IBAction)backBtn:(id)sender;

-(IBAction)hideKeyboard:(id)sender;

-(IBAction)loginBtn:(id)sender;

@end
