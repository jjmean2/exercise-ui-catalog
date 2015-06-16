//
//  JWLDatePickerInfoView.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLDatePickerInfoView.h"

void CGRectPrint(CGRect, NSString*);

@implementation JWLDatePickerInfoView

// 지정 초기화 메소드 재정의
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        _datePicker = [[UIDatePicker alloc] init];
        
        
        _dateLabel = [[UILabel alloc] init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        _dateLabel.text = [dateFormatter stringFromDate:_datePicker.date];
        [_dateLabel sizeToFit];
        CGRect frame = _dateLabel.frame;
        frame.size.width = _datePicker.frame.size.width;
        _dateLabel.frame = frame;
        
        [self addSubview:_datePicker];
        [self addSubview:_dateLabel];
    }
    return self;
}

// frame이 바뀌면 subviews의 위치 재설정(frame 재설정)
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];

    
    // Date Picker 중앙 세팅
    CGPoint center = self.center;
    self.datePicker.center = center;
    if(frame.size.width >frame.size.height) {
        CGRect dpframe = self.datePicker.frame;
        dpframe.origin.y -= 35.0;
        self.datePicker.frame = dpframe;
    }
    
    // Label 위치 세팅
    CGFloat originY = self.datePicker.frame.origin.y + self.datePicker.frame.size.height + 10.0;
    self.dateLabel.center = center;
    CGRect labelFrame = self.dateLabel.frame;
    labelFrame.origin.y = originY;
    self.dateLabel.frame = labelFrame;
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
