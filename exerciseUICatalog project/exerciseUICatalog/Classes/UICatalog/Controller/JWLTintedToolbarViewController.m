//
//  JWLTintedToolbarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTintedToolbarViewController.h"
#import "UIColor+TintColor.h"


@interface JWLTintedToolbarViewController ()

@end

@implementation JWLTintedToolbarViewController

#pragma mark - view controller life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Tinted Toolbar";
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    NSArray *buttons = @[
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil]
                         ];
    [toolbar setItems:buttons];
    [toolbar sizeToFit];

    toolbar.tintColor = [UIColor lightGreenColor];
    toolbar.barTintColor = [UIColor darkGreenColor];
    
    CGRect frame = toolbar.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height - 49.0;
    toolbar.frame = frame;
    
    [self.view addSubview:toolbar];
    
}

@end
