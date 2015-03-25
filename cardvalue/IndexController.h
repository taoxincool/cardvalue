//
//  IndexController.h
//  cardvalue
//
//  Created by taoxin on 15-3-19.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexController : UIViewController <UISearchBarDelegate,UIScrollViewDelegate>

@property(nonatomic,assign) NSInteger timmerIsFirst;

@property(nonatomic,strong) IBOutlet UIScrollView *scroll;

-(IBAction)hideKeyboard:(id)sender;

@end
