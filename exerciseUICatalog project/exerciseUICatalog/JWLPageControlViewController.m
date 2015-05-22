//
//  JWLPageControlViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLPageControlViewController.h"
#import "JWLPageControlInfoView.h"


void CGRectPrint(CGRect, NSString*);

@interface JWLPageControlViewController ()

@property (nonatomic, strong) UIView *pageView;
@property (nonatomic, strong) NSArray *pageColors;

@end

@implementation JWLPageControlViewController

#pragma mark - 뷰컨트롤러 라이프 사이클

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.navigationItem.title = @"Page Control";
        _pageColors = @[
                        [UIColor blackColor],
                        [UIColor darkGrayColor],
                        [UIColor redColor],
                        [UIColor greenColor],
                        [UIColor blueColor],
                        [UIColor cyanColor],
                        [UIColor yellowColor],
                        [UIColor magentaColor],
                        [UIColor orangeColor],
                        [UIColor purpleColor]
                        ];
    }
    return self;
}

#pragma mark - 뷰 라이프 사이클

- (void)loadView {

    JWLPageControlInfoView *view = [[JWLPageControlInfoView alloc] init];
    [view setNumberOfPages:[self.pageColors count]];
    self.pageView = view.pageView;
    self.pageView.backgroundColor = self.pageColors[view.pageControl.currentPage];
    
    [view.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.view = view;

    
}


#pragma mark - UIControl(Page Control) Action 메소드

- (void)pageChanged:(UIPageControl *)sender {
    self.pageView.backgroundColor = self.pageColors[sender.currentPage];
}




@end
