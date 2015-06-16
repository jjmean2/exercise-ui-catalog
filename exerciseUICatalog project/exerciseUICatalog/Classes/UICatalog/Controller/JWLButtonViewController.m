//
//  JWLButtonViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 9..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLButtonViewController.h"
#import "JWLButtonTableViewCell.h"


void CGRectPrint(CGRect, NSString *);

@interface JWLButtonViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation JWLButtonViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

// 지정 초기화 메소드 재정의
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        // 자원 초기화 (내비게이션바 제목, 섹션 제목)
        self.navigationItem.title = @"Buttons";
        _sectionTitles = [NSArray arrayWithObjects:
                          @"SYSTEM (TEXT)",
                          @"SYSTEM (CONTACT ADD)",
                          @"SYSTEM (DETAIL DISCOSURE)",
                          @"IMAGE",
                          @"ATTRIBUTED TEXT", nil];
        
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
// 클래스를 등록해 놓으면 dequeueReusableCellWithIdentifier: 메소드에서
// 재사용할 cell이 없을 때 등록한 클래스로 알아서 생성한다.
    [self.tableView registerClass:[JWLButtonTableViewCell class] forCellReuseIdentifier:@"JWLButtonTableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", self.view);
}
#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section %lu", indexPath.section);
    JWLButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JWLButtonTableViewCell"];
    
    if(cell.button) {
        [cell removeButton];
    }
    
    UIButton *button;
    
    if(indexPath.section == 0) {
        [cell addButtonWithType:UIButtonTypeSystem];
        button = cell.button;
        
        [button setTitle:@"Button" forState:UIControlStateNormal];
        [button sizeToFit];
    }
    else if(indexPath.section == 1) {
        [cell addButtonWithType:UIButtonTypeContactAdd];
        button = cell.button;
    }
    else if(indexPath.section == 2) {
        [cell addButtonWithType:UIButtonTypeDetailDisclosure];
        button = cell.button;

    }
    else if(indexPath.section == 3) {
        [cell addButtonWithType:UIButtonTypeSystem];
        button = cell.button;

        [button setImage:[UIImage imageNamed:@"x_icon_1x.png"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.tintColor = [UIColor colorWithRed:148.0/255 green:42.0/255 blue:255.0/255 alpha:1.0];
    }
    else if(indexPath.section == 4) {
        [cell addButtonWithType:UIButtonTypeSystem];
        button = cell.button;

        NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:@"Button"];
        NSRange rangeAll = NSMakeRange(0, [attributedTitle length]);
        [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:85.0/255 green:194.0/255 blue:255.0/255 alpha:1.0] range:rangeAll];
        [attributedTitle addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:rangeAll];
        
        [button setAttributedTitle:attributedTitle forState:UIControlStateNormal];
        
        [button sizeToFit];
        [button setTintColor:[UIColor redColor]];
        
        
    }

    CGRect bounds = cell.contentView.bounds;
    CGPoint center = CGPointMake(CGRectGetWidth(bounds)/2.0, CGRectGetHeight(bounds)/2.0);
    button.center = center;
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}



#pragma mark - 테이블뷰 Delegate

@end
