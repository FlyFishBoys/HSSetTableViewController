//
//  ViewController.m
//  SetTableViewDemo
//
//  Created by 孙威风 on 2018/1/15.
//  Copyright © 2018年 孙威风的book. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+HSSet.h"
#import "Masonry.h"
#import "AutoModelFileManager.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView * table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    table.backgroundColor = [UIColor greenColor];
    table.frame = self.view.bounds;
    
    [self.view addSubview:table];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    HSSectionModel * sectionModel1 = [HSSectionModel new];
    
    HSBaseCellModel * cell1_1 = [HSBaseCellModel new];
    cell1_1.type = 1;
    cell1_1.title = @"11111111";
    
    HSBaseCellModel * cell1_2 = [HSBaseCellModel new];
    cell1_2.type = 1;
    cell1_2.title = @"2222222";
    
    [sectionModel1 addCellModel:cell1_1];
    [sectionModel1 addCellModel:cell1_2];
    
    sectionModel1.footerModel = [HSFooterModel new];
    UIView * testView = [UIView new];
    testView.backgroundColor = [UIColor brownColor];
    
//    UIButton * testButt = [UIButton buttonWithType:UIButtonTypeCustom];
//    [testView addSubview:testButt];
//    testButt.backgroundColor = [UIColor redColor];
//
//    UIButton * testButt2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [testView addSubview:testButt2];
//    testButt2.backgroundColor = [UIColor blueColor];
    
    UILabel * testLab = [UILabel new];
    testLab.numberOfLines = 0;
    testLab.text = @"因为布局约束就是要脱离frame这种表达方式的，可是动画是需要根据这个来执行，这里面就会有些矛盾，不过";
    
    [testView addSubview:testLab];
    testLab.backgroundColor = [UIColor brownColor];
    [testLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@50);
        make.top.equalTo(@7);
        make.width.equalTo(@200);
        make.bottom.equalTo(@-20);
        
    }];
    
    
//
//    [testButt  mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.top.equalTo(@0);
//        make.right.equalTo(@-100);
//        make.height.equalTo(@35);
//    }];
//
//    [testButt2  mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(@0);
//        make.top.equalTo(testButt.mas_bottom);
//        make.right.equalTo(@-100);
//        make.height.equalTo(@35);
//    }];
    
   
    
    sectionModel1.footerModel.footerView = testView;

    
    HSSectionModel * sectionModel2 = [HSSectionModel new];
    
    HSBaseCellModel * cell2_1 = [HSBaseCellModel new];
    cell2_1.type = 1;
    cell2_1.title = @"3333333";
    
    HSBaseCellModel * cell2_2 = [HSBaseCellModel new];
    cell2_2.type = 1;
    cell2_2.title = @"444444";
    
    [sectionModel2 addCellModel:cell2_1];
    [sectionModel2 addCellModel:cell2_2];

    
    
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:sectionModel1,sectionModel2,nil];
    [table setHS_dataArray:arr];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[UIApplication sharedApplication]keyWindow].rootViewController = [UIViewController new];
//    });
    
    
    NSDictionary * testDIC = @{@"name":@"小明",@"age":@"18"};
    
    [AutoModelFileManager autoModelFileWithName:@"Student" ClassName:@"Student" superModelName:nil dictionary:testDIC currentPath:[NSString stringWithUTF8String:__FILE__] remarkBlock:^NSDictionary *{
        
        return nil;
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
