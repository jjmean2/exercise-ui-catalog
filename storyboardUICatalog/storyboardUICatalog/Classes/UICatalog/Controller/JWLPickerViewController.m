//
//  JWLPickerViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLPickerViewController.h"

@interface JWLPickerViewController() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) IBOutlet UIView *colorView;
@property (nonatomic, weak) IBOutlet UIPickerView *colorPicker;
@property (nonatomic, copy) NSArray *values;
@end


@implementation JWLPickerViewController

# pragma mark - property accessor method
// lazy instantiation
- (NSArray *)values {
    if(!_values) {
        NSMutableArray *values = [[NSMutableArray alloc] init];
        for(int i=0; i<52; i++) {
            [values addObject:[NSString stringWithFormat:@"%d", i*5]];
        }
        _values = [values copy];
    }
    return _values;
}


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.colorPicker selectRow:65/5 inComponent:0 animated:NO];
    [self.colorPicker selectRow:205/5 inComponent:1 animated:NO];
    [self.colorPicker selectRow:120/5 inComponent:2 animated:NO];
    [self changeBackgroundColorByPickerView:self.colorPicker];
}

#pragma mark - picker view data source
// Picker view column 수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}
// Picker view 특정 column의 row 수
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.values count];
}



#pragma mark - picker view delegate
// Picker view 특정 column, 특정 row의 data(Attributed String)
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *string = self.values[row];
    
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
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : color };
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    return attributedTitle;
}

// 선택되었을 때
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self changeBackgroundColorByPickerView:pickerView];

}

- (void)changeBackgroundColorByPickerView:(UIPickerView *)pickerView {
    NSInteger red;
    NSInteger green;
    NSInteger blue;
    
    NSString *redString = self.values[[pickerView selectedRowInComponent:0]];
    NSString *greenString = self.values[[pickerView selectedRowInComponent:1]];
    NSString *blueString = self.values[[pickerView selectedRowInComponent:2]];
    
    red = [redString integerValue];
    green = [greenString integerValue];
    blue = [blueString integerValue];
    
    self.colorView.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0  alpha:1.0];
}

@end
