//
//  JWLSearchBarEmbeddedInNavigationBarControllerTableViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLSearchBarEmbeddedInNavigationBarControllerTableViewController.h"

@interface JWLSearchBarEmbeddedInNavigationBarControllerTableViewController () <UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, copy) NSArray *tableData;
@property (nonatomic, copy) NSArray *searchData;
@end

@implementation JWLSearchBarEmbeddedInNavigationBarControllerTableViewController

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
    UITableViewController *resultController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    resultController.tableView.dataSource = self;
    [resultController.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    self.navigationItem.titleView = self.searchController.searchBar;
    self.definesPresentationContext = YES;

}



#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.tableView) {
        return [self.tableData count];
    }
    else {
        return [self.searchData count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    if(tableView == self.tableView) {
        cell.textLabel.text = self.tableData[indexPath.row];
    }
    else {
        cell.textLabel.text = self.searchData[indexPath.row];
    }
    
    return cell;
}


#pragma mark - search result updater
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
    self.searchData = [self.tableData filteredArrayUsingPredicate:predicate];
    UITableViewController *resultController = (UITableViewController *)searchController.searchResultsController;
    [resultController.tableView reloadData];
    NSLog(@"%@, presenting %@", self.searchController.presentingViewController, self.searchController);
}

#pragma mark - search controller delegate
- (void)willDismissSearchController:(UISearchController *)searchController {
    [searchController.searchResultsController dismissViewControllerAnimated:YES completion:nil];
}

@end
