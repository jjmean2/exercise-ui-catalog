//
//  JWLWorldTimeViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 20..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "JWLWorldTimeViewController.h"

@interface JWLWorldTimeViewController () <UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate>

@property (atomic, weak) NSTimer *timer;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) UILabel *nameOfSelectedCity;
@property (atomic, strong) UILabel *timeOfCurrentCity;
@property (atomic, strong) UILabel *timeOfSelectedCity;
@property (nonatomic, strong) UIPickerView *citySelector;
@property (atomic, strong) NSDateFormatter *formatter;
@property (atomic, strong) NSDateFormatter *selectedFormatter;
@property (nonatomic, strong) NSDictionary *cities;
@property (nonatomic, strong) NSArray *cityNames;

@end

@implementation JWLWorldTimeViewController

@synthesize locationManager;

#pragma mark - view controller life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil  {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"World Time";
        _formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"a hh : mm : ss";
        _selectedFormatter = [[NSDateFormatter alloc] init];
        _selectedFormatter.dateFormat = @"a hh : mm : ss";
        _cities = @{
                    @"서울, 대한민국" : @"Asia/Seoul",
                    @"북경, 중국" : @"Asia/Hong_Kong",
                    @"로스앤젤레스, 미국" : @"America/Los_Angeles",
                    @"뉴욕, 미국" : @"America/New_York",
                    @"파리, 프랑스" : @"Europe/Paris",
                    @"시드니, 호주" : @"Australia/Sydney",
                    @"모스크바, 러시아" : @"Europe/Moscow",
                    @"토론토, 캐나다" : @"America/Toronto",
                    @"시카고, 미국" : @"America/Chicago",
                    @"런던, 영국" : @"Europe/London",
                    @"두바이, 아랍에미리트" : @"Asia/Dubai",
                    @"도쿄, 일본" : @"Asia/Tokyo",
                    @"방콕, 태국" : @"Asia/Bangkok",
                    @"카이로, 이집트" : @"Africa/Cairo",
                    @"부에노스 아이레스, 아르헨티나" : @"America/Argentina/Buenos_Aires",
                    @"멕시코 시티, 멕시코" : @"America/Mexico_City"
                    
                    };
        
        _cityNames = [[_cities allKeys] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 위 아래 bar 제외한 frame
    CGRect visibleFrame = self.view.frame;
    visibleFrame.size.height -= 20.0 + 44.0 + 49.0;
    visibleFrame.origin.y += 20.0 + 44.0;
    
    // components 생성
    UILabel *nameOfCurrentCity = [[UILabel alloc] init];
    self.nameOfSelectedCity = [[UILabel alloc] init];
    self.timeOfCurrentCity = [[UILabel alloc] init];
    self.timeOfSelectedCity = [[UILabel alloc] init];
    self.citySelector = [[UIPickerView alloc] init];
    self.citySelector.delegate = self;
    self.citySelector.dataSource = self;
    
    // components 속성 설정
    /*
    nameOfCurrentCity.backgroundColor = [UIColor yellowColor];
    self.nameOfSelectedCity.backgroundColor = [UIColor blueColor];
    self.timeOfCurrentCity.backgroundColor = [UIColor greenColor];
    self.timeOfSelectedCity.backgroundColor = [UIColor lightGrayColor];
    self.citySelector.backgroundColor = [UIColor magentaColor];
    */
    nameOfCurrentCity.textAlignment = NSTextAlignmentCenter;
    self.nameOfSelectedCity.textAlignment = NSTextAlignmentCenter;
    self.timeOfCurrentCity.textAlignment = NSTextAlignmentCenter;
    self.timeOfSelectedCity.textAlignment = NSTextAlignmentCenter;
    
    self.timeOfCurrentCity.adjustsFontSizeToFitWidth = YES;
    
    
    // subview frame 계산
    // 현재 도시 이름 라벨
    CGRect subviewFrame = visibleFrame;
    subviewFrame.size.height /= 2.0;
    subviewFrame.size.width /=2.0;
    CGRect tempFrame = subviewFrame;
    subviewFrame = UIEdgeInsetsInsetRect(subviewFrame, UIEdgeInsetsMake(30.0, 20.0, 20.0, 10.0));
    CGFloat tempHeight = subviewFrame.size.height;
    subviewFrame.size.height *= 0.4;
    nameOfCurrentCity.frame = subviewFrame;
    
    // 현재 도시 시간 라벨
    subviewFrame.origin.y += subviewFrame.size.height;
    subviewFrame.size.height = tempHeight * 0.4;
    self.timeOfCurrentCity.frame = subviewFrame;
    
    // 선택 도시 이름 라벨
    subviewFrame = tempFrame;
    subviewFrame.origin.x += subviewFrame.size.width;
    subviewFrame = UIEdgeInsetsInsetRect(subviewFrame, UIEdgeInsetsMake(30.0, 10.0, 20.0, 20.0));
    tempHeight = subviewFrame.size.height;
    subviewFrame.size.height *= 0.4;
    self.nameOfSelectedCity.frame = subviewFrame;
    
    // 선택 도시 시간 라벨
    subviewFrame.origin.y += subviewFrame.size.height;
    subviewFrame.size.height = tempHeight * 0.4;
    self.timeOfSelectedCity.frame = subviewFrame;
    
    // 도시 선택기
    subviewFrame = visibleFrame;
    subviewFrame.size.height /= 2.0;
    subviewFrame.origin.y += subviewFrame.size.height*0.8;
    subviewFrame = CGRectInset(subviewFrame, 20.0, 20.0);
    self.citySelector.frame = subviewFrame;
    
    [self.view addSubview:nameOfCurrentCity];
    [self.view addSubview:self.nameOfSelectedCity];
    [self.view addSubview:self.timeOfCurrentCity];
    [self.view addSubview:self.timeOfSelectedCity];
    [self.view addSubview:self.citySelector];
    
    // 라벨 내용 설정
    [self.citySelector selectRow:0 inComponent:0 animated:NO];
    self.selectedFormatter.timeZone = [NSTimeZone timeZoneWithName:self.cities[self.cityNames[0]]];
    
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    NSString *tzName = [localTimeZone name];
    NSLog(@"%@", tzName);
    NSString *currentCity;
    for(NSString *key in [self.cities allKeys]) {
        NSLog(@"%@", key);
        if([tzName isEqualToString:self.cities[key]]) {
            currentCity = [key componentsSeparatedByString:@","][0];
            break;
        }
    }
    if(!currentCity) {
        currentCity = @"현재 지역";
    }
    
    
    nameOfCurrentCity.text = currentCity;
    self.nameOfSelectedCity.text = [self.cityNames[0] componentsSeparatedByString:@","][0];

 

}

