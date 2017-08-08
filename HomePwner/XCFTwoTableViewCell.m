//
//  XCFTwoTableViewCell.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "XCFTwoTableViewCell.h"
#import "WeiBoItem.h"
#import "Masonry.h"

@interface XCFTwoTableViewCell ()

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *content;
@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) UIView *margin;

-(void) setWeiBoItem:(WeiBoItem *) weibo;
@end

@implementation XCFTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithRed:arc4random()%100/100.f green:arc4random()%100/100.f blue:arc4random()%100/100.f alpha:arc4random()%100/100.f];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
//        self.backgroundColor = [UIColor colorWithRed:arc4random()%100/100.f green:arc4random()%100/100.f blue:arc4random()%100/100.f alpha:arc4random()%100/175.f];
        self.title = [[UILabel alloc] init];
        self.content = [[UILabel alloc] init];
        self.image= [[UIImageView alloc] init];
        self.margin = [[UIView alloc] init];
        self.margin = [[UIView alloc] init];
        self.margin.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_content];
        [self.contentView addSubview:_margin];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.content.textAlignment = NSTextAlignmentCenter;
        __weak UIView *contentV = self.contentView;
        [_image mas_makeConstraints:^(MASConstraintMaker *make){
            make.right.equalTo(contentV).with.offset(-10);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
            make.top.equalTo(contentV).with.offset(0);
            make.width.equalTo(@100);
        }];
        [_title mas_makeConstraints:^(MASConstraintMaker *make){
            make.centerY.mas_equalTo(_image.mas_centerY);
            make.right.equalTo(_image.mas_left).with.offset(-40);
            make.left.equalTo(contentV).with.offset(10);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
        }];

        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.mas_bottom);
            make.top.equalTo(_title.mas_bottom);
            make.height.equalTo(contentV).multipliedBy(11/24.f);
            make.centerX.mas_equalTo(contentV.mas_centerX);
            make.width.equalTo(contentV);
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
