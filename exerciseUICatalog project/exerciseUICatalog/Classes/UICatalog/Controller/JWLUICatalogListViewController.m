//
//  JWLUICatalogListViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLUICatalogListViewController.h"
#import "JWLActivityIndicatorViewController.h"
#import "JWLAlertControllerViewController.h"
#import "JWLButtonViewController.h"
#import "JWLDatePickerController.h"
#import "JWLImageViewController.h"
#import "JWLPageControlViewController.h"
#import "JWLPickerViewController.h"
#import "JWLProgressViewController.h"
#import "JWLSegmentedControlViewController.h"
#import "JWLSliderViewController.h"
#import "JWLStepperViewController.h"
#import "JWLSwitchViewController.h"
#import "JWLTextFieldViewController.h"
#import "JWLTextViewController.h"
#import "JWLWebViewController.h"
#import "JWLSearchListViewController.h"
#import "JWLToolbarListViewController.h"
#import "JWLWorldTimeViewController.h"


@interface JWLUICatalogListViewController()
@property (nonatomic, strong) NSMutableArray *catalogList;  // 셀에 들어갈 목록
@end


// 내비게이션 루트뷰컨트롤러
@implementation JWLUICatalogListViewController

#pragma mark - 뷰컨트롤러 라이프 사이클
// 지정 초기화 메소드 재정의
- (instancetype)initWithStyle:(UITableViewStyle)style {
    NSLog(@"== %@, %@ start =======================", self, NSStringFromSelector(_cmd));

    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.navigationItem.title = @"UICatalog";
        
        _catalogList = [[NSMutableArray alloc] init];
        [_catalogList addObject:@[@"Activity Indicators", @"JWLActivityIndicatorViewController"]];
        [_catalogList addObject:@[@"Alert Controller", @"JWLAlertControllerViewController"]];
        [_catalogList addObject:@[@"Buttons", @"JWLButtonViewController"]];
        [_catalogList addObject:@[@"Date Picker", @"JWLDatePickerController"]];
        [_catalogList addObject:@[@"Image View", @"JWLImageViewController"]];
        [_catalogList addObject:@[@"Page Control", @"JWLPageControlViewController"]];
        [_catalogList addObject:@[@"Picker View", @"JWLPickerViewController"]];
        [_catalogList addObject:@[@"Progress Views", @"JWLProgressViewController"]];
        [_catalogList addObject:@[@"Segmented Controls", @"JWLSegmentedControlViewController"]];
        [_catalogList addObject:@[@"Sliders", @"JWLSliderViewController"]];
        [_catalogList addObject:@[@"Steppers", @"JWLStepperViewController"]];
        [_catalogList addObject:@[@"Switches", @"JWLSwitchViewController"]];
        [_catalogList addObject:@[@"Text Fields", @"JWLTextFieldViewController"]];
        [_catalogList addObject:@[@"Text View", @"JWLTextViewController"]];
        [_catalogList addObject:@[@"Web View", @"JWLWebViewController"]];
        [_catalogList addObject:@[@"Search", [NSNull null]]];
        [_catalogList addObject:@[@"Toolbars", [NSNull null]]];
        [_catalogList addObject:@[@"World Time", [NSNull null]]];
    }
    
    NSLog(@"== %@, %@ end =======================", self, NSStringFromSelector(_cmd));
    return self;
}

#pragma mark - 테이블뷰 라이프 사이클
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellSubtitle"];
}


#pragma mark - 테이블뷰 DataSource 메소드
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.catalogList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellSubtitle"];
    if(!cell) {
        NSLog(@"cell will be created");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellSubtitle"];
    }
    
    cell.textLabel.text = [[self.catalogList objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    
    if(self.catalogList[indexPath.row][1] != [NSNull null]) {
        cell.detailTextLabel.text = [[self.catalogList objectAtIndex:indexPath.row] objectAtIndex:1];
        cell.detailTextLabel.font = [UIFont systemFontOfSize: 10.0];
    }
    else {
        cell.detailTextLabel.text = nil;
    }
    return cell;
}



#pragma mark - 테이블뷰 Delegate 메소드
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch(indexPath.row) {
        case 0:
            [self enterActivityIndicatorsInfo];
            break;
        case 1:
            [self enterAlertControllerInfo];
            break;
        case 2:
            [self enterButtonsInfo];
            break;
        case 3:
            [self enterDatePickerInfo];
            break;
        case 4:
            [self enterImageViewInfo];
            break;
        case 5:
            [self enterPageControlInfo];
            break;
        case 6:
            [self enterPickerViewInfo];
            break;
        case 7:
            [self enterProgressViewInfo];
            break;
        case 8:
            [self enterSegmentedControlInfo];
            break;
        case 9:
            [self enterSliderInfo];
            break;
        case 10:
            [self enterStepperInfo];
            break;
        case 11:
            [self enterSwitchInfo];
            break;
        case 12:
            [self enterTextFieldInfo];
            break;
        case 13:
            [self enterTextViewInfo];
            break;
        case 14:
            [self enterWebViewInfo];
            break;
        case 15:
            [self enterSearchInfo];
            break;
        case 16:
            [self enterToolbarsInfo];
            break;
        case 17:
            [self enterWorldTime];
            break;
        default:
            break;
    }
    
}

