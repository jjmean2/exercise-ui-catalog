//
//  JWLStepperViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLStepperViewController.h"
#import "JWLStepperTableViewCell.h"
#import "UIColor+TintColor.h"


@interface JWLStepperViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSMutableArray *stepperValues;

@end

@implementation JWLStepperViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Steppers";
        _sectionTitles = @[@"DEFAULT", @"TINTED", @"CUSTOM"];
        _stepperValues = [[NSMutableArray alloc] init];
        for (int i=0; i<[_sectionTitles count]; i++) {
            [_stepperValues addObject:@0.0];
        }
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
    JWLStepperTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JWLStepperTableViewCell"];
    UIStepper *stepper;
    UILabel *valueLabel;
    if(!cell) {
        cell = [[JWLStepperTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JWLStepperTableViewCell"];
    } else {
        if([cell.stepper backgroundImageForState:UIControlStateNormal])
            [cell.stepper setBackgroundImage:nil forState:UIControlStateNormal];
        if([cell.stepper backgroundImageForState:UIControlStateDisabled])
            [cell.stepper setBackgroundImage:nil forState:UIControlStateDisabled];
        stepper.tintColor = nil;
    }
    
    cell.section = indexPath.section;
    stepper = cell.stepper;
    valueLabel = cell.valueLabel;
    
    
    NSNumber *value = self.stepperValues[indexPath.section];
    stepper.value = [value doubleValue];
    [stepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
    
    valueLabel.text = [NSString stringWithFormat:@"%d", (int)stepper.value];
    


    
    
    switch (indexPath.section%3) {
        case 0:
            stepper.maximumValue = 10;
            break;
        case 1:
            stepper.maximumValue = 100;
            stepper.tintColor = [UIColor skyblueColor];
            break;
            
        case 2:
            stepper.maximumValue = 100;
            [stepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_1x"] forState:UIControlStateNormal];
            [stepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_disabled_1x"] forState:UIControlStateDisabled];
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

#pragma mark - 컨트롤 액션 메소드

- (void)stepperAction:(UIStepper *)sender {
    JWLStepperTableViewCell *cell = (JWLStepperTableViewCell *)sender.superview.superview;
    NSInteger section = cell.section;
    UILabel *valueLabel = cell.valueLabel;
    valueLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    NSNumber *value = [NSNumber numberWithDouble:sender.value];
    [self.stepperValues replaceObjectAtIndex:section withObject:value];
    
}

#pragma mark - 회전방향지원



@end
