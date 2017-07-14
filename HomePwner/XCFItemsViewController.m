//
//  XCFItemsViewController.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/10.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "XCFItemsViewController.h"
#import "XCFOneTableViewCell.h"
#import "WeiBoItem.h"
#import "WeiBoBuilder.h"
#import "XCFOneTableViewCell.h"
#import "Masonry.h"
#import "XCFTwoTableViewCell.h"
#import "XCFDetailController.h"


@interface XCFItemsViewController ()<UITableViewDelegate>
@property (nonatomic, strong) NSArray *statusFrames;//存放所有cell的item
@property (nonatomic, strong) UIToolbar *toolBar;
-(void)takephoto:(id) sender;
-(void)add:(id) sender;
@end

@implementation XCFItemsViewController

-(instancetype)init{
    self = [super initWithStyle: UITableViewStylePlain];
    if(self){
        UINavigationItem *navItem = self.navigationItem;
        navItem.leftItemsSupplementBackButton = YES;
        navItem.title = @"猫微";
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[XCFOneTableViewCell class] forCellReuseIdentifier:@"XCFOneTableViewCell"];
    [self.tableView registerClass:[XCFTwoTableViewCell class] forCellReuseIdentifier:@"XCFTwoTableViewCell"];
    [self.navigationController setToolbarHidden:NO animated:YES];
    UIBarButtonItem *takephoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takephoto:)];
    UIBarButtonItem *jiange = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(add:)];
    
    [self setToolbarItems:[NSArray arrayWithObjects:takephoto,jiange,add,nil]];
    
}

-(void)add:(id) sender{
    
}

-(void)takephoto:(id)sender{
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

/**
 *  点击cell跳转详情页面
 *
 *  @indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSBundle *bundle = [NSBundle mainBundle];
    XCFDetailController *detailController = [[XCFDetailController alloc] initWithNibName:@"XCFDetailView" bundle:bundle];
    detailController.item = self.statusFrames[indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
}

//总共有多少个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//总行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.statusFrames count];
}

//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XCFOneTableViewCell *cell = nil;
    XCFTwoTableViewCell *cell2 = nil;
    if(indexPath.row%2==1) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"XCFTwoTableViewCell" forIndexPath:indexPath];
            cell.weiBoItem = self.statusFrames [indexPath.row];
            return cell;
    }else{
            cell2 = [tableView dequeueReusableCellWithIdentifier:@"XCFOneTableViewCell" forIndexPath:indexPath];
            cell2.weiBoItem = self.statusFrames [indexPath.row];
            return cell2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

//委托设置cell高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

#pragma mark - data source
//设置statusFrames（包括赋予数据）
-(NSArray *)statusFrames{
    if(_statusFrames==nil){
        int count = rand()%30;
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:count];
        for(int i=0;i<count;i++){
            WeiBoItem *item = [[WeiBoBuilder sharedBuilder] createWeiBo:[NSString stringWithFormat:@"title%d",i] withImage:[NSString stringWithFormat:@"tiantiansifangmao-%d",rand()%19+1] withContent:[NSString stringWithFormat:@"content%d",i]];
            [items addObject:item];
        }
        self.statusFrames = [items copy];
    }
    return _statusFrames;
}


@end
