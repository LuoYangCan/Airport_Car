//
//  ACNetworkHelper.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/7/10.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "ACNetworkHelper.h"

static NSString *const weatherAPI = @"https://free-api.heweather.com/v5/";
@implementation ACNetworkHelper
static AFHTTPSessionManager * _sharedClient = nil;
+(AFHTTPSessionManager *)sharedManager{
    static dispatch_once_t OnceToken;
    dispatch_once(&OnceToken, ^{
        _sharedClient = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:weatherAPI]];
    });
    return _sharedClient;
}
/**
 检测网络状态
 */
+(Boolean)Networkmonitor{
    AFNetworkReachabilityManager *manager =[AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    static Boolean Flag = NO;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                Flag = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                Flag = YES;
                break;
            default:
                Flag = NO;
                break;
        }
    }];
    return Flag;
}



@end
