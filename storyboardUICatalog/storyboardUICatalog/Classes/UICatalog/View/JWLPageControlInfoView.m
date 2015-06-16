//
//  JWLPageControlInfoView.m
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import "JWLPageControlInfoView.h"

@implementation JWLPageControlInfoView


#pragma mark - 뷰 라이프 사이클

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _pageView = [[UIView alloc] init];
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 3;
        [_pageControl sizeToFit];
        NSLog(@"%@", _pageControl);
        _pageControl.pageIndicatorTintColor = [UIColor greenColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
        _pageControl.autoresizingMask = UIViewAutoresizingNone;

        
        [self addSubview:_pageView];
        [self addSubview:_pageControl];
    }
    return self;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    UIPageControl *control = self.pageControl;
    control.numberOfPages = numberOfPages;
    
    CGRect frame = control.frame;
    frame.size = [control sizeForNumberOfPages:numberOfPages];
    control.frame = frame;
    
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    UITabBarController *tbc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nc = tbc.viewControllers[0];
    
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat tabBarHeight = tbc.tabBar.frame.size.height;
    CGFloat navigationBarHeight = nc.navigationBar.frame.size.height;
    
    NSLog(@"%f, %f, %f", statusBarHeight, navigationBarHeight, tabBarHeight);
    
    
    
    CGRect innerFrame = frame;
/*
    if(innerFrame.size.height>innerFrame.size.width) {
        innerFrame.size.height -= 20.0 + 44.0 + 49.0;
        innerFrame.origin.y += 20.0 + 44.0;
    }
    else {
        innerFrame.size.height -= 32.0 + 49.0;
        innerFrame.origin.y += 32.0;
    }
*/
    innerFrame.size.height -= statusBarHeight + navigationBarHeight + tabBarHeight;
    innerFrame.origin.y += statusBarHeight + navigationBarHeight;
    
    
    CGRect subviewFrame = self.pageControl.frame;
    subviewFrame.origin.x = innerFrame.origin.x + (innerFrame.size.width - subviewFrame.size.width)/2.0;
    subviewFrame.origin.y = innerFrame.origin.y + (innerFrame.size.height - subviewFrame.size.height);
    self.pageControl.frame = subviewFrame;
    
    CGFloat insetValue = subviewFrame.size.height;
    subviewFrame = CGRectInset(innerFrame, insetValue, insetValue);
    self.pageView.frame = subviewFrame;
    
}


@end
