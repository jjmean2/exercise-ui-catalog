//
//  JWLTextFieldViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLTextFieldViewController.h"
#import "JWLCustomTextField.h"
#import "UIColor+TintColor.h"


@interface JWLTextFieldViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *tintedTextField;
@property (nonatomic, weak) IBOutlet UITextField *customTextField;
@end

@implementation JWLTextFieldViewController

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"text_field_purple_right_view"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    self.customTextField.rightView = iv;
    self.customTextField.rightViewMode = UITextFieldViewModeAlways;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@", self.customTextField.rightView);
}

#pragma mark - text field delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
