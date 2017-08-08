//
//  CollectionViewCell.m
//  MyCollectionView
//
//  Created by Xu,Chao(MMS) on 2017/8/2.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@end


@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.frame = frame;
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"tiantiansifangmao-%d",arc4random()%19+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        [imageView setFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
    }
    return self;
}

-(void)prepareForReuse{
    for(UIView *view in self.contentView.subviews){
        [view removeFromSuperview];
    }
    self.contentView.contentMode = UIViewContentModeScaleAspectFit;
    self.contentView.clipsToBounds = YES;
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"tiantiansifangmao-%d",arc4random()%19+1]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [imageView setFrame:CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];

}

@end
