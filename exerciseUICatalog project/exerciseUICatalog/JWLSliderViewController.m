//
//  JWLSliderViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSliderViewController.h"
#import "UIColor+TintColor.h"

@interface JWLSliderViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation JWLSliderViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Sliders";
        
        _sectionTitles = @[@"DEFAULT", @"TINTED", @"CUSTOM"];
    }
    return self;
}

#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    UISlider *slider;
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        for(UIView *v in cell.contentView.subviews) {
            [v removeFromSuperview];
            NSLog(@"remove %@=", v);
        }
    }
    
    slider = [[UISlider alloc] init];
    NSLog(@"%@", slider);
    
    CGRect frame = slider.frame;
    frame.size.width = cell.contentView.frame.size.width - 40.0;
    slider.frame = frame;
    slider.center = cell.contentView.center;
    
    slider.value = 0.5;
    [cell.contentView addSubview:slider];

    
    switch (indexPath.section) {

        case 1:
            slider.minimumTrackTintColor = [UIColor skyblueColor];
            slider.maximumTrackTintColor = [UIColor wineColor];
            break;
            
        case 2:
            [slider setMinimumTrackImage:[UIImage imageNamed:@"slider_blue_track_1x"] forState:UIControlStateNormal];
            [slider setMaximumTrackImage:[UIImage imageNamed:@"slider_green_track_1x"] forState:UIControlStateNormal];
            [slider setThumbImage:[UIImage imageNamed:@"slider_thumb_1x"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
            
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.sectionTitles[section];
    return title;
}


#pragma mark - 회전방향 지원

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}




@end