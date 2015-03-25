//
//  ReachabilityAppDelegate.h
//  cardvalue
//
//  Created by taoxin on 15/3/25.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Reachability;
@interface ReachabilityAppDelegate: NSObject {
    IBOutlet UIWindow* window;
    IBOutlet UIView* contentView;
    IBOutlet UILabel* summaryLabel;
    
    IBOutlet UITextField* remoteHostLabel;
    IBOutlet UIImageView* remoteHostIcon;
    IBOutlet UITextField* remoteHostStatusField;
    
    IBOutlet UIImageView* internetConnectionIcon;
    IBOutlet UITextField* internetConnectionStatusField;
    
    IBOutlet UIImageView* localWiFiConnectionIcon;
    IBOutlet UITextField* localWiFiConnectionStatusField;
    
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
}
@end