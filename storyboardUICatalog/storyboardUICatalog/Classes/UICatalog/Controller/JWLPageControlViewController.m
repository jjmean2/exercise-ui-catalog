//
//  JWLPageControlViewController.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

//for storyboard
#import "JWLPageControlViewController.h"


void CGRectPrint(CGRect, NSString*);

@interface JWLPageControlViewController ()

@property (nonatomic, weak) IBOutlet UIView *page;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, copy) NSArray *colors;

@end

@implementation JWLPageControlViewController

#pragma mark - property accessor method 
// lazy instantiation
- (NSArray *)colors {
    if(!_colors) {
        _colors = @[
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
    return _colors;
}

#pragma mark - 뷰 라이프 사이클
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self pageChanged:self.pageControl];
}


#pragma mark - IBAction method
- (IBAction)pageChanged:(UIPageControl *)sender {
    self.page.backgroundColor = self.colors[sender.currentPage];
}




@end
