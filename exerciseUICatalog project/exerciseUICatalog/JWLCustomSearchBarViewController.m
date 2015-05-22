//
//  JWLCustomSearchBarViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 19..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLCustomSearchBarViewController.h"
#import "UIColor+TintColor.h"

@interface JWLCustomSearchBarViewController () <UISearchBarDelegate>

@end

@implementation JWLCustomSearchBarViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Custom Search Bar";
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.backgroundImage = [UIImage imageNamed:@"search_bar_bg_1x"];
    searchBar.showsCancelButton = YES;
    searchBar.showsBookmarkButton = YES;
    [searchBar setImage:[UIImage imageNamed:@"bookmark_icon_1x"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    searchBar.tintColor = [UIColor wineColor];
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

#pragma mark - 회전방향 지원




@end
