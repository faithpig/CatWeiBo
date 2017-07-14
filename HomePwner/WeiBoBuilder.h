//
//  WeiBoBuilder.h
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiBoItem.h"

@interface WeiBoBuilder : NSObject

@property(nonatomic,strong) NSArray* items;

+(instancetype) sharedBuilder;
-(WeiBoItem *) createWeiBo:(NSString *)title withImage:(NSString *)image withContent: (NSString *)content;

@end
