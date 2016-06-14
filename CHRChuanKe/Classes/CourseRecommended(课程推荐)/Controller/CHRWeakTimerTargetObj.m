//
//  CHRWeakTimerTargetObj.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/10.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "CHRWeakTimerTargetObj.h"

@interface CHRWeakTimerTargetObj()

@property (nonatomic,weak) id addtarget;

@property (nonatomic, assign) SEL aSelector;

@end

/**
 *   用来接管定时器的强引用
 */

@implementation CHRWeakTimerTargetObj

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timerInterval target:(id)addtarget selector:(SEL)aSelector userInfo:(id)userInfo  repeats:(BOOL)yesOrNO
{
    //创建当前类对象
    CHRWeakTimerTargetObj *obj = [[CHRWeakTimerTargetObj alloc]init];
    obj.addtarget = addtarget;
    obj.aSelector = aSelector;
    
    
    return [NSTimer scheduledTimerWithTimeInterval:timerInterval target:addtarget selector:aSelector userInfo:userInfo repeats:yesOrNO];

}
//-(void)


@end
