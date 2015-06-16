//
//  JWLDefaultSearchBarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLDefaultSearchBarViewController.h"

@interface JWLDefaultSearchBarViewController () <UISearchBarDelegate>

@end

@implementation JWLDefaultSearchBarViewController


#pragma mark - search bar delegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}
@end
