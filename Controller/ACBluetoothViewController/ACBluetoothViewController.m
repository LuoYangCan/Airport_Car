//
//  ACBluetoothViewController.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/13.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "ACBluetoothViewController.h"
#import "ACHelper.h"
@interface ACBluetoothViewController ()

@end

@implementation ACBluetoothViewController

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
    UIImage *paperplane = [UIImage imageNamed:@"Paper Plane-64"];
    UIImageView *Image = [[UIImageView alloc]initWithFrame:CGRectMake(kscreenWidth /2 - 40, 85, 80, 80)];
    [Image setImage:paperplane];
    [self.view addSubview:Image];
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
