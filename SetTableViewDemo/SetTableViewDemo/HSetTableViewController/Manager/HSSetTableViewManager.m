//
//  HSSetTableViewManager.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "HSSetTableViewManager.h"
#import "HSBaseCellModel.h"
#import "NSArray+HSSafeAccess.h"
#import "HSBaseCell.h"
#import "HSSectionModel.h"
#import "Masonry.h"

@interface HSSetTableViewManager()<UITableViewDataSource,UITableViewDelegate>


@end


@implementation HSSetTableViewManager

- (instancetype)initSetTableViewManager:(NSMutableArray *)dataSource
{
    if(self = [super init]){
        self.dataSource = dataSource;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HSSectionModel *sectionModel = (HSSectionModel*)[self.dataSource hs_objectWithIndex:section];
    return sectionModel.cellModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HSSectionModel *section = (HSSectionModel*)[self.dataSource hs_objectWithIndex:indexPath.section];
    NSAssert([section.cellModels isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[section.cellModels hs_objectWithIndex:indexPath.row];
    Class class = NSClassFromString(cellModel.cellClass);
    NSAssert([class isSubclassOfClass:[HSBaseCell class]], @"此cellclass类别必须存在,并且继承HSBaseTableViewCell");
     HSBaseCell *cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    [cell setupDataModel:cellModel];
    //处理分割线
    return cell;
}


- (CGFloat)systemFittingHeightForConfiguratedCell:(UITableViewCell *)cell withTalbView:(UITableView*)tableView {
    
    CGFloat contentViewWidth = CGRectGetWidth(tableView.frame);
    
    if (cell.accessoryView) {
        contentViewWidth -= 16 + CGRectGetWidth(cell.accessoryView.frame);
    } else {
        static const CGFloat systemAccessoryWidths[5] = {
            [UITableViewCellAccessoryNone] = 0,
            [UITableViewCellAccessoryDisclosureIndicator] = 34,
            [UITableViewCellAccessoryDetailDisclosureButton] = 68,
            [UITableViewCellAccessoryCheckmark] = 40,
            [UITableViewCellAccessoryDetailButton] = 48
        };
        contentViewWidth -= systemAccessoryWidths[cell.accessoryType];
    }
    
    CGFloat fittingHeight = 0;
    
    if (contentViewWidth > 0) {
        NSLayoutConstraint *widthFenceConstraint =
        [NSLayoutConstraint
         constraintWithItem:cell.contentView
         attribute:NSLayoutAttributeWidth
         relatedBy:NSLayoutRelationEqual
         toItem:nil
         attribute:NSLayoutAttributeNotAnAttribute
         multiplier:1.0
         constant:contentViewWidth];
        [cell.contentView addConstraint:widthFenceConstraint];
        
        fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        [cell.contentView removeConstraint:widthFenceConstraint];
    }
    
    if (fittingHeight == 0) {
        fittingHeight = 44;
    }
    
    if (tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        fittingHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    
    return fittingHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HSSectionModel *section = (HSSectionModel*)[self.dataSource hs_objectWithIndex:indexPath.section];
    HSBaseCellModel *cellModel = (HSBaseCellModel *)[section.cellModels hs_objectWithIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    if(cellModel.actionBlock){
        cellModel.actionBlock(cellModel);
    }
}

#pragma mark tableView代理方法
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    HSSectionModel *sectionModel = (HSSectionModel*)[self.dataSource hs_objectWithIndex:section];
    HSFooterModel *footer = sectionModel.footerModel;
    footer.footerView.backgroundColor = [UIColor lightGrayColor];
    
    
    return footer.footerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    HSSectionModel *sectionModel = (HSSectionModel*)[self.dataSource hs_objectWithIndex:section];
    HSHeaderModel *header = sectionModel.headerModel;
    header.headerView.backgroundColor = [UIColor blueColor];
    
    return header.headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    HSSectionModel *sectionModel = (HSSectionModel*)[self.dataSource hs_objectWithIndex:section];
    HSHeaderModel *header = sectionModel.headerModel;
    header.headerView.backgroundColor = [UIColor lightGrayColor];
    return [header.headerView.subviews[0] systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    HSSectionModel *sectionModel = (HSSectionModel*)[self.dataSource hs_objectWithIndex:section];
    HSFooterModel *footer = sectionModel.footerModel;
    footer.footerView.backgroundColor = [UIColor lightGrayColor];
    
    return [footer.footerView.subviews[0] systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}


-(void)dealloc
{
    NSLog(@"tabllemamager----dealloc");
}

@end
