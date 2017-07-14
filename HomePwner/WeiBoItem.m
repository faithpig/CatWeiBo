//
//  WeiBoItem.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "WeiBoItem.h"

@implementation WeiBoItem

-(instancetype)initWithName:(NSString *)t withContent:(NSString *)c withImage:(NSString *)i{
    self = [super init];
    if(self){
        _content = c;
        _title = t;
        _image = i;//这里copy用到了吗？
    }
    return self;
}

-(instancetype)init{
    return [self initWithName:@"" withContent:@"" withImage:nil];
}

@end
