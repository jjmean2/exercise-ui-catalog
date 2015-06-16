//
//  JWLSearchListViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSearchListViewController.h"
#import "JWLDefaultSearchBarViewController.h"
#import "JWLCustomSearchBarViewController.h"
#import "JWLSearchPresentOverNavigationBarViewController.h"
#import "JWLSearchBarEmbeddedInNavigationBarControllerTableViewController.h"
#import "JWLSearchShowResultsInSourceViewController.h"

@interface JWLSearchListViewController ()

@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) NSMutableArray *searchList;


@end

@implementation JWLSearchListViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.navigationItem.title = @"Search";
        _sectionTitles = @[@"Search Bars", @"Search Controllers"];
        _searchList = [[NSMutableArray alloc] init];
        [_searchList addObject:@[
                                 @[@"Default", @"JWLDefaultSearchBarViewController"],
                                 @[@"Custom", @"JWLCustomSearchBarViewController"]
                                 ]];
        [_searchList addObject:@[
                                 @[@"Present Over Navigation Bar", @"JWLSearchPresentOverNavigationBarViewController"],
                                 @[@"Search Bar Embedded in Navigation Bar", @"JWLSearchBarEmbeddedInVavigationBarController"],
                                 @[@"Results in Searched Controller", @"JWLSearchShowResultsInSourceViewController"]
                                 ]];
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클


#pragma mark - 테이블뷰 data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchList[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = self.sectionTitles[section];
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellSubtitle"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCellSubtitle"];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0];
    cell.textLabel.text = self.searchList[indexPath.section][indexPath.row][0];
    cell.detailTextLabel.text = self.searchList[indexPath.section][indexPath.row][1];
    
    return cell;
}

#pragma mark - 테이블뷰 delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self showDefaultSearchBar];
                break;
            case 1:
                [self showCustomSearchBar];
                break;
            default:
                break;
        }
    }
    else if(indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                [self showPresentOverNavigationBar];
                break;
            case 1:
                [self showSearchBarEmbeddedInNavigationBar];
                break;
            case 2:
                [self showSearchShowResultsInSourceViewController];
                break;
            default:
                break;
        }
    }
}

#pragma mark - custom method

- (void)showDefaultSearchBar {
    JWLDefaultSearchBarViewController *defaultSearchBarVC = [[JWLDefaultSearchBarViewController alloc] init];
    [self.navigationController pushViewController:defaultSearchBarVC animated:YES];
}

- (void)showCustomSearchBar {
    JWLCustomSearchBarViewController *customSearchBarVC = [[JWLCustomSearchBarViewController alloc] init];
    [self.navigationController pushViewController:customSearchBarVC animated:YES];
}

- (void)showPresentOverNavigationBar {
    JWLSearchPresentOverNavigationBarViewController *vc = [[JWLSearchPresentOverNavigationBarViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showSearchBarEmbeddedInNavigationBar {
    JWLSearchBarEmbeddedInNavigationBarControllerTableViewController *vc = [[JWLSearchBarEmbeddedInNavigationBarControllerTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showSearchShowResultsInSourceViewController {
    JWLSearchShowResultsInSourceViewController *vc = [[JWLSearchShowResultsInSourceViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 회전방향 지원

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
