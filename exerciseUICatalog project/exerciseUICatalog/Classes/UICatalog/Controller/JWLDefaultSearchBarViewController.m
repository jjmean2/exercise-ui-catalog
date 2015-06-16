//
//  JWLDefaultSearchBarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLDefaultSearchBarViewController.h"

@interface JWLDefaultSearchBarViewController () <UISearchBarDelegate>

@end

@implementation JWLDefaultSearchBarViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Default Search Bar";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.searchBarStyle = UISearchBarStyleDefault;
    searchBar.showsCancelButton = YES;
    searchBar.showsScopeBar = YES;
    searchBar.scopeButtonTitles = @[@"Scope One", @"Scope Two"];
    searchBar.delegate = self;
    [searchBar sizeToFit];
    CGRect frame = searchBar.frame;
    frame.origin.y += 20.0 + 44.0;
    searchBar.frame = frame;
    NSLog(@"%@", searchBar);
    
    [self.view addSubview:searchBar];
}

#pragma mark - search bar delegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
@end
