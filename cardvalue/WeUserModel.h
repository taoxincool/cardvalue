//
//  WeUserModel.h
//  cardvalue
//
//  Created by taoxin on 15/3/22.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeUserModel : NSObject

@property(nonatomic,retain) NSString *id;
@property(nonatomic,retain) NSString *weId;
@property(nonatomic,retain) NSString *type;
@property(nonatomic,retain) NSString *openId;
@property(nonatomic,retain) NSString *username;
@property(nonatomic,retain) NSString *password;
@property(nonatomic,retain) NSString *lastLogin;
@property(nonatomic,retain) NSString *enabled;
@property(nonatomic,retain) NSString *token;
@property(nonatomic,retain) NSString *referrerId;
@property(nonatomic,retain) NSString *source;
@property(nonatomic,retain) NSString *latitude;
@property(nonatomic,retain) NSString *longitude;
@property(nonatomic,retain) NSString *processorId;

@end
