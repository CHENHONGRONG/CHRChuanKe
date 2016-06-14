//
//  CHRNetworkSingleton.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/10.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "CHRNetworkSingleton.h"

@implementation CHRNetworkSingleton

+(instancetype)sharedManaager
{
   return  [[self alloc]init];
    
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        instance = [super allocWithZone:zone];
    });
    return instance;
    
    
}

//获取推荐课程内容
-(void)getreCommendationsResult:(NSDictionary *)userInfo andUrl:(NSString *)strUrl andSuccessBlock:(void(^)(id responseBody))successBlock andFialureBlock:(void(^)(id error))fialureBlock
{
    //NSLog(@"%@", [NSThread currentThread]);
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        successBlock(dict);
        
        
    }];
    
    
    
}


@end
