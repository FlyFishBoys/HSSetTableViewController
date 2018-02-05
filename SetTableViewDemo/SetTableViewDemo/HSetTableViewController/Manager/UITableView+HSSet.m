//
//  UITableView+HSSet.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/22.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "UITableView+HSSet.h"
#import <objc/runtime.h>
#import "HSSetTableViewManager.h"


@interface UITableView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) HSSetTableViewManager *manager;  ///<表视图代理类
@end

static NSString * managerkey = @"managerkey";

@implementation UITableView (HSSet)

+(void)load
{
    [self.class swizzleMethod:@selector(willMoveToSuperview:) newMethod:@selector(new_willMoveToSuperview)];
    
     [self.class swizzleMethod:NSSelectorFromString(@"dealloc") newMethod:@selector(new_dealloc)];
}

-(void)new_dealloc
{
    self.manager = nil;
    NSLog(@"table---dealloc!!!");
}

+ (void)swizzleMethod:(SEL)oneSel newMethod:(SEL)anotherSel {
    
    Method orign = class_getInstanceMethod(self, oneSel);
    Method new = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(orign, new);
}


-(void)new_willMoveToSuperview
{
    //UITableView * table = [self new_initWithFrame:frame];
    NSLog(@"table 初始化完成！！！");
    
    if(self.manager == nil){
        self.manager = [[HSSetTableViewManager alloc] init];
        self.dataSource = self.manager;
        self.delegate = self.manager;
        self.tableFooterView = [UIView new];
        self.tableHeaderView = [UIView new];
        self.rowHeight = UITableViewAutomaticDimension;
        self.sectionHeaderHeight = UITableViewAutomaticDimension;
        self.sectionFooterHeight = UITableViewAutomaticDimension;
        
    }
    //return table;
}


-(void)setHS_dataArray:(NSMutableArray *)arr
{
    if (arr) {
        self.manager.dataSource = [NSMutableArray array];
        self.manager.dataSource = arr;
        [self reloadData];
    }
}


#pragma mark- property

-(void)setManager:(HSSetTableViewManager *)manager
{
    objc_setAssociatedObject(self, &managerkey, manager, OBJC_ASSOCIATION_RETAIN);
}

-(HSSetTableViewManager *)manager
{
    return objc_getAssociatedObject(self, &managerkey);
}


@end
