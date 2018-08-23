//
//  SSSelectItemView.m
//  SSSelectItem
//
//  Created by Sherry on 2018/8/22.
//  Copyright © 2018年 Sherry. All rights reserved.
//

#import "SSSelectItemView.h"
#import <Masonry/Masonry.h>
#import "SSSortButton.h"

#define SSColorWithRGB(r,g,b,a) [UIColor colorWithRed:(float)r/255 green:(float)g/255 blue:(float)b/255 alpha:a]

@implementation SSSelectItemView




//开始渲染
- (void)prepareView{
    if(_maxCount>0){
        [self initScrollContentView];
    }else{
        [self initContentView];
    }
}


- (void)initContentView{
    //按钮
    __weak SSSortButton *lastView = nil;
    for (NSInteger i =0 ;i<_titles.count; i++) {
        SSSortButton *bt = [[SSSortButton alloc]init];
        bt.titleLabel.text = _titles[i];
        bt.titleLabel.textColor = SSColorWithRGB(119, 119, 119, 1);
        bt.titleLabel.font =[UIFont systemFontOfSize:14];
        bt.tag = i;
        [bt addTarget:self action:@selector(choiceActionButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
        [bt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self).with.offset(0);
            // 不是第一个
            if (lastView) {
                make.left.equalTo(lastView.mas_right).with.offset(0);
                make.width.equalTo(lastView);
            }
            else {
                make.left.equalTo(self).with.offset(0);
            }
        }];
        
        lastView = bt;
        //是否支持升降序
        for (NSNumber *index in _sortIndexs) {
            if (index.integerValue == i) {
                bt.sort = YES;
            }
        }
    }
    // 最后一个处理按钮
    [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self).with.offset(0);
        make.right.equalTo(self);
    }];
}


- (void)initScrollContentView{
    //滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.pagingEnabled = YES;
    scrollView.canCancelContentTouches = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor greenColor];
    [self addSubview:scrollView];
    //每个item的宽度
    CGFloat itemWith = self.frame.size.width/_maxCount;
    scrollView.contentSize = CGSizeMake(itemWith*_titles.count,self.frame.size.height);

    //背景视图
    UIView *contentBack = [[UIView alloc] init];
    contentBack.backgroundColor = [UIColor redColor];
    contentBack.layer.borderWidth = 1;
    [scrollView addSubview:contentBack];
    [contentBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.width.offset(itemWith*self->_titles.count);
        make.height.offset(self.frame.size.height);
    }];

    //按钮
    __weak SSSortButton *lastView = nil;
    for (NSInteger i =0 ;i<_titles.count; i++) {
        SSSortButton *bt = [[SSSortButton alloc]init];
        bt.titleLabel.text = _titles[i];
        bt.titleLabel.textColor = SSColorWithRGB(119, 119, 119, 1);
        bt.titleLabel.font =[UIFont systemFontOfSize:14];
        bt.tag = i;
        [bt addTarget:self action:@selector(choiceActionButton:) forControlEvents:UIControlEventTouchUpInside];
        [contentBack addSubview:bt];
        [bt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(contentBack).with.offset(0);
            make.width.offset(itemWith);
            // 不是第一个
            if (lastView) {
                make.left.equalTo(lastView.mas_right).with.offset(0);
            }
            else {
                make.left.equalTo(contentBack).with.offset(0);
            }
        }];
        
        lastView = bt;
        //是否支持升降序
        for (NSNumber *index in _sortIndexs) {
            if (index.integerValue == i) {
                bt.sort = YES;
            }
        }
    }
}


#pragma mark - 点击事件
- (void)choiceActionButton:(SSSortButton *)sender{
    if (sender.sort) {
        if (sender.status == 0 || sender.status == 2) {
            sender.status = 1;
        }else{
                sender.status = 2;
        }
    }
    
    if (_completion) {
        _completion(sender.tag,sender.status);
    }
}


@end
