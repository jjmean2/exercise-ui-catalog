//
//  JWLDatePickerController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLDatePickerController.h"
#import "JWLDatePickerInfoView.h"

void CGRectPrint(CGRect rect, NSString *string);

@interface JWLDatePickerController ()

@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation JWLDatePickerController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Date Picker";
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

// 뷰 로딩, date picker 타깃 액션 설정
- (void)loadView {
    JWLDatePickerInfoView *view = [[JWLDatePickerInfoView alloc] init];
    self.dateLabel = view.dateLabel;
    [view.datePicker addTarget:self action:@selector(datePicked:) forControlEvents:UIControlEventValueChanged];
    
    self.view = view;
}

#pragma mark - UIControl(Date Picker) Action 메소드

// date picker의 액션 메소드
- (void)datePicked:(UIDatePicker *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    self.dateLabel.text = [dateFormatter stringFromDate:sender.date];
}

@end
