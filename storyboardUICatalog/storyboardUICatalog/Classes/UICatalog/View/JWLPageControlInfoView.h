//
//  JWLPageControlInfoView.h
//  exerciseUICatalog
//
//  Created by ljw on 2015. 5. 11..
//  Copyright (c) 2015년 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWLPageControlInfoView : UIView

@property (nonatomic, strong) UIView *pageView;
@property (nonatomic, strong) UIPageControl *pageControl;

- (void)setNumberOfPages:(NSInteger)numberOfPages;
@end
