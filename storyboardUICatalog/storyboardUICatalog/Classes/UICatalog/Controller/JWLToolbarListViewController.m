//
//  JWLToolbarListViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLToolbarListViewController.h"
#import "JWLDefaultToolbarViewController.h"
#import "JWLTintedToolbarViewController.h"
#import "JWLCustomToolbarViewController.h"


@interface JWLToolbarListViewController ()

@property (nonatomic, strong) NSArray *toolbarList;

@end

@implementation JWLToolbarListViewController

#pragma mark - view controller life cycle
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.navigationItem.title = @"Toolbars";
        _toolbarList = @[
                         @[@"Default", @"JWLDefaultToolbarViewController"],
                         @[@"Tinted", @"JWLTintedToolbarViewController"],
                         @[@"Custom", @"JWLCustomToolbarViewController"]
                         ];
    }
    return self;
}


#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toolbarList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellSubtitle"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellSubtitle"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0];
    
    cell.textLabel.text = self.toolbarList[indexPath.row][0];
    cell.detailTextLabel.text = self.toolbarList[indexPath.row][1];
    
    return cell;
}


#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self showDefaultToolbar];
            break;
            
        case 1:
            [self showTintedToolbar];
            break;
            
        case 2:
            [self showCustomToolbar];
            break;
            
        default:
            break;
    }
}

#pragma mark - custom method

- (void)showDefaultToolbar {
    JWLDefaultToolbarViewController *vc = [[JWLDefaultToolbarViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showTintedToolbar {
    JWLTintedToolbarViewController *vc = [[JWLTintedToolbarViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showCustomToolbar {
    JWLCustomToolbarViewController *vc = [[JWLCustomToolbarViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
