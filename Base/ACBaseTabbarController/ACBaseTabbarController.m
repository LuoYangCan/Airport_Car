//
//  ACBaseTabbarController.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/11.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "ACBaseTabbarController.h"
#import "ACBaseViewController.h"
#import "ACUserViewController.h"
@interface ACBaseTabbarController ()
@property(nonatomic,strong) NSArray *Item;
@end

@implementation ACBaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabbar颜色
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:232/255.0 green:136/255.0 blue:145/255.0 alpha:1]];
    //设置tabbar不透明
    [UITabBar appearance].translucent = YES;

    [self initTabbar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTabbar{
    NSMutableArray *vcAr = [NSMutableArray arrayWithCapacity:[self getTabbarItem].count];
    for (NSDictionary *Dic in [self getTabbarItem]) {
        Class vcClass = NSClassFromString(Dic[@"viewcontroller_class"]);
        UIViewController *vc = [[vcClass alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.navigationItem.title = [Dic objectForKey:@"name"];
        vc.title = [Dic objectForKey:@"name"];
        NSString *img = Dic[@"icon"];
        UIImage *Image = [UIImage imageNamed:img];
        [navi.tabBarItem setImage:[Image imageWithRenderingMode:UIImageRenderingModeAutomatic]];
        [vcAr addObject:navi];
    }
    self.viewControllers = vcAr;
    self.selectedIndex = 0;
}


-(NSArray *)getTabbarItem{
    NSArray *Item = @[@{@"name":@"机场",
                        @"icon":@"Airport Filled-50",
                           @"viewcontroller_class":NSStringFromClass([ACBaseViewController class])},
                           @{@"name":@"个人",
                             @"icon":@"User Filled-50",
                             @"viewcontroller_class":NSStringFromClass([ACUserViewController class])
                               
                               }];
    return [Item copy];
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
