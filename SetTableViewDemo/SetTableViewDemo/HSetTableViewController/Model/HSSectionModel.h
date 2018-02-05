//
//  HSSectionModel.h
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/22.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HSBaseCellModel,HSHeaderModel,HSFooterModel;

@interface HSSectionModel : NSObject

@property (nonatomic,strong) NSMutableArray<HSBaseCellModel*> * cellModels;
@property (nonatomic,strong) HSHeaderModel *  headerModel;
@property (nonatomic,strong) HSFooterModel *  footerModel;

-(void)addCellModel:(HSBaseCellModel*)model;

@end
