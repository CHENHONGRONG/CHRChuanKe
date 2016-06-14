//
//  CHRHomeViewCell.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/8.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "CHRHomeViewCell.h"

@interface CHRHomeViewCell ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *lable;

@property (nonatomic, strong) UILabel *subLable;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *title;

@end

@implementation CHRHomeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
   
    
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    
    CHRHomeViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        
        cell = [[CHRHomeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    return cell;
    
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView *imageView  = [[UIImageView alloc]init];
        self.iconView = imageView;
        imageView.frame = CGRectMake(10, 10, 80, 60);
        
        imageView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        [self.contentView addSubview:imageView];
        
        UILabel *lable = [UILabel new];
        self.lable = lable;
        lable.font = [UIFont systemFontOfSize:20];
        lable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:lable];
        
        UILabel *subLable = [UILabel new];
        self.subLable = subLable;
        subLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:subLable];
        subLable.backgroundColor = [UIColor brownColor];
        
        
    }
    
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.iconView.frame = CGRectMake(10, 10, 60, 60);
   
    CGFloat lableX = CGRectGetMaxX(self.iconView.frame) + 10;
    CGFloat lableY = 10;
    CGFloat lableW = ScreenW - lableX - 10;
    CGFloat lableH = 25;
    
    self.lable.frame = CGRectMake(lableX,lableY,lableW,lableH);

    
    CGFloat subLableX = lableX;
    CGFloat subLableW = lableW;
    CGFloat subLableH = 20;
    CGFloat subLableY = CGRectGetMaxY(self.iconView.frame) - subLableH;
    self.subLable.frame = CGRectMake(subLableX, subLableY, subLableW, subLableH);

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