#pragma mark - 행 선택시 실행 메소드 (상세정보)

- (void)enterActivityIndicatorsInfo {
    JWLActivityIndicatorViewController *activityIndicatorVC
        = [[JWLActivityIndicatorViewController alloc] init];
    [self.navigationController pushViewController:activityIndicatorVC animated:YES];
}

- (void)enterAlertControllerInfo {
    JWLAlertControllerViewController *alertControllerVC
        = [[JWLAlertControllerViewController alloc] init];
    [self.navigationController pushViewController:alertControllerVC animated:YES];
}

- (void)enterButtonsInfo {
    JWLButtonViewController *buttonVC
        = [[JWLButtonViewController alloc] init];
    [self.navigationController pushViewController:buttonVC animated:YES];
}

- (void)enterDatePickerInfo {
    JWLDatePickerController *datePickerVC
        = [[JWLDatePickerController alloc] init];
    [self.navigationController pushViewController:datePickerVC animated:YES];
}

- (void)enterImageViewInfo {
    JWLImageViewController *imageVC
        = [[JWLImageViewController alloc] init];
    [self.navigationController pushViewController:imageVC animated:YES];
}

- (void)enterPageControlInfo {
    JWLPageControlViewController *pageControlVC
    = [[JWLPageControlViewController alloc] init];
    [self.navigationController pushViewController:pageControlVC animated:YES];
}

- (void)enterPickerViewInfo {
    JWLPickerViewController *pickerViewVC
    = [[JWLPickerViewController alloc] init];
    [self.navigationController pushViewController:pickerViewVC animated:YES];
}

- (void)enterProgressViewInfo {
    JWLProgressViewController *progressViewVC
    = [[JWLProgressViewController alloc] init];
    [self.navigationController pushViewController:progressViewVC animated:YES];
    
}

- (void)enterSegmentedControlInfo {
    JWLSegmentedControlViewController *segmentedControlVC
    = [[JWLSegmentedControlViewController alloc] init];
    [self.navigationController pushViewController:segmentedControlVC animated:YES];
}

- (void)enterSliderInfo {
    JWLSliderViewController *sliderVC
    = [[JWLSliderViewController alloc] init];
    [self.navigationController pushViewController:sliderVC animated:YES];
}

- (void)enterStepperInfo {
    JWLStepperViewController *stepperVC
    = [[JWLStepperViewController alloc] init];
    [self.navigationController pushViewController:stepperVC animated:YES];
}

- (void)enterSwitchInfo {
    JWLSwitchViewController *switchVC
    = [[JWLSwitchViewController alloc] init];
    [self.navigationController pushViewController:switchVC animated:YES];
}

- (void)enterTextFieldInfo {
    JWLTextFieldViewController *textFieldVC
    = [[JWLTextFieldViewController alloc] init];
    [self.navigationController pushViewController:textFieldVC animated:YES];
}

- (void)enterTextViewInfo {
    JWLTextViewController *textViewVC
    = [[JWLTextViewController alloc] init];
    [self.navigationController pushViewController:textViewVC animated:YES];
}

- (void)enterWebViewInfo {
    JWLWebViewController *webViewVC
    = [[JWLWebViewController alloc] init];
    [self.navigationController pushViewController:webViewVC animated:YES];
}

- (void)enterSearchInfo {
    JWLSearchListViewController *searchListVC
    = [[JWLSearchListViewController alloc] init];
    [self.navigationController pushViewController:searchListVC animated:YES];
}

- (void)enterToolbarsInfo {
    JWLToolbarListViewController *toolbarListVC
    = [[JWLToolbarListViewController alloc] init];
    [self.navigationController pushViewController:toolbarListVC animated:YES];
}

- (void)enterWorldTime {
    JWLWorldTimeViewController *worldTimeVC
    = [[JWLWorldTimeViewController alloc] init];
    [self.navigationController pushViewController:worldTimeVC animated:YES];
}

@end
