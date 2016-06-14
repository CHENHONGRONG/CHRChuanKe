//
//  CHRCateViewController.h
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/7.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHRCateViewController : UIViewController



/**
 *  课程类型
 */
@property (nonatomic, copy) NSString *cateType;

/**
 *  课程名字数组
 */
@property (nonatomic, strong) NSMutableArray *cateNameArray;

/**
 *  课程ID数组
 */
@property (nonatomic, strong) NSMutableArray *cateIDArray;


@end
