//
//  HSZhiHuTableViewCell.m
//  HSSetTableViewCtrollerDemo
//
//  Created by hushaohui on 2017/6/9.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "HSZhiHuCustomTableViewCell.h"
#import "HSZhiHuCustomCellModel.h"
#import "HSSetTableViewController.h"
#import "NSBundle+HSImage.h"
#import "Masonry.h"

@interface HSZhiHuCustomTableViewCell()



@property (nonatomic, weak)UISwitch *mySwitch;  ///<
@property (nonatomic, weak)UIImageView *arrow;  ///<
@property (nonatomic, strong)HSZhiHuCustomCellModel *switchModel;  ///<

@end
@implementation HSZhiHuCustomTableViewCell

+ (HSBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView
{
    HSZhiHuCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        
        //这里重写父类方法 仅仅是因为需要改写下cell样式，实际情况可以自己管理布局
        cell = [[HSZhiHuCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI
{
   [super setupUI];

    //添加switch
    UISwitch *switchItem = [[UISwitch alloc] initWithFrame:CGRectMake(HS_SCREEN_WIDTH- HS_KSwitchWidth - HS_KCellMargin, (60 - HS_KSwitchHeight)/2, HS_KSwitchWidth, HS_KSwitchHeight)];
    [switchItem addTarget:self action:@selector(switchChang:) forControlEvents:UIControlEventValueChanged];
    switchItem.onTintColor = [UIColor blueColor];
    [self addSubview:switchItem];
    self.mySwitch = switchItem;
    
//    [self.mySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(@20);
//            make.top.equalTo(@20);
//            make.width.equalTo(@60);
//            make.height.equalTo(@35);
//            make.bottom.equalTo(@-40);
//    }];


    //箭头
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(HS_SCREEN_WIDTH -HS_KCellMargin - HS_KArrowWidth, (60 - HS_kArrowHeight)/2, HS_KArrowWidth, HS_kArrowHeight)];
    arrow.image = [NSBundle hs_imageNamed:@"ic_hs_tableView_arrow"];
    [self.contentView addSubview:arrow];
    self.arrow = arrow;

//    UIView * redView = [UIView new];
//    redView.backgroundColor = [UIColor redColor];
//    redView.frame = CGRectMake(190, 20, 60, 40);
//    [self.contentView addSubview:redView];
//
    
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    [super setupDataModel:model];

    HSZhiHuCustomCellModel *cellModel = (HSZhiHuCustomCellModel *)model;
    self.switchModel = cellModel;
    
    self.arrow.hidden = !cellModel.hideSwitch;
    self.mySwitch.hidden = cellModel.hideSwitch;
    self.textLabel.text = cellModel.text;
    self.detailTextLabel.text = cellModel.detailText;
    self.textLabel.font = cellModel.titleFont;
    self.detailTextLabel.font = [UIFont systemFontOfSize:19];
    if (self.switchModel.hideSwitch==YES) {
        [self.mySwitch removeConstraints:self.mySwitch.constraints];
    }
}

- (void)switchChang:(UISwitch *)switchItem
{
    
    self.switchModel.on = switchItem.on;
    if(self.switchModel.block){
        self.switchModel.block(self.switchModel,switchItem.on);
    }
    
    
}

@end
