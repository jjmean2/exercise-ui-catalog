//
//  JWLDefaultToolbarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLDefaultToolbarViewController.h"

@interface JWLDefaultToolbarViewController ()

@end

@implementation JWLDefaultToolbarViewController

#pragma mark - view controller life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Default Toolbar";
    }
    return self;
}


#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIToolbar *toolbar = [[UIToolbar alloc] init];

    NSArray *buttons = @[
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc] initWithTitle:@"Action" style:UIBarButtonItemStylePlain target:nil action:nil]
                         ];
    [toolbar setItems:buttons];
    [toolbar sizeToFit];
    CGRect frame = toolbar.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height - 49.0;
    toolbar.frame = frame;

    

    NSLog(@"%@", toolbar);
    [self.view addSubview:toolbar];
}


@end
