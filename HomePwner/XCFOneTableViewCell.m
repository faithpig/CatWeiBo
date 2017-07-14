//
//  XCFOneTableViewCell.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "XCFOneTableViewCell.h"
#import "WeiBoItem.h"
#import "Masonry.h"

@interface XCFOneTableViewCell ()

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) UIView *margin;

-(void) setWeiBoItem:(WeiBoItem *) weibo;

@end

@implementation XCFOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"XCFOneTableViewCell";
    XCFOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[XCFOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
   return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.title = [[UILabel alloc] init];
        self.content = [[UILabel alloc] init];
        self.image= [[UIImageView alloc] init];
        self.margin = [[UIView alloc] init];
        self.margin.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_content];
        [self.contentView addSubview:_margin];
        __weak UIView *contentV = self.contentView;
        self.title.textAlignment = NSTextAlignmentCenter;
        self.content.textAlignment = NSTextAlignmentCenter;
        [_image mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.equalTo(contentV.mas_left).with.offset(10);
            make.top.equalTo(contentV).with.offset(0);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
            make.width.equalTo(@100);
        }];
        [_title mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.mas_equalTo(_image.mas_centerY);
            make.left.equalTo(_image.mas_right).with.offset(40);
            make.right.equalTo(contentV.mas_right).with.offset(-10);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
        }];
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.mas_bottom);
            make.top.equalTo(_title.mas_bottom);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
            make.width.equalTo(contentV);
            make.centerX.mas_equalTo(contentV.mas_centerX);
        }];
        [_margin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_content.mas_bottom);
            make.width.equalTo(contentV);
            make.height.equalTo(contentV).multipliedBy(1/12.f);
        }];
    }
    return self;
}

-(void)setWeiBoItem:(WeiBoItem *)weibo{
    _weiBoItem = weibo;
    self.title.text = weibo.title;
    self.content.text = weibo.content;
    self.image.image = [UIImage imageNamed:weibo.image];
}

@end
