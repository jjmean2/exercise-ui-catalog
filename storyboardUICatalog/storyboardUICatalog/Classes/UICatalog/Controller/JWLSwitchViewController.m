//
//  JWLSwitchViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSwitchViewController.h"
#import "UIColor+TintColor.h"

@interface JWLSwitchViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;
@end

@implementation JWLSwitchViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Switches";
        _sectionTitles = @[@"DEFAULT", @"TINTED"];
    }
    return self;
}


#pragma mark - 뷰 라이프 사이클

#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.sectionTitles[section];
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        for(UIView *v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
    }
    
    UISwitch *mySwitch = [[UISwitch alloc] init];
    mySwitch.center = cell.contentView.center;
    
    mySwitch.On = YES;
    
    [cell.contentView addSubview:mySwitch];
    
    if(indexPath.section == 1) {
        mySwitch.thumbTintColor = [UIColor wineColor];
        mySwitch.tintColor = [UIColor skyblueColor];
    }
    
    return cell;
}

#pragma mark - 회전방향 지원

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}


@end
