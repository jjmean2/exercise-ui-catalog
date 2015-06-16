//
//  JWLStepperViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLStepperViewController.h"
#import "UIColor+TintColor.h"


@interface JWLStepperViewController ()

@property (nonatomic, weak) IBOutlet UIStepper *customStepper;

@property (nonatomic, weak) IBOutlet UILabel *defaultLabel;
@property (nonatomic, weak) IBOutlet UILabel *tintedLabel;
@property (nonatomic, weak) IBOutlet UILabel *customLabel;

@end

@implementation JWLStepperViewController

#pragma mark - view life cycle 
- (void)viewDidLoad {
    
    [self.customStepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background"] forState:UIControlStateNormal];
    [self.customStepper setBackgroundImage:[UIImage imageNamed:@"stepper_and_segment_background_disabled"] forState:UIControlStateDisabled];
    
}

#pragma mark - IBAction method
- (IBAction)clicked:(UIStepper *)sender {
    NSArray *labels = @[self.defaultLabel, self.tintedLabel, self.customLabel];
    int tag = (int)sender.tag;
    
    UILabel *label = labels[tag-1];
    label.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    
}



@end
