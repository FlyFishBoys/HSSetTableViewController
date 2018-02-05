//
//  HSBaseCellModel.h
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HSBaseCellModel;
typedef void(^ClickActionBlock)(HSBaseCellModel *model);


@interface HSBaseCellModel : NSObject

/**
 基础属性
 */
@property (nonatomic,  copy)            NSString*   title;
@property (nonatomic,  copy)            NSString*   detail;


@property (nonatomic,  assign)          NSInteger   type;  ///< 扩展属性，比如cellType>
@property (nonatomic,  copy,readonly)   NSString   *identifier;  ///<唯一标识符(更新会用到)
@property (nonatomic,  copy,readonly)   NSString   *cellClass;  ///<该模型绑定的cell类名
@property (nonatomic, strong)           UIColor    *backgroundColor;
@property (nonatomic, strong)           UIColor    *titleColor;
@property (nonatomic, strong)           UIColor    *detailColor;
@property (nonatomic, strong)           UIFont     *titleFont;
@property (nonatomic, strong)           UIFont     *deatileFont;

@property (nonatomic, assign)           UITableViewCellSelectionStyle   selectionStyle;//选中cell效果
@property (nonatomic,  copy)            ClickActionBlock actionBlock;///<cell点击事件

@end


@interface HSHeaderModel : NSObject

@property (nonatomic, strong)           UIView *headerView;

@end


@interface HSFooterModel : NSObject

@property (nonatomic, strong)           UIView *footerView;


@end
