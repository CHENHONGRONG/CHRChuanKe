//
//  Coures.h
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/8.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coures : NSObject

@property (nonatomic, copy) NSString *photoUrl;

+ (instancetype)couresWithDict:(NSDictionary *)dict;

@end
