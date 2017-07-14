//
//  WeiBoItem.h
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiBoItem : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *image;

-(instancetype)initWithName:(NSString *) t withContent:(NSString *) c withImage:(NSString *) i;

@end
