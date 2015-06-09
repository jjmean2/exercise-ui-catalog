//
//  JWLCustomToolbarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLCustomToolbarViewController.h"
#import "UIColor+TintColor.h"

@interface JWLCustomToolbarViewController () <UIToolbarDelegate>

@end

@implementation JWLCustomToolbarViewController

#pragma mark - view controller life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Custom Toolbar";
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBackgroundImage:[UIImage imageNamed:@"toolbar_background_1x"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    NSArray *buttons = @[
                         [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tools_icon_1x"] style:UIBarButtonItemStylePlain target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:nil action:nil]
                        ];
    [toolbar setItems:buttons];
    [toolbar sizeToFit];
    toolbar.tintColor = [UIColor wineColor];
    
    CGRect frame = toolbar.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height - 49.0;
    toolbar.frame = frame;
    NSLog(@"%@", toolbar);
    
    [self.view addSubview:toolbar];
    
    
}


@end
