//
//  GTLocation.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/13.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>
@interface GTLocation ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *manager;
@end
@implementation GTLocation
+ (GTLocation *)locationManager {
    static  GTLocation * locationManager ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        locationManager = [[GTLocation alloc] init];
        
    });
    
    return locationManager ;

}
- (instancetype)init {
    self = [super init];
    if (self ) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;

    }
    return self;
}
- (void)checkLocationAuthorization {
    // 判断系统是否开启
    if(![CLLocationManager locationServicesEnabled]){
        // 引导用户开启系统权限
        
    }
    
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        
        [self.manager requestWhenInUseAuthorization ];
    }
    
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {\
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager startUpdatingLocation];
    }else if (status == kCLAuthorizationStatusDenied){
        
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    NSLog(@"");
    
    //地理信息
    CLLocation *location = [locations firstObject];
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       // 地标信息
        
        
    }];
    [self.manager stopUpdatingLocation];
}
@end
