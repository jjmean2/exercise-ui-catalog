//
//  JWLProgressViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 15..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLProgressViewController.h"
#import "JWLProgressViewTableViewCell.h"

@interface JWLProgressViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *progressTimes;
@property (nonatomic) int currentTimeIndex;

@end

@implementation JWLProgressViewController

#pragma mark - 뷰컨트롤러 라이프 사이클
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self) {
        self.navigationItem.title = @"Progress Views";
        
        _sectionTitles = @[@"DEFAULT", @"BAR", @"TINTED"];
        
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for(int i=0; i<9; i++) {
            [temp addObject:[NSNumber numberWithFloat:(arc4random()%100)/100.0]];
        }
        [temp addObject:[NSNumber numberWithFloat:1.0]];
        
        NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:@"floatValue" ascending:YES];
        _progressTimes = [temp sortedArrayUsingDescriptors:@[ascending]];
        
        _currentTimeIndex = 0;
        

        
        
        
    }
    return self;
}


#pragma mark - 뷰 라이프 사이클
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JWLProgressViewTableViewCell class] forCellReuseIdentifier:@"JWLProgressViewTableViewCell"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
    [self.timer invalidate];
}


#pragma mark - 테이블뷰 Data source 메소드

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JWLProgressViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JWLProgressViewTableViewCell" forIndexPath:indexPath];
    
    UIProgressView *progressView = cell.progressView;
  
    switch (indexPath.section) {
        case 0:
            progressView.progressViewStyle = UIProgressViewStyleDefault;
            break;
        case 1:
            progressView.progressViewStyle = UIProgressViewStyleBar;
            break;
        case 2:
            progressView.progressViewStyle = UIProgressViewStyleBar;
            progressView.progressTintColor = [UIColor colorWithRed:148.0/255 green:42.0/255 blue:255.0/255 alpha:1.0];
            progressView.trackTintColor = [UIColor colorWithRed:85.0/255 green:194.0/255 blue:255.0/255 alpha:1.0];
            break;
        default:
            break;
    }
    NSNumber *progressTime = self.progressTimes[self.currentTimeIndex];
    progressView.progress = progressTime.floatValue;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.sectionTitles[section];
    return title;
}





#pragma mark - 실행 메소드


- (void)increaseProgress {

    self.currentTimeIndex++;
    if(self.currentTimeIndex >= [self.progressTimes count]) {
        [self.timer invalidate];
        return;
    }
    
    for (NSUInteger section = 0; section <[self.sectionTitles count]; section++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
        JWLProgressViewTableViewCell *cell = (JWLProgressViewTableViewCell *) [self.tableView cellForRowAtIndexPath:indexPath];
        if(cell) {
            NSLog(@"Cell exist");
            NSNumber *progressTime = self.progressTimes[self.currentTimeIndex];
            cell.progressView.progress = progressTime.floatValue;
            
        }
    }

    
}

- (void)dealloc {
    NSLog(@"%@ dealloc" , self);
}

@end
