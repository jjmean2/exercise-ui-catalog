//
//  JWLCustomSearchBarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLCustomSearchBarViewController.h"
#import "UIColor+TintColor.h"

@interface JWLCustomSearchBarViewController () <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@end

@implementation JWLCustomSearchBarViewController


#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.searchBar setImage:[UIImage imageNamed:@"bookmark_icon"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    [self.searchBar setImage:[UIImage imageNamed:@"bookmark_icon_highlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];

}

#pragma mark - search bar delegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}


@end
