//
//  HSBaseCell.h
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSBaseCellModel.h"


@interface HSBaseCell : UITableViewCell

@property (nonatomic, strong)HSBaseCellModel *cellModel;  ///<cellModel

//cell初始化方法
+ (HSBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
//初始化UI方法
- (void)setupUI;
//设置数据源方法
- (void)setupDataModel:(HSBaseCellModel *)model;
@end
