//
//  JWLPickerViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLPickerViewController.h"
#import "JWLPickerViewInfoView.h"

@interface JWLPickerViewController() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) NSArray *pickerData;
@end


@implementation JWLPickerViewController

# pragma mark - 뷰컨트롤러 라이프 사이클

// 지정 초기화 메소드 재정의
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)bundleNameOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:bundleNameOrNil];
    if(self) {
        self.navigationItem.title = @"Picker View";
        
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for(int i=0; i<52; i++) {
            [temp addObject:[NSString stringWithFormat:@"%d", i*5]];
        }
        _pickerData = [temp copy];
    }
    return self;
}


#pragma mark - 뷰 라이프 사이클

- (void)loadView {
    JWLPickerViewInfoView *view = [[JWLPickerViewInfoView alloc] init];
    self.colorView = view.colorView;
    view.colorPicker.delegate = self;
    view.colorPicker.dataSource = self;
    [view.colorPicker selectRow:65/5 inComponent:0 animated:NO];
    [view.colorPicker selectRow:205/5 inComponent:1 animated:NO];
    [view.colorPicker selectRow:120/5 inComponent:2 animated:NO];
    [self changeBackgroundColorByPickerView:view.colorPicker];
    self.view = view;
    
}

#pragma mark - Picker view datasource 메소드

// Picker view column 수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// Picker view 특정 column의 row 수
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 52;
}




#pragma mark - Picker view delegate 메소드

// Picker view 특정 column, 특정 row의 data(String)
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = self.pickerData[row];
    return title;
}
// Picker view 특정 column, 특정 row의 data(Attributed String)
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *string = [self.pickerData objectAtIndex:row];
    UIColor *color = nil;
    switch (component) {
        case 0:
            color = [UIColor redColor];
            break;
        case 1:
            color = [UIColor greenColor];
            break;
        case 2:
            color = [UIColor blueColor];
            break;
        default:
            break;
    }
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, nil];
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    return attributedTitle;
}


// 선택되었을 때
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self changeBackgroundColorByPickerView:pickerView];
}

#pragma mark - Picker view 선택시 실행 메소드

- (void)changeBackgroundColorByPickerView:(UIPickerView *)pickerView {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    NSString *redPicked = self.pickerData[[pickerView selectedRowInComponent:0]];
    NSString *greenPicked = self.pickerData[[pickerView selectedRowInComponent:1]];
    NSString *bluePicked = self.pickerData[[pickerView selectedRowInComponent:2]];
    
    red = [redPicked floatValue];
    green = [greenPicked floatValue];
    blue = [bluePicked floatValue];
    
    self.colorView.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    NSLog(@"%@", self.colorView.backgroundColor);
}


@end
