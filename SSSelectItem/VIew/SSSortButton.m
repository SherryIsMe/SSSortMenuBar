//
//  SSSortButton.m
//  SSSelectItem
//
//  Created by Sherry on 2018/8/22.
//  Copyright © 2018年 Sherry. All rights reserved.
//

#import "SSSortButton.h"
#import <Masonry/Masonry.h>

#define SSWidth self.frame.size.width
#define SSHeight self.frame.size.height


@interface SSSortButton()
{
    UIImageView *_topImageView;
    UIImageView *_bottomImageView;
}
@end

@implementation SSSortButton

#pragma mark - 初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initContentView];
    }
    return self;
}


#pragma mark - 视图搭建
- (void)initContentView{
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.bottom.offset(0);
    }];
}


- (void)initSortView{
    //上图标
    UIImageView *topImageView = [[UIImageView alloc] init];
    topImageView.image = [UIImage imageNamed:@"arrow-top@2x.png"];
    _topImageView = topImageView;
    [self addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_titleLabel.mas_right);
        make.centerY.equalTo(self ->_titleLabel.mas_centerY).offset(-3);
        make.width.offset(11);
        make.height.offset(6);
    }];
    
    //下图标
    UIImageView *bottomImageView = [[UIImageView alloc] init];
    bottomImageView.image = [UIImage imageNamed:@"arrow-bottom@2x.png"];
    _bottomImageView = bottomImageView;
    [self addSubview:bottomImageView];
    [bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_titleLabel.mas_right);
        make.centerY.equalTo(self->_titleLabel.mas_centerY).offset(3);
        make.width.offset(11);
        make.height.offset(6);
    }];
}


#pragma mark - 配置状态
-(void)setSort:(BOOL)sort{
    _sort = sort;
    if (sort) {
        [self initSortView];
    }
}


- (void)setStatus:(NSUInteger)status{
    _status = status;
    switch (status) {
        case 1://升序
        {
            _topImageView.image = [UIImage imageNamed:@"arrow-top_selected@2x.png"];
            _bottomImageView.image = [UIImage imageNamed:@"arrow-bottom@2x.png"];
        }
            break;
        case 2://降序
        {
            _topImageView.image = [UIImage imageNamed:@"arrow-top@2x.png"];
            _bottomImageView.image = [UIImage imageNamed:@"arrow-bottom_selected@2x.png"];
        }
            break;
            
        default://默认无序
        {
            _topImageView.image = [UIImage imageNamed:@"arrow-top@2x.png"];
            _bottomImageView.image = [UIImage imageNamed:@"arrow-bottom@2x.png"];
        }
            break;
    }
}

@end














