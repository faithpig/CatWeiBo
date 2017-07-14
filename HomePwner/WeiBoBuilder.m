//
//  WeiBoBuilder.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/11.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "WeiBoBuilder.h"
#import "WeiBoItem.h"

@interface WeiBoBuilder()

@property NSMutableArray *privateItems;

@end

@implementation WeiBoBuilder

+(instancetype) sharedBuilder{
    static WeiBoBuilder* build = nil;
    if(!build){
        build = [[WeiBoBuilder alloc] initPrivate];
    }
    return build;
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use+[WeiBoBuilder sharedBuilder]" userInfo:nil];
    return nil;
}

-(WeiBoItem *)createWeiBo:(NSString *)title withImage:(NSString *)image withContent:(NSString *)content{
    WeiBoItem *weibo = [[WeiBoItem alloc] initWithName:title withContent:content withImage:image];
    return weibo;
}

@end
