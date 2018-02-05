//
//  HSBaseCellModel.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "HSBaseCellModel.h"
#import "HSBaseCell.h"

@interface HSBaseCellModel()
{
    NSString *privateCellModelIdentifier;///<私有变量
}

@end

@implementation HSBaseCellModel

- (instancetype)init
{
    if(self = [super init]){
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        privateCellModelIdentifier = [NSString stringWithFormat:@"%lf%@",now,threadNumber];
    }
    
    return self;
}

- (NSString *)identifier
{
    return privateCellModelIdentifier;
}

-(NSString *)cellClass
{
    return NSStringFromClass([HSBaseCell class]);
}

@end


@implementation HSHeaderModel

@end



@implementation HSFooterModel

@end
