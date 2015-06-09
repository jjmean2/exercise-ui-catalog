//
//  JWLAlertControllerViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 8..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLAlertControllerViewController.h"

@interface JWLAlertControllerViewController ()
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSDictionary *sectionItems;
@property (nonatomic, strong) UIAlertController *alertController;
@end

@implementation JWLAlertControllerViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

// 지정 초기화 메소드 재정의
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Alert Controllers";
        _sectionTitles = [NSArray arrayWithObjects:@"ALERT STYLE", @"ACTION SHEET STYLE", nil];
        _sectionItems = [NSDictionary dictionaryWithObjectsAndKeys:
                         @[@"Simple", @"Okay / Cancel", @"Other", @"Text Entry", @"Secure Text Entry"], _sectionTitles[0],
                         @[@"Okay / Cancel", @"Other"], _sectionTitles[1], nil];
    }
    return self;
}


#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellDefault"];
}


#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = self.sectionTitles[section];
    NSArray *sectionItems = self.sectionItems[sectionTitle];
    return [sectionItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellDefault" forIndexPath:indexPath];
    NSString *sectionTitle = self.sectionTitles[indexPath.section];
    cell.textLabel.text = self.sectionItems[sectionTitle][indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}

#pragma mark - 테이블뷰 Delegate 메소드

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *sectionTitle = self.sectionTitles[indexPath.section];
    NSArray *sectionItems = self.sectionItems[sectionTitle];
    NSString *itemTitle = sectionItems[indexPath.row];
    NSLog(@"%@", itemTitle);
    
    NSString *alertTitle = @"A Short Title is Best";
    NSString *alertMessage = @"A message should be a short, complete sentence.";
    
    if([sectionTitle isEqualToString:@"ALERT STYLE"]) {
    
        self.alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                   message:alertMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];

        // indexPath (0,0)
        if([itemTitle isEqualToString:@"Simple"]) {
            [self makeSimpleAlert];
        }
        
        // indexPath (0,1)
        else if([itemTitle isEqualToString:@"Okay / Cancel"]) {
            [self makeOkayCancelAlert];
        }
        
        // indexPath (0,2)
        else if([itemTitle isEqualToString:@"Other"]) {
            [self makeOtherAlert];
        }
        
        // indexPath (0,3)
        else if([itemTitle isEqualToString:@"Text Entry"]) {
            [self makeTextEntryAlert];
        }
        
        // indexPath (0,4)
        else if([itemTitle isEqualToString:@"Secure Text Entry"]) {
            [self makeSecureTextEntryAlert];
        }
    }
    else if([sectionTitle isEqualToString:@"ACTION SHEET STYLE"]) {
        
        self.alertController = [UIAlertController alertControllerWithTitle:nil
                                                                    message:nil
                                                             preferredStyle:UIAlertControllerStyleActionSheet];
        
        // indexPath (1,0)
        if([itemTitle isEqualToString:@"Okay / Cancel"]) {
            [self makeOkayCancelActionSheet];
        }
        
        //indexPath (1,1)
        else if([itemTitle isEqualToString:@"Other"]) {
            [self makeOtherActionSheet];
        }
    }
    
    
    [self presentViewController:self.alertController animated:YES completion:nil];
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];

}


#pragma mark - 행 선택시 실행 메소드

- (void)makeSimpleAlert {
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:defaultAction];
}
- (void)makeOkayCancelAlert {
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:cancelAction];
    [self.alertController addAction:defaultAction];
}
- (void)makeOtherAlert {
    UIAlertAction *oneAction = [UIAlertAction actionWithTitle:@"Choice One" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    UIAlertAction *twoAction = [UIAlertAction actionWithTitle:@"Choice Two" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:oneAction];
    [self.alertController addAction:twoAction];
    [self.alertController addAction:cancelAction];
}
- (void)makeTextEntryAlert {
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"input something";
    }];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:cancelAction];
    [self.alertController addAction:defaultAction];
}
- (void)makeSecureTextEntryAlert {
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"input secret";
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:cancelAction];
    [self.alertController addAction:defaultAction];
}
- (void)makeOkayCancelActionSheet {
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:okAction];
    [self.alertController addAction:cancelAction];
}
- (void)makeOtherActionSheet {
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"Destructive Choice" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {}];
    UIAlertAction *safeAction = [UIAlertAction actionWithTitle:@"Safe Choice" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    [self.alertController addAction:destructiveAction];
    [self.alertController addAction:safeAction];
}

@end
