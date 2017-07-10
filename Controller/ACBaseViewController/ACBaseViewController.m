//
//  ACBaseViewController.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/13.
//  Copyright © 2017年 孤岛. All rights reserved.
//
#import "ACNetworkHelper.h"
#import "ACBaseViewController.h"
#import "ACHelper.h"
#import <QuartzCore/QuartzCore.h>
#import "ACBluetoothViewController.h"
#import <CoreLocation/CoreLocation.h>
#define leftitle kscreenWidth /4 - 25
#define righttitle kscreenWidth /2 + 45
#define leftInfo kscreenWidth /4 - 15
#define rightInfo kscreenWidth /2 + 55

@interface ACBaseViewController ()<CLLocationManagerDelegate,UIScrollViewDelegate>
@property(nonatomic,strong) CLLocationManager *Loc ;
@property(nonatomic,strong) UILabel *todayweather;
@property(nonatomic,strong) UIScrollView *backgroundScro;
@end

@implementation ACBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup{
    [self getlocation];
    [self initScroView];
    [self initUI];
}

/**
 初始化滚动界面
 */
-(void)initScroView{
    self.backgroundScro = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kscreenWidth, kscreenHeight)];
    self.backgroundScro.backgroundColor = [UIColor colorWithRed:232/255.0 green:136/255.0 blue:145/255.0 alpha:1];
    self.backgroundScro.delegate = self;
    self.backgroundScro.contentSize = CGSizeMake(kscreenWidth, kscreenHeight+10);
    self.backgroundScro.bounces = YES;
    self.backgroundScro.scrollEnabled = YES;
    self.backgroundScro.showsVerticalScrollIndicator = NO;
    self.backgroundScro.showsHorizontalScrollIndicator = NO;
    self.backgroundScro.contentOffset = CGPointMake(0, 0);
    [self.view addSubview:self.backgroundScro];
}
-(void)initUI{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置Item颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:232/255.0 green:136/255.0 blue:145/255.0 alpha:1];

    //设置起飞地目的地
    UILabel *DepartureCity = [self getLabelWitchisBold:YES withText:@"北京" andFont:26 andFramex:(kscreenWidth/4) Framey:45];
    [self.backgroundScro addSubview:DepartureCity];
    UIImage *img = [UIImage imageNamed:@"Airplane Take Off Filled-50"];
    UIImageView *ImgView = [[UIImageView alloc]initWithImage:img];
    ImgView.center = CGPointMake(self.view.center.x, 46);
    [self.backgroundScro addSubview:ImgView];
    UILabel *DestinationCity = [self getLabelWitchisBold:YES withText:@"重庆" andFont:26 andFramex:(kscreenWidth * 3/4) Framey:45];
    [self.backgroundScro addSubview:DestinationCity];
    //设置机票详细页面
    UIView *detailView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, kscreenWidth -20, kscreenHeight*2/3)];
    detailView.backgroundColor = [UIColor colorWithRed:244/255.0 green:220/255.0 blue:219/255.0 alpha:1];
    detailView.layer.shadowColor = [UIColor blackColor].CGColor;
    detailView.layer.shadowOpacity = 0.5f;
    detailView.layer.shadowRadius = 4.f;
    detailView.layer.shadowOffset = CGSizeMake(0,0);
    [self.backgroundScro addSubview:detailView];
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
    
    UILabel *weather = [self getLabelWitchisBold:NO withText:@"天气" andFont:14 andFramex:righttitle Framey:350];
    [weather setTextColor:[UIColor grayColor]];
    [detailView addSubview:weather];
    
    _todayweather =[self getLabelWitchisBold:YES withText:@"00" andFont:38 andFramex:rightInfo -25 Framey:380];
    [detailView addSubview:_todayweather];
    
    UILabel *symbol = [self getLabelWitchisBold:YES withText:@"°C  " andFont:18 andFramex:rightInfo + 10 Framey:378];
    [detailView addSubview:symbol];

    
    
    
    //智能小车按钮
    UIButton *car = [[UIButton alloc]initWithFrame:CGRectMake(rightInfo + 5, 10, 80, 40)];
    [car setTitle:@"智能小车" forState:UIControlStateNormal];
    car.titleLabel.font = [UIFont systemFontOfSize:17];
    car.backgroundColor = [UIColor colorWithRed:216/255.0 green:87/255.0 blue:113/255.0 alpha:1];
    car.layer.shadowColor = [UIColor blackColor].CGColor;
    car.layer.shadowOpacity = 0.35f;
    car.layer.shadowRadius = 4.f;
    car.layer.shadowOffset = CGSizeMake(0,0);
    [car addTarget:self action:@selector(pushtoBluetooth) forControlEvents:UIControlEventTouchUpInside];
    [detailView addSubview:car];
}



/**
 获取定位
 */
-(void)getlocation{
    
    if ([CLLocationManager locationServicesEnabled]) {
        _Loc = [[CLLocationManager alloc]init];
        _Loc.delegate = self;
        //开始定位
        [_Loc startUpdatingLocation];
    }else{
        NSLog(@"并不能定位");
    }
}

/**
 获取天气情况
 */
-(void)getWeatherDatawithCity:(NSString *)City{
    
    NSString *URL = [NSString stringWithFormat:@"now?city=%@&key=%@",City,myKey];
    NSString *URLText = [URL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [[ACNetworkHelper sharedManager]GET:URLText parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        NSArray *foreCast = [dic objectForKey:@"HeWeather5"];
        [foreCast enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSDictionary *today = obj;
            NSDictionary *nowDic = today[@"now"];
            _todayweather.text  = nowDic[@"tmp"];
            
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取失败");
    }];
}

/**
 切换页面
 */
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




#pragma mark -  CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSString *city = placemark.locality;
            [self getWeatherDatawithCity:city];
            if (!city) {
                city = placemark.administrativeArea;
                
            }
        }else if (error == nil && [placemarks count] == 0){
            
            NSLog(@"No results were returned.");
            
        }else if (error != nil){
            
            NSLog(@"An error occurred = %@", error);
            
        }
    }];
    [manager stopUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@失败了 原因是：\n",error);
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
