//
//  ViewController.m
//  SSSelectItem
//
//  Created by Sherry on 2018/8/22.
//  Copyright © 2018年 Sherry. All rights reserved.
//

#import "ViewController.h"
#import "SSSelectItemView.h"


#define SSWidth self.view.frame.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initContentView];
}


- (void)initContentView {
    SSSelectItemView *selectView = [[SSSelectItemView alloc] initWithFrame:CGRectMake(15, 100, SSWidth-30, 40)];
    selectView.backgroundColor = [UIColor whiteColor];
    selectView.layer.shadowColor = [UIColor redColor].CGColor;
    selectView.layer.shadowOffset = CGSizeMake(0,0);
    selectView.layer.shadowOpacity = 5;
    selectView.titles = @[@"衣服",@"裤子",@"袜子",@"鞋子"];
    selectView.sortIndexs = @[@1,@3];
    [self.view addSubview:selectView];
    [selectView prepareView];
    selectView.completion = ^(NSInteger index, NSUInteger sortStatus) {
        NSLog(@"index = %ld,sort = %lu",(long)index,(unsigned long)sortStatus);
    };
}


@end
