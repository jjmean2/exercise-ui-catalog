//
//  JWLSegmentedControlViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLSegmentedControlViewController.h"
#import "UIColor+TintColor.h"

@interface JWLSegmentedControlViewController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl *defaultSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *tintedSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *customSegmentedControl;
@property (nonatomic, weak) IBOutlet UISegmentedControl *backgroundSegmentedControl;


@end

@implementation JWLSegmentedControlViewController


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor wineColor] };
    [self.backgroundSegmentedControl setTitleTextAttributes:attributes
                                                forState:UIControlStateNormal];
    attributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
    [self.backgroundSegmentedControl setTitleTextAttributes:attributes
                                                   forState:UIControlStateSelected];
    [self.backgroundSegmentedControl setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background"]
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
    [self.backgroundSegmentedControl setDividerImage:[UIImage imageNamed:@"stepper_and_segment_divider"]
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
}



@end
