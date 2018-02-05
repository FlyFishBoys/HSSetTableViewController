//
//  HSBaseCell.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "HSBaseCell.h"
#import "Masonry.h"

@implementation HSBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HSBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;

{
    HSBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[HSBaseCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        UIView * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
        testButt.backgroundColor = [UIColor redColor];
        [cell addSubview:testButt];
        
        [testButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@150);
            make.width.equalTo(@50);
            make.top.equalTo(@40);
            make.height.equalTo(@30);
            make.bottom.equalTo(@-15);
            
        }];
        
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    
    
}

- (void)setupDataModel:(HSBaseCellModel *)model
{
    self.cellModel = model;
    self.selectionStyle = model.selectionStyle;
    
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.detail;
    
}


@end
