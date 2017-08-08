//
//  XCFDetailController.m
//  HomePwner
//
//  Created by Xu,Chao(MMS) on 2017/7/13.
//  Copyright © 2017年 Xu,Chao(MMS). All rights reserved.
//

#import "XCFDetailController.h"
#import "WeiBoItem.h"

@interface XCFDetailController ()
@property (nonatomic, strong) IBOutlet UITextField* xcftitle;
@property (nonatomic, strong) IBOutlet UITextField* xcfcontent;
@property (nonatomic, strong) IBOutlet UILabel* label1;
@property (nonatomic, strong) IBOutlet UILabel* label2;
@property (nonatomic, strong) IBOutlet UIImageView* imgView;
@end

@implementation XCFDetailController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.xcftitle.text = self.item.title;
    self.xcfcontent.text = self.item.content;
    self.xcftitle.enabled = NO;
    self.xcfcontent.enabled = NO;
    self.imgView.image = [UIImage imageNamed:self.item.image];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
