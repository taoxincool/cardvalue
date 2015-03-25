//
//  JsonUtil.h
//  cardvalue
//
//  Created by taoxin on 15/3/25.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUtil : NSObject
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