- (void)viewWillAppear:(BOOL)animated {
    NSDate *now = [NSDate date];
    self.timeOfCurrentCity.text = [self.formatter stringFromDate:now];
    self.timeOfSelectedCity.text = [self.selectedFormatter stringFromDate:now];
    
    [NSThread detachNewThreadSelector:@selector(startTimer) toTarget:self withObject:nil];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
//    self.timer = timer;
}

- (void)viewDidDisappear:(BOOL)animated {
   [self.timer invalidate];
}

#pragma mark - timer thread



- (void)startTimer {
    @autoreleasepool {
        NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        self.timer = timer;
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop  addTimer:timer forMode:NSDefaultRunLoopMode];
        NSLog(@"hi");
        
        [runLoop run];
        



    }
}


- (void)updateTime {
    NSLog(@"updateTime");
    NSDate *now = [NSDate date];
//    self.timeOfCurrentCity.text = [self.formatter stringFromDate:now];
//    self.timeOfSelectedCity.text = [self.selectedFormatter stringFromDate:now];

    [self.timeOfCurrentCity performSelectorOnMainThread:@selector(setText:) withObject:[self.formatter stringFromDate:now] waitUntilDone:NO];
    [self.timeOfSelectedCity performSelectorOnMainThread:@selector(setText:) withObject:[self.selectedFormatter stringFromDate:now] waitUntilDone:NO];

}

#pragma mark - picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.cityNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.cityNames[row];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = [[UILabel alloc] init];
//    CGRect frame;
//    frame.size = [pickerView rowSizeForComponent:0];
//    label.frame = frame;
    label.frame = CGRectMake(0, 0, 320, 44);
    
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.cityNames[row];
    label.font = [UIFont systemFontOfSize:24.0];
    [label setAdjustsFontSizeToFitWidth:YES];
    return label;
}

#pragma mark - picker view delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.nameOfSelectedCity.text = [self.cityNames[row] componentsSeparatedByString:@","][0];
    self.selectedFormatter.timeZone = [NSTimeZone timeZoneWithName:self.cities[self.cityNames[row]]];
    [self updateTime];
}

#pragma mark - custom method


#pragma mark - location manager delegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"fail");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    NSLog(@"didUpdateLocations");

    [self.locationManager stopUpdatingLocation];
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:[locations lastObject]  completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *placemark in placemarks) {
            NSLog(@"%@", [placemark locality]);
        }
    }];
}


#pragma mark - orientation support setting
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
