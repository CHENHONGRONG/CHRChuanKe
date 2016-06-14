//
//  CHRNetworkSingleton.h
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/10.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求超时
#define TIMEOUT 30

@interface CHRNetworkSingleton : NSObject

+(instancetype)sharedManaager;

//获取推荐课程内容
-(void)getreCommendationsResult:(NSDictionary *)userInfo andUrl:(NSString *)strUrl andSuccessBlock:(void(^)(id responseBody))successBlock andFialureBlock:(void(^)(id error))fialureBlock;
@end
