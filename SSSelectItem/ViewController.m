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
    SSSelectItemView *selectView = [[SSSelectItemView alloc] initWithFrame:CGRectMake(25, 100, self.view.frame.size.width-50, 44)];
    //加阴影
    selectView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    selectView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    selectView.layer.shadowOpacity = .2;//阴影透明度，默认0
//    selectView.layer.shadowRadius = 6;//阴影半径，默认3
    selectView.showDividingLine = YES;
    selectView.backgroundColor = [UIColor whiteColor];;
    selectView.titleFont = [UIFont systemFontOfSize:15];
    selectView.arrowSelectColor = [UIColor redColor];
    selectView.arrowColor = [UIColor grayColor];
    selectView.titleColor = [UIColor grayColor];;
    selectView.titleSelectedColor = [UIColor redColor];
    selectView.titles = @[@"综合",@"价格",@"销量"];
    selectView.maxCount = 2;
    selectView.sortIndexs = @[@1,@2];
    [self.view addSubview:selectView];
    [selectView prepareView];
    selectView.completion = ^(NSInteger index, NSUInteger sortStatus) {
        NSLog(@"index = %ld,sort = %lu",(long)index,(unsigned long)sortStatus);
    };
    
}


@end
