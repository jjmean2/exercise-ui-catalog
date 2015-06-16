//
//  JWLDatePickerController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLDatePickerController.h"

void CGRectPrint(CGRect rect, NSString *string);

@interface JWLDatePickerController ()

@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation JWLDatePickerController

#pragma mark - view life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self datePicked:self.datePicker];
}


#pragma mark - IBAction method
// date picker의 액션 메소드
- (IBAction)datePicked:(UIDatePicker *)sender {
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
    }
    self.dateLabel.text = [dateFormatter stringFromDate:sender.date];
}

@end
