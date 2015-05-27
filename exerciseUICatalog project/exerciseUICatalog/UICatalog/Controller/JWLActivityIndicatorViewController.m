//
//  JWLViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 7..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLActivityIndicatorViewController.h"
#import "JWLActivityIndicatorTableViewCell.h"


void CGRectPrint(CGRect rect, NSString *name);


@interface JWLActivityIndicatorViewController()

@property (nonatomic, strong) NSArray *sectionTitles;

@end

@implementation JWLActivityIndicatorViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

// 지정 초기화 메소드 재정의
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    // 자원 초기화 (내비게이션바 제목, 리스트 섹션 제목)
    if(self) {
        self.navigationItem.title = @"Activity Indicators";
        _sectionTitles = [NSArray arrayWithObjects:@"GRAY", @"TINTED", nil];
        
        
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JWLActivityIndicatorTableViewCell class] forCellReuseIdentifier:@"JWLActivityIndicatorTableViewCell"];
}



#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JWLActivityIndicatorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JWLActivityIndicatorTableViewCell"];

    UIActivityIndicatorView *indicator = cell.indicator;

    // style이 TINTED(section==1)이면 보라색
    if(indexPath.section == 0) {
        indicator.color = nil;
    }
    if(indexPath.section == 1) {
        indicator.color  = [UIColor purpleColor];
    }
    [indicator startAnimating];
    indicator.hidesWhenStopped=NO;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section >=[self.sectionTitles count]) {
        section = [self.sectionTitles count]-1;
    }
    
    return self.sectionTitles[section];
    
}


#pragma mark - 테이블뷰 Delegate 메소드



@end
