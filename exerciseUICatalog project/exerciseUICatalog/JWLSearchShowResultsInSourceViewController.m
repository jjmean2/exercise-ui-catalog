//
//  JWLSearchShowResultsInSourceViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSearchShowResultsInSourceViewController.h"

@interface JWLSearchShowResultsInSourceViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, strong) NSArray *searchData;

@end

@implementation JWLSearchShowResultsInSourceViewController


#pragma mark - view controller life cycle
- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.navigationItem.title = @"Results in Searched Controller";
        NSString *text = @"Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Becuase they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do.";
        _tableData = [text componentsSeparatedByString:@" "];
        _searchData = _tableData;
    }
    return self;
}


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = self.searchController.searchBar;

    NSLog(@"%@", self.searchController.searchBar);
    NSLog(@"%@", self.view);
    
}

#pragma mark - table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = self.searchData[indexPath.row];
    
    return cell;
    
}




#pragma mark - search bar delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if([searchText length]==0) {
        self.searchData = self.tableData;
    }
    else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
        self.searchData = [self.tableData filteredArrayUsingPredicate:predicate];
    }
    NSLog(@"presenting %@", self.searchController.presentingViewController);

    [self.tableView reloadData];
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchData = self.tableData;
    [self.tableView reloadData];
}


@end
