//
//  HSSetTableViewManager.h
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HSBaseCellModel, HSFooterModel, HSHeaderModel, HSSectionModel;


@interface HSSetTableViewManager : NSObject

@property (nonatomic, strong)NSMutableArray<HSSectionModel*> *dataSource;  ///<

/**
 初始化manager
 
 @param dataSource 数据源
 @return self
 */
- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource;

@end
