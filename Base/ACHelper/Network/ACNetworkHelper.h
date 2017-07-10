//
//  ACNetworkHelper.h
//  机场智能小车
//
//  Created by 孤岛 on 2017/7/10.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
static NSString *const myKey=@"6e7e51904b224960b2c1d098b27bad0b";
@interface ACNetworkHelper : NSObject
+(AFHTTPSessionManager *)sharedManager;
+(Boolean)Networkmonitor;
@end
