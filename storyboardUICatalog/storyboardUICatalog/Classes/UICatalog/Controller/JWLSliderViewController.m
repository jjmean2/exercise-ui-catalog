//
//  JWLSliderViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLSliderViewController.h"
#import "UIColor+TintColor.h"

@interface JWLSliderViewController ()

@property (nonatomic, weak) IBOutlet UISlider *customSlider;

@end

@implementation JWLSliderViewController


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customSlider setMinimumTrackImage:[UIImage imageNamed:@"slider_blue_track"] forState:UIControlStateNormal];
    [self.customSlider setMaximumTrackImage:[UIImage imageNamed:@"slider_green_track"] forState:UIControlStateNormal];
    [self.customSlider setThumbImage:[UIImage imageNamed:@"slider_thumb"] forState:UIControlStateNormal];
}



@end