//
//  JWLSearchShowResultsInSourceViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLSearchShowResultsInSourceViewController.h"

@interface JWLSearchShowResultsInSourceViewController () <UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, copy) NSArray *tableData;
@property (nonatomic, copy) NSArray *searchData;
@property (nonatomic, getter=isSearching) BOOL searching;

@end

@implementation JWLSearchShowResultsInSourceViewController


#pragma mark - property accessor method
// lazy instantiation
- (NSArray *)tableData {
    if(!_tableData) {
        NSString *text = @"Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Becuase they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do.";
        _tableData = [text componentsSeparatedByString:@" "];
    }
    return _tableData;
}


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searching = NO;
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    
    
}


#pragma mark - table view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.isSearching == NO)
        return [self.tableData count];
    else
        return [self.searchData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(self.isSearching == NO)
        cell.textLabel.text = self.tableData[indexPath.row];
    else
        cell.textLabel.text = self.searchData[indexPath.row];
    
    return cell;
}


#pragma mark - search result updater
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    if([searchText length] == 0) {
        self.searching = NO;
    }
    else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
        self.searchData = [self.tableData filteredArrayUsingPredicate:predicate];
        self.searching = YES;
    }
    [self.tableView reloadData];
}


@end
