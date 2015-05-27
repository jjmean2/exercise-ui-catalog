//
//  JWLStepperTableViewCell.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWLStepperTableViewCell : UITableViewCell

@property (nonatomic) NSInteger section;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIStepper *stepper;

@end
