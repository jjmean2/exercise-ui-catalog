//
//  JWLTextFieldViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 18..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLTextFieldViewController.h"
#import "JWLCustomTextField.h"
#import "UIColor+TintColor.h"


@interface JWLTextFieldViewController () <UITextFieldDelegate>
@property (nonatomic, strong) NSArray *sectionTitles;
@end

@implementation JWLTextFieldViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Text Fields";
        _sectionTitles = @[@"DEFAULT", @"TINTED", @"SECURE", @"SPECIFIC KEYBOARD", @"CUSTOM"];
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        for (UIView *v in cell.contentView.subviews) {
            [v removeFromSuperview];
        }
    }
    
    UITextField *textField;
        textField= [[JWLCustomTextField alloc] init];
        // text field frame 설정
        CGRect frame = cell.contentView.frame;
        frame.size.width = 220.0;
        frame.size.height = 44.0;
        frame.size.height -= 14.0;
        textField.frame = frame;
        textField.center = cell.contentView.center;

        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.placeholder = @"Placeholder text";
        textField.font = [UIFont systemFontOfSize:15.0];
        textField.delegate = self;
        textField.returnKeyType = UIReturnKeyDone;
        [cell.contentView addSubview:textField];

    
    switch (indexPath.section) {
        case 1:
            textField.tintColor = [UIColor skyblueColor];
            textField.textColor = [UIColor lightGreenColor];
            break;
            
        case 2:
            textField.secureTextEntry = YES;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            break;
        
        case 3:
            textField.keyboardType = UIKeyboardTypeEmailAddress;
            break;
            
        
        case 4:
        {
            textField.borderStyle = UITextBorderStyleNone;
            textField.background = [UIImage imageNamed:@"text_field_background_1x.png"];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:@"text_field_purple_right_view_1x"] forState:UIControlStateNormal];
            [button sizeToFit];
            textField.rightView = button;
            NSLog(@"%@", textField.rightView);
            NSLog(@"%@", textField.rightView.superview);
            textField.rightViewMode = UITextFieldViewModeAlways;
        }
            break;
        
        default:
            break;
    
    }
    
    
    
    
    return cell;
}

#pragma mark - 텍스트필드 Delegate 메소드

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - 회전방향 지원

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
