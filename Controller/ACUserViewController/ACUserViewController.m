//
//  ACUserViewController.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/13.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "ACUserViewController.h"
#import "ACHelper.h"
@interface ACUserViewController ()
@end

@implementation ACUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initUI{
    self.view.backgroundColor = kBackgroundGray;
    //设置Item颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:232/255.0 green:136/255.0 blue:145/255.0 alpha:1];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
