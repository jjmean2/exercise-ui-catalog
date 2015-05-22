//
//  JWLSegmentedControlViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSegmentedControlViewController.h"

@interface JWLSegmentedControlViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation JWLSegmentedControlViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Segmented Controls";
        _sectionTitles = @[@"DEFAULT", @"TINTED", @"CUSTOM SEGMENTS", @"CUSTOM BACKGROUND"];
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if([cell.contentView.subviews count]>0) {
        NSLog(@"cell subview %@", cell.contentView.subviews);
        for(UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    
    NSArray *items = @[@"Check", @"Search", @"Tools"];
    
    UISegmentedControl *segmentedControl = nil;
    
    switch (indexPath.section) {
        case 0:
            segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
            [segmentedControl setEnabled:NO forSegmentAtIndex:0];
            segmentedControl.momentary = YES;
            break;
        case 1:
            segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
            segmentedControl.tintColor = [UIColor colorWithRed:85.0/255 green:194.0/255 blue:255.0/255 alpha:1.0];
            segmentedControl.selectedSegmentIndex = 1;
            break;
        case 2:
            segmentedControl = [[UISegmentedControl alloc] init];
            [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"checkmark_icon_1x.png"] atIndex:0 animated:NO];
            [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"search_icon_1x.png"] atIndex:1 animated:NO];
            [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"tools_icon_1x.png"] atIndex:2 animated:NO];
            [segmentedControl sizeToFit];
            segmentedControl.selectedSegmentIndex = 0;
            break;
        default:
            segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
            [segmentedControl setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:148.0/255 green:42.0/255 blue:255.0/255 alpha:1.0] }forState:UIControlStateNormal];
            [segmentedControl setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] } forState:UIControlStateSelected];
            [segmentedControl setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_1x.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
            [segmentedControl setDividerImage:[UIImage imageNamed:@"stepper_and_segment_segment_divider_1x.png"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
            segmentedControl.selectedSegmentIndex = 2;
            break;
            
    }
    
    
    [cell.contentView addSubview:segmentedControl];
    CGRect frame = segmentedControl.frame;
    frame.size.width = cell.contentView.frame.size.width - 40.0;
    segmentedControl.frame = frame;
    segmentedControl.center = cell.contentView.center;

    NSLog(@"%@", segmentedControl);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 29.0 *3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.sectionTitles[section];
    return title;
}

#pragma mark - 회전 지원

- (NSUInteger)supportedInterfaceOrientations {
    NSLog(@"supportedInterfaceOrientations, SegmentedControl");
    
    return UIInterfaceOrientationMaskPortrait;
}



@end
