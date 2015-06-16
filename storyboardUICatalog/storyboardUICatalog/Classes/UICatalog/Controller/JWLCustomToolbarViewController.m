//
//  JWLCustomToolbarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLCustomToolbarViewController.h"
#import "UIColor+TintColor.h"

@interface JWLCustomToolbarViewController ()

@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;

@end

@implementation JWLCustomToolbarViewController
#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.toolbar setBackgroundImage:[UIImage imageNamed:@"toolbar_background"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
}

@end
