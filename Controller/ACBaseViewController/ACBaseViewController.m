//
//  ACBaseViewController.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/13.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "ACBaseViewController.h"
#import "ACHelper.h"
#import <QuartzCore/QuartzCore.h>
#import "ACBluetoothViewController.h"
#define leftitle kscreenWidth /4 - 25
#define righttitle kscreenWidth /2 + 45
#define leftInfo kscreenWidth /4 - 15
#define rightInfo kscreenWidth /2 + 55

@interface ACBaseViewController ()

@end

@implementation ACBaseViewController

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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //设置起飞地目的地
    UILabel *DepartureCity = [self getLabelWitchisBold:YES withText:@"北京" andFont:26 andFramex:(kscreenWidth/4) Framey:45];
    [self.view addSubview:DepartureCity];
    UIImage *img = [UIImage imageNamed:@"Airplane Take Off Filled-50"];
    UIImageView *ImgView = [[UIImageView alloc]initWithImage:img];
    ImgView.center = CGPointMake(self.view.center.x, 46);
    [self.view addSubview:ImgView];
    UILabel *DestinationCity = [self getLabelWitchisBold:YES withText:@"重庆" andFont:26 andFramex:(kscreenWidth * 3/4) Framey:45];
    [self.view addSubview:DestinationCity];
    //设置机票详细页面
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, kscreenWidth -20, kscreenHeight*2/3)];
    detailView.backgroundColor = [UIColor whiteColor];
    detailView.layer.shadowColor = [UIColor blackColor].CGColor;
    detailView.layer.shadowOpacity = 0.5f;
    detailView.layer.shadowRadius = 4.f;
    detailView.layer.shadowOffset = CGSizeMake(0,0);
    [self.view addSubview:detailView];
    UILabel *airlines = [self getLabelWitchisBold:YES withText:@"XX航空公司" andFont:20 andFramex:(kscreenWidth / 4 -10) Framey:30];
    [detailView addSubview:airlines];
    UILabel *passager = [self getLabelWitchisBold:NO withText:@"乘客信息" andFont:14 andFramex:(leftitle) Framey:80];
    [passager setTextColor:[UIColor grayColor]];
    [detailView addSubview:passager];
    UILabel *passagerDetail = [self getLabelWitchisBold:YES withText:@"Reus " andFont:21 andFramex:(leftInfo) Framey:110];
    [detailView addSubview:passagerDetail];
    
    UILabel *Connection = [self getLabelWitchisBold:NO withText:@"连接状态" andFont:14 andFramex:(righttitle) Framey:80];
    [Connection setTextColor:[UIColor grayColor]];
    [detailView addSubview:Connection];
    
    UILabel *ConnectionD = [self getLabelWitchisBold:YES withText:@"已连接" andFont:21 andFramex:(rightInfo) Framey:110];
    [detailView addSubview:ConnectionD];
    
    UILabel *takeoffTime = [self getLabelWitchisBold:NO withText:@"起飞时间" andFont:14 andFramex:(leftitle) Framey:170];
    [takeoffTime setTextColor:[UIColor grayColor]];
    [detailView addSubview:takeoffTime];
    
    UILabel *takeoffTimeD = [self getLabelWitchisBold:YES withText:@"19:45" andFont:21 andFramex:leftInfo Framey:200];
    [detailView addSubview:takeoffTimeD];
    
    UILabel *boarding = [self getLabelWitchisBold:NO withText:@"登机口" andFont:14 andFramex:righttitle Framey:170];
    [boarding setTextColor:[UIColor grayColor]];
    [detailView addSubview:boarding];
    
    UILabel *boardingD = [self getLabelWitchisBold:YES withText:@"A10 " andFont:21 andFramex:rightInfo Framey:200];
    [detailView addSubview:boardingD];
    
    UILabel *takeoffPlace = [self getLabelWitchisBold:NO withText:@"起飞地点" andFont:14 andFramex:(leftitle) Framey:260];
    [takeoffPlace setTextColor:[UIColor grayColor]];
    [detailView addSubview:takeoffPlace];
    
    UILabel *takeoffPlaceD= [self getLabelWitchisBold:YES withText:@"北京首都机场" andFont:21 andFramex:(leftInfo) Framey:290];
    [detailView addSubview:takeoffPlaceD];
    
    UILabel *landingPlace = [self getLabelWitchisBold:NO withText:@"着陆地点" andFont:14 andFramex:righttitle Framey:260];
    [landingPlace setTextColor:[UIColor grayColor]];
    [detailView addSubview:landingPlace];
    
    UILabel *landingPlaceD = [self getLabelWitchisBold:YES withText:@"重庆江北机场" andFont:21 andFramex:rightInfo Framey:290];
    [detailView addSubview:landingPlaceD];
    
    UILabel *seat = [self getLabelWitchisBold:NO withText:@"座位号" andFont:14 andFramex:leftitle Framey:350];
    [seat setTextColor:[UIColor grayColor]];
    [detailView addSubview:seat];
    
    UILabel *seatD = [self getLabelWitchisBold:YES withText:@"7排7座 " andFont:21 andFramex:leftInfo Framey:380];
    [detailView addSubview:seatD];
    
    //智能小车按钮
    UIButton *car = [[UIButton alloc]initWithFrame:CGRectMake(rightInfo + 5, 10, 80, 40)];
    [car setTitle:@"智能小车" forState:UIControlStateNormal];
    car.titleLabel.font = [UIFont systemFontOfSize:17];
    car.backgroundColor = [UIColor blueColor];
    car.layer.shadowColor = [UIColor blackColor].CGColor;
    car.layer.shadowOpacity = 0.35f;
    car.layer.shadowRadius = 4.f;
    car.layer.shadowOffset = CGSizeMake(0,0);
    [car addTarget:self action:@selector(pushtoBluetooth) forControlEvents:UIControlEventTouchUpInside];
    [detailView addSubview:car];
}

-(void)pushtoBluetooth{
    ACBluetoothViewController *btVc = [[ACBluetoothViewController alloc]init];
    [self presentViewController:btVc animated:YES completion:nil];
}

-(UILabel *)getLabelWitchisBold:(BOOL)Bold withText:(NSString *)text andFont:(CGFloat)Font andFramex:(CGFloat )x Framey:(CGFloat )y {
    UILabel *baseLabel = [[UILabel alloc]init];
    baseLabel.text = text;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:Font]
                                 };
//    CGSize size = [baseLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:Font]
//                                                       }];
    CGRect rect = [baseLabel.text boundingRectWithSize:CGSizeMake(baseLabel.frame.size                                               .width, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];
    CGRect frame = baseLabel.frame;
    frame.size = CGSizeMake(rect.size.width, rect.size.height);
    baseLabel.frame = frame;
    baseLabel.center = CGPointMake(x, y);
    if (Bold) {
        baseLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:Font];
    }else{
        baseLabel.font = [UIFont fontWithName:@"Helvetica" size:Font];
    }
    return baseLabel;
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
