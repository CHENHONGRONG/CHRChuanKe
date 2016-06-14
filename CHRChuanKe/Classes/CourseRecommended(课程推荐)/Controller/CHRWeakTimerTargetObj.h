//
//  CHRWeakTimerTargetObj.h
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/10.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHRWeakTimerTargetObj : NSObject

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timerInterval target:(id)addtarget selector:(SEL)aSelector userInfo:(id)userInfo  repeats:(BOOL)yesOrNO;

@end
