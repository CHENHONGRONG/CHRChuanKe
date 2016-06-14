//
//  Coures.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/8.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "Coures.h"

@implementation Coures

+ (instancetype)couresWithDict:(NSDictionary *)dict {
    Coures *coures = [[self alloc] init];
    
    [coures setValuesForKeysWithDictionary:dict];
    
    return coures;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


@end
