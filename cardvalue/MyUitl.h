//
//  UserUitl.h
//  cardvalue
//
//  Created by taoxin on 15/3/22.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUitl : NSObject

+(id)getUser;

+(void)setDatafromTosandbox : (id) value AndKey : (id) key;

+(id)getDatafromTosandbox : (id) key;

+ (void)timerFireMethod:(NSTimer*)theTimer;

+ (void)showAlert : (NSString *)  inpuTitle : (NSString *) inputMessage ;

+(void)alert : (UIView *) targetView content : (NSString *) content;

@end
