//
//  MyCollectionViewController.m
//  MyCollectionView
//
//  Created by Xu,Chao(MMS) on 2017/8/2.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyLayout.h"
#import "CollectionViewCell.h"

@interface MyCollectionViewController ()

@property (nonatomic, assign) CGFloat itemCount;

@end

@implementation MyCollectionViewController

-(void)loadView{
    /** 创建布局参数 */
    MyLayout * layout = [[MyLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.navigationController setToolbarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:rand()%100/100.f green:rand()%100/100.f blue:rand()%100/100.f alpha:rand()%100/100.f];
    return cell;
}


@end
