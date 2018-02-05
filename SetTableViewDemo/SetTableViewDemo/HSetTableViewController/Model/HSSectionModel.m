//
//  HSSectionModel.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/22.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "HSSectionModel.h"
#import "HSBaseCellModel.h"

@implementation HSSectionModel

-(void)addCellModel:(HSBaseCellModel *)model
{
    if (model) {
        [self.cellModels addObject:model];
    }
}

-(NSMutableArray<HSBaseCellModel *> *)cellModels
{
    if (!_cellModels) {
        _cellModels = [NSMutableArray array];
    }
    return _cellModels;
}


@end
